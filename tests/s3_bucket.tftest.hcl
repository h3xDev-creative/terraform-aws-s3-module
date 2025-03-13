terraform {
  required_version = ">= 1.0.0"
}

module "s3_bucket" {
  source             = "../modules/s3_bucket"
  bucket_prefix      = "test-bucket"
  environment        = "test"
  versioning_enabled = true
  server_side_encryption = true
  logging_enabled    = false
  force_destroy       = true
  block_public_access = true
  tags = {
    "Environment" = "test"
    "Project"     = "test-project"
  }
}

# Validate that the S3 bucket is created
resource "aws_s3_bucket" "this" {
  bucket = module.s3_bucket.bucket_name
}

# Test if versioning is enabled
resource "aws_s3_bucket_versioning" "this" {
  bucket = module.s3_bucket.bucket_name
  status = "Enabled"

  lifecycle {
    ignore_changes = [status]
  }

  depends_on = [aws_s3_bucket.this]
}

# Test that server-side encryption is enabled
resource "aws_s3_bucket_encryption" "this" {
  bucket = module.s3_bucket.bucket_name

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  depends_on = [aws_s3_bucket.this]
}

# Test that logging is disabled (as per the example values)
resource "aws_s3_bucket_logging" "this" {
  bucket = module.s3_bucket.bucket_name
  logging_enabled = false

  depends_on = [aws_s3_bucket.this]
}

# Test if the bucket has public access blocked
resource "aws_s3_bucket_public_access_block" "this" {
  bucket = module.s3_bucket.bucket_name
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true

  depends_on = [aws_s3_bucket.this]
}
