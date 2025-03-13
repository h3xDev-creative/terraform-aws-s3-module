output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = module.s3_bucket.bucket_name
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = module.s3_bucket.bucket_arn
}

output "bucket_id" {
  description = "The ID of the S3 bucket"
  value       = module.s3_bucket.bucket_id
}

output "website_endpoint" {
  description = "The website endpoint of the S3 bucket (if static website hosting is enabled)"
  value       = module.s3_bucket.website_endpoint
  condition   = module.s3_bucket.website_endpoint != ""
}

output "logging_bucket" {
  description = "The target S3 bucket for access logs (if logging is enabled)"
  value       = module.s3_bucket.logging_bucket
  condition   = module.s3_bucket.logging_bucket != ""
}

output "logging_bucket_arn" {
  description = "The ARN of the target S3 bucket for access logs (if logging is enabled)"
  value       = module.s3_bucket.logging_bucket_arn
  condition   = module.s3_bucket.logging_bucket_arn != ""
}
