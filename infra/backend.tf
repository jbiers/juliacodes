terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "juliacodes-infra"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}