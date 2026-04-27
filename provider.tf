terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    bucket         = "terraform-state-file-ani" 
    key            = "state/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-locking" 
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}