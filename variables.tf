/*
* Our vars.
*/
variable "svc_name" {
  type = "string"
  description = "Name of service being deployed"
}

variable "account_id" {
  type = "string"
  description = "Account ID"
}

variable "subnet_type" {
  type = "string"
  description = "private v. public subnet."
}

variable "asg_min_size" {
  type = "string"
  description = "Min size of ASG."
}

variable "asg_max_size" {
  type = "string"
  description = "Maz size of ASG."
}

variable "asg_desired_capacity" {
  type = "string"
  description = "Desired instances in ASG."
}

# FIXME: infrastructure should be providing this to us.
variable "ami_id" {
  type = "string"
  description = "<`2AMI ID for instances`>"
  default = "ami-b73b63a0"
}

variable "instance_type" {
  type = "string"
  description = "Instance type for bastion host."
  default = "t2.micro"
}

variable "instance_key_name" {
  type = "string"
  description = "SSH key for instance"
}

## For finding data source info
variable "domain" {
  type = "string"
  description = ""
}

variable "environment" {}

variable "aws_region" {}


