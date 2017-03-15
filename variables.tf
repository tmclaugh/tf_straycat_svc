/*
* Our vars.
*/
variable "svc_name" {
  type = "string"
  description = "Name of service being deployed"
}

variable "aws_account" {
  type = "string"
  description = "AWS Account"
}

variable "aws_region" {
  type = "string"
  description = "AWS region"
}

variable "aws_s3_prefix" {
  type = "string"
  description = "AWS S3 bucket prefix"
  default = "straycat-dhs-org"
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

variable "security_group_service_ingress_external" {
  type = "map"
  description = "Service ingress rule; external traffic."
  default = {}
}

variable "security_group_service_ingress_internal" {
  type = "map"
  description = "Service ingress rule; internal traffic."
  default = {}
}

variable "ami_id" {
  type = "string"
  description = "AMI ID for instances"
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
  default = ""
}

## For finding data source info
variable "domain" {
  type = "string"
  description = "Environment's domain name"
  default = "straycat.dhs.org"
}

variable "domain_net" {
  type = "string"
  description = "All hosts exists in a global DNS namespace."
  default = "straycat-net.dhs.org"
}

# Easier to use this over calculating based on VPC range.
#
# FIXME: Not currently used anywhere.
variable "nameserver" {
  type = "string"
  description = "Nameserver address"
  default = "169.254.169.253"
}



