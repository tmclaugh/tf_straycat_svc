data "terraform_remote_state" "infrastructure" {
  backend = "s3"
  config = {
    bucket  = "${var.domain}-${var.environment}-terraform"
    key     = "infrastructure/terraform.tfstate"
    region  = "${var.aws_region}"
  }
}

