terraform {
  required_version = ">= 1.0.0"

  provider "aws" {
    version = "~> 4.0"
    region  = var.region
  }
}

provider "random" {
  version = "~> 3.0"
}
