# Terraform GCP Cloud Build

Terraform module to enable Cloud Build for a project.

## Usage

````
locals {
  project_short_name  = "hw"
  project_long_name   = "Hello World"
  organization_id     = "xxxxxxx"
  billing_account_id  = "xxxx"
  email_address       = "contact@example.com"
}

module "gcp_project" {
  source             = "git::https://github.com/0xdbe-terraform/terraform-gcp-project.git?ref=v1.0.1"
  organization_id    = local.organization_id
  billing_account_id = local.billing_account_id
  project_short_name = local.project_short_name
  project_long_name  = local.project_long_name
}

module "gcp_cloud_build" {
  source          = "git::https://github.com/0xdbe-terraform/terraform-gcp-cloud-build.git?ref=v1.0.0"
  project_id      = module.gcp_project.project_id
  project_number  = module.gcp_project.project_number
}
````
