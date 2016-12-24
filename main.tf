/*
* Resources
*/

resource "aws_security_group" "sg" {
  name        = "${var.svc_name}"
  description = "${var.svc_name} hosts"
  vpc_id      = "${data.terraform_remote_state.infrastructure.vpc_private.vpc_id}"

  ingress {
    from_port         = 8080
    to_port           = 8080
    protocol          = "tcp"
    security_groups   = [
      "${data.terraform_remote_state.infrastructure.vpc_private.default_security_group_id}"
    ]
  }

  tags = {
    Name      = "${var.svc_name} hosts"
    terraform = "true"
  }
}

resource "aws_launch_configuration" "lc" {
  name_prefix   = "${var.svc_name}-"
  image_id      = "${var.ami_id}"
  instance_type = "${var.instance_type}"

  lifecycle {
    create_before_destroy = true
  }

  security_groups = [
    "${data.terraform_remote_state.infrastructure.vpc_private.default_security_group_id}",
    "${aws_security_group.sg.id}"
  ]
}

resource "aws_autoscaling_group" "asg" {
  #availability_zones   = "${var.aws_availability_zones}"
  vpc_zone_identifier   = ["${data.terraform_remote_state.infrastructure.vpc_private.subnet_ids_private}"]
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
}
