terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "terraform-state-rasika-dev"
    key    = "ecr/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-state-lock"
  }
}

provider "aws" {
  region = "ap-south-1"
}
