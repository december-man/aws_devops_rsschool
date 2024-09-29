terraform {
   backend "s3" {
      bucket         = "var.bucket_name"
      key            = "terraform.tfstate"
      region         = "var.region"
      encrypt        = "true"
   }
}
