terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.3"
  backend "s3" {
    bucket = "ecs-threat-modeler-tf-state"
    key    = "terraform.tfstate"
    region = "eu-west-2"
    # dynamodb_table = "terraform-locks"
    encrypt = true
  }
}

provider "aws" {
  region = var.aws_region
}
