# Terraform AWS S3 Module

## Overview

This Terraform module creates and manages an **Amazon S3 bucket** with configurable settings, such as versioning, encryption, and logging. It is designed for **scalability** and **reusability** in AWS infrastructure.

## Features

- Create an S3 bucket with optional random suffixes
- Enable or disable bucket versioning
- Configure encryption with AWS KMS or AES256
- Set up logging to another S3 bucket
- Support for public or private access settings
- Option to enable website hosting

## File Structure

```
terraform-aws-s3-module/
├── README.md                # Documentation for module usage, inputs, outputs, and examples
├── LICENSE                  # GNU General Public License v2.0
├── .gitignore               # Files and directories to ignore in Git
├── modules/
│   └── s3_bucket/           # The reusable S3 bucket module
│       ├── main.tf          # Resources: S3 bucket, random suffix, conditionals for features
│       ├── variables.tf     # Input variable definitions (bucket_prefix, environment, toggles, etc.)
│       ├── outputs.tf       # Module outputs (bucket_name, bucket_arn, website_endpoint)
│       ├── locals.tf        # (Optional) Internal local variables for naming and other calculations
│       └── versions.tf      # Provider requirements and Terraform version constraints
├── examples/
│   └── s3_bucket_example/   # Example usage of the module in a real-world scenario
│       ├── main.tf          # Calls the module with sample values
│       ├── terraform.tfvars # Example variable values for testing the module
│       └── outputs.tf       # (Optional) To display module outputs
└── tests/
    └── s3_bucket.tftest.hcl # Terraform test file to validate module behavior using Terraform's testing framework
```

## License

This module is licensed under the **GNU General Public License v2.0** (GPLv2). See the [LICENSE](LICENSE) file for details.

## Usage

```hcl
module "s3_bucket" {
  source      = "git::https://github.com/your-org/terraform-aws-s3-module.git"
  bucket_name = "my-example-bucket"
  environment = "dev"

  versioning_enabled  = true
  enable_encryption   = true
  force_destroy       = false
}
```

## Inputs

| Name                | Type    | Default  | Description |
|---------------------|--------|----------|-------------|
| `bucket_name`      | string | n/a      | (Required) The name of the S3 bucket |
| `environment`      | string | `"dev"`  | (Optional) The environment tag (e.g., dev, prod) |
| `versioning_enabled` | bool | `false`  | (Optional) Enable versioning for the bucket |
| `enable_encryption` | bool | `true`   | (Optional) Enable AES256 encryption |
| `force_destroy`    | bool | `false`   | (Optional) Whether to allow deletion of non-empty buckets |

## Outputs

| Name          | Description |
|--------------|-------------|
| `bucket_name` | The name of the created S3 bucket |
| `bucket_arn`  | The ARN of the S3 bucket |
| `website_endpoint` | The website URL if hosting is enabled |

## Example Deployment

```bash
terraform init
terraform apply -auto-approve
```

## Testing

Terraform's native testing framework is used to validate the module:

```bash
terraform test
```

## Authors

- **James Vince** - *Maintainer*

---

**Contributions are welcome!** Feel free to submit a PR.
