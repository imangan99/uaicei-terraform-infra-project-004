terraform {
  backend "s3" {
    bucket         = "tfstate-remote-backend-000004"
    key            = "jupiter-statefile"
    region         = "us-east-2"
    dynamodb_table = "jupiter-state-locking-000004"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source         = "./vpc"
  vpc_cidr_block = var.vpc_cidr_block
  tags           = local.project_tags
}