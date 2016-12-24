/*
* Our vars.
*/
variable "svc_name" {
  type = "string"
  description = "Name of service being deployed"
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

# FIXME: We should be asking infrastructure for this information
variable "aws_availability_zones" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
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
variable "domain" {}

variable "environment" {}

variable "aws_region" {}


