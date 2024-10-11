output "aws_region" {
  value       = var.region
  description = "The AWS region"
}

output "GHA_role_name" {
  description = "GHA Role Name"
  value       = aws_iam_role.terraform_gha_role.name
  sensitive   = false
}

output "GHA_role_arn" {
  description = "GHA Role ARN"
  value       = aws_iam_role.terraform_gha_role.arn
  sensitive   = true
}
