terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
  }
  backend "s3" {
     bucket         = var.bucket_name
     key            = "terraform.tfstate"
     region         = var.region
     encrypt        = "true"
  }
}
