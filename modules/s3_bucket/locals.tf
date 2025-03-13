locals {
  # Generate a random suffix for the S3 bucket name to ensure uniqueness
  random_suffix = substr(md5(random_id.suffix.hex), 0, 6)

  # Construct the full bucket name by combining the prefix with the random suffix
  bucket_name = "${var.bucket_prefix}-${var.environment}-${local.random_suffix}"

  # Construct the log bucket name if logging is enabled
  log_bucket_name = var.logging_enabled && var.logging_target_bucket != "" ? var.logging_target_bucket : null

  # Generate the log prefix
  log_prefix = var.logging_enabled && var.logging_target_prefix != "" ? var.logging_target_prefix : "logs/"

  # Default tags applied to the bucket
  default_tags = merge(
    {
      "Environment" = var.environment
      "Project"     = "example-project"
    },
    var.tags
  )
}
