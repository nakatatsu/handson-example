# This file is for practice purposes only and should not be used otherwise.

terraform {
  required_version = "= 1.12.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.97.0"
    }
  }

  backend "s3" {
    bucket         = "experimental-handson-terraform-state"
    key            = "handson-claude-code/terraform.tfstate"
    region         = "ap-northeast-1"
  }
}

provider "aws" {
  region  = "ap-northeast-1"

  default_tags {
    tags = {
      Project     = "handson"
      Environment = "experimental"
    }
  }
}

provider "aws" {
  alias   = "us_east_1"
  region  = "us-east-1"

  default_tags {
    tags = {
      Project     = "handson"
      Environment = "experimental"
    }
  }
}
