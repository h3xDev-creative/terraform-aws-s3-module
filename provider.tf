terraform {
  required_version = ">= 1.0.0"
}

provider "aws" {
  # Set the region for the AWS provider
  region = var.region

  # Retrieve AWS credentials from HashiCorp Vault
  access_key = data.vault_generic_secret.aws_credentials.data["access_key"]
  secret_key = data.vault_generic_secret.aws_credentials.data["secret_key"]
}

# Fetch AWS credentials from HashiCorp Vault
data "vault_generic_secret" "aws_credentials" {
  path = "secret/data/aws"  # Path in Vault where AWS credentials are stored
}

# Define the region as a variable
variable "region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-east-1"
}
