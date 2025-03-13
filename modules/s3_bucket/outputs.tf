output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.this.bucket
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.this.arn
}

output "bucket_id" {
  description = "The ID of the S3 bucket"
  value       = aws_s3_bucket.this.id
}

output "website_endpoint" {
  description = "The website endpoint of the S3 bucket (if static website hosting is enabled)"
  value       = aws_s3_bucket.this.website_endpoint
  condition   = var.website_enabled == true
}

output "logging_bucket" {
  description = "The target S3 bucket for access logs (if logging is enabled)"
  value       = aws_s3_bucket.logging_bucket.bucket
  condition   = var.logging_enabled == true
}

output "logging_bucket_arn" {
  description = "The ARN of the target S3 bucket for access logs (if logging is enabled)"
  value       = aws_s3_bucket.logging_bucket.arn
  condition   = var.logging_enabled == true
}
