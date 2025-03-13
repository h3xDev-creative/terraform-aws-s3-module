provider "aws" {
  region = "us-east-1"
}

module "s3_bucket" {
  source             = "../../modules/s3_bucket"
  bucket_prefix      = "my-example-bucket"
  environment        = "dev"
  versioning_enabled = true
  server_side_encryption = true
  logging_enabled    = true
  logging_target_bucket = "my-log-bucket"
  logging_target_prefix = "logs/"
  force_destroy       = false
  block_public_access = true
  tags = {
    "Environment" = "dev"
    "Project"     = "example-project"
  }
}

output "bucket_name" {
  value = module.s3_bucket.bucket_name
}

output "bucket_arn" {
  value = module.s3_bucket.bucket_arn
}
