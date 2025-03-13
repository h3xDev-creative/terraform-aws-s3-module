variable "bucket_prefix" {
  description = "Prefix for the S3 bucket name"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "versioning_enabled" {
  description = "Enable or disable versioning for the S3 bucket"
  type        = bool
  default     = true
}

variable "server_side_encryption" {
  description = "Enable or disable server-side encryption using S3-managed keys (SSE-S3)"
  type        = bool
  default     = true
}

variable "logging_enabled" {
  description = "Enable or disable S3 access logging"
  type        = bool
  default     = false
}

variable "logging_target_bucket" {
  description = "Target bucket for S3 access logs"
  type        = string
  default     = ""
}

variable "logging_target_prefix" {
  description = "Prefix for S3 access logs"
  type        = string
  default     = "logs/"
}

variable "force_destroy" {
  description = "Force destruction of the S3 bucket"
  type        = bool
  default     = false
}

variable "block_public_access" {
  description = "Whether to block all public access to the bucket"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to assign to the bucket"
  type        = map(string)
  default     = {}
}
