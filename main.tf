terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
  }
  backend "s3" {
    bucket  = "aws-devops-terraform-backend"
    key     = "terraform.tfstate"
    region  = "eu-central-1"
    encrypt = "true"
  }
}
