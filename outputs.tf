/*
* outputs
*/

output "instance_type" {
  value = "${var.instance_type}"
}

output "image_id" {
  value = "${var.ami_id}"
}

output "launch_config_id" {
  value = "${aws_launch_configuration.lc.id}"
}

output "autoscaling_group_id" {
  value = "${aws_autoscaling_group.asg.id}"
}

output "autoscaling_group_name" {
  value = "${aws_autoscaling_group.asg.name}"
}

output "autoscaling_group_availability_zones" {
  value = "${aws_autoscaling_group.asg.availability_zones}"
}

output "autoscaling_group_min_size" {
  value = "${aws_autoscaling_group.asg.min_size}"
}

output "autoscaling_group_max_size" {
  value = "${aws_autoscaling_group.asg.max_size}"
}

output "autoscaling_group_desired_capacity" {
  value = "${aws_autoscaling_group.asg.desired_capacity}"
}

output "autoscaling_group_launch_configuration" {
  value = "${aws_autoscaling_group.asg.launch_configuration}"
}

output "autoscaling_group_vpc_zone_identifier" {
  value = "${aws_autoscaling_group.asg.vpc_zone_identifier}"
}

output "iam_role_arn" {
  value = "${aws_iam_role.role.arn}"
}

output "iam_role_name" {
  value = "${aws_iam_role.role.name}"
}

output "iam_instance_profile_arn" {
  value = "${aws_iam_instance_profile.profile.arn}"
}

output "iam_instance_profile_name" {
  value = "${aws_iam_instance_profile.profile.name}"
}

output "iam_instance_profile_roles" {
  value = "${aws_iam_instance_profile.profile.roles}"
}

output "security_group_id" {
  value = "${aws_security_group.sg.id}"
}

output "security_group_vpc_id" {
  value = "${aws_security_group.sg.vpc_id}"
}

output "security_group_name" {
  value = "${aws_security_group.sg.name}"
}

