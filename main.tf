/*
* Resources
*/

resource "aws_security_group" "sg" {
  name        = "${var.svc_name}"
  description = "${var.svc_name} hosts"
  vpc_id = "${data.terraform_remote_state.aws_vpc.vpc.vpc_id}"

  tags = {
    Name      = "${var.svc_name} hosts"
    terraform = "true"
  }
}

resource "aws_security_group_rule" "service_ingress_external" {
  # The length of a map is the number of k,v pairs. If it's not empty then
  # count should be just 1.  I wish this was more flexible but here I am now.
  count                     = "${length(var.security_group_service_ingress_external) > 0 ? 1 : 0}"
  type                      = "ingress"
  from_port                 = "${var.security_group_service_ingress_external["from_port"]}"
  to_port                   = "${var.security_group_service_ingress_external["to_port"]}"
  protocol                  = "${var.security_group_service_ingress_external["protocol"]}"
  security_group_id         = "${aws_security_group.sg.id}"
  cidr_blocks               = ["${var.security_group_service_ingress_external["cidr_block"]}"]
}

resource "aws_security_group_rule" "service_ingress_internal" {
  # The length of a map is the number of k,v pairs. If it's not empty then
  # count should be just 1.  I wish this was more flexible but here I am now.
  count                     = "${length(var.security_group_service_ingress_internal) > 0 ? 1 : 0}"
  type                      = "ingress"
  from_port                 = "${var.security_group_service_ingress_internal["from_port"]}"
  to_port                   = "${var.security_group_service_ingress_internal["to_port"]}"
  protocol                  = "${var.security_group_service_ingress_internal["protocol"]}"
  security_group_id         = "${aws_security_group.sg.id}"
  source_security_group_id  = "${
    data.terraform_remote_state.aws_vpc.vpc.default_security_group_ids[
      var.security_group_service_ingress_internal["security_group_id_access"]
    ]
  }"
}

resource "aws_iam_role" "role" {
  name = "svc-${var.svc_name}"
  path = "/service/"

  assume_role_policy  = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "profile" {
  name  = "svc-${var.svc_name}"
  path  = "/service/"
  roles = ["${aws_iam_role.role.name}"]
}

resource "aws_launch_configuration" "lc" {
  name_prefix           = "${var.svc_name}-"
  image_id              = "${var.ami_id}"
  instance_type         = "${var.instance_type}"
  iam_instance_profile  = "${aws_iam_instance_profile.profile.name}"
  key_name              = "${var.instance_key_name == "default" ? data.terraform_remote_state.aws_iam.aws_key_pair_admin_key_key_name: var.instance_key_name}"

  user_data = "${data.template_file.cloud_init.rendered}"

  lifecycle {
    create_before_destroy = true
  }

  security_groups = [
    "${data.terraform_remote_state.aws_vpc.vpc.default_security_group_id}",
    "${data.terraform_remote_state.aws_vpc.vpc.default_security_group_ids[var.subnet_type]}",
    "${aws_security_group.sg.id}"
  ]
}

resource "aws_autoscaling_group" "asg" {
  availability_zones    = ["${data.terraform_remote_state.aws_vpc.vpc.subnet_availability_zones[var.subnet_type]}"]
  vpc_zone_identifier   = [
    "${data.terraform_remote_state.aws_vpc.vpc.subnet_ids[var.subnet_type]}"
  ]
  name                  = "${var.svc_name}"
  min_size              = "${var.asg_min_size}"
  max_size              = "${var.asg_max_size}"
  desired_capacity      = "${var.asg_desired_capacity}"
  force_delete          = true
  launch_configuration  = "${aws_launch_configuration.lc.name}"

  tag {
    key                 = "terraform"
    value               = "true"
    propagate_at_launch = true
  }

  tag {
    key                 = "Name"
    value               = "${var.svc_name}"
    propagate_at_launch = true
  }
}
