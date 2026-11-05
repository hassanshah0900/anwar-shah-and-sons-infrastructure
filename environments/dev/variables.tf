variable "project_name" {
  type        = string
  description = "Short project identifier, used as a prefix in resource names and tags."
}

variable "environment" {
  type        = string
  description = "Deployment environment (e.g. dev, staging, prod)."
}

variable "region" {
  type        = string
  description = "AWS region where the resources are deployed (e.g. eu-central-1)."
}
