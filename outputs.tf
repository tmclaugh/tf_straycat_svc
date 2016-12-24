/*
* outputs
*/

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

output "security_group_id" {
  value = "${aws_security_group.sg.id}"
}

output "security_group_vpc_id" {
  value = "${aws_security_group.sg.vpc_id}"
}

output "security_group_ingress" {
  value = "${aws_security_group.sg.ingress}"
}

output "security_group_egress" {
  value = "${aws_security_group.sg.egress}"
}

output "security_group_name" {
  value = "${aws_security_group.sg.name}"
}

