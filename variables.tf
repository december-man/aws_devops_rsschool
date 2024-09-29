variable "bucket_name" {
   description = "Backend S3 bucket"
   type = string
}

variable "region" {
   description = "AWS region"
   type = string
}

variable "gha_role" {
  description = "IAM role used by GitHub Actions"
  type        = string
  default     = "GithubActionsRole"
}

variable "iam_policies" {
  description = "List of Required IAM Policies"
  type        = list(string)
  default = [
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    "arn:aws:iam::aws:policy/AmazonRoute53FullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/IAMFullAccess",
    "arn:aws:iam::aws:policy/AmazonVPCFullAccess",
    "arn:aws:iam::aws:policy/AmazonSQSFullAccess",
    "arn:aws:iam::aws:policy/AmazonEventBridgeFullAccess",
    "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  ]
}
