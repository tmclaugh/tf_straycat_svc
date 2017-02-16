data "terraform_remote_state" "aws_vpc" {
  backend = "s3"
  config = {
    bucket  = "${var.domain}-${var.account_id}-terraform"
    key     = "aws_vpc.tfstate"
    region  = "${var.aws_region}"
  }
}

