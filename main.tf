terraform {
   backend "s3" {
      bucket         = "var.bucket_name"
      key            = "terraform.tfstate"
      region         = "eu-central-1"
      encrypt        = "true"
   }
}
