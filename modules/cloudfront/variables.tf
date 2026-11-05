variable "project_name" {
  type        = string
  description = "The name of the project used for resource naming and tagging."
}

variable "environment" {
  type        = string
  description = "The deployment environment (e.g., prod, staging, dev)."
}

variable "frontend_bucket_regional_domain_name" {
  type = string
}

variable "storage_bucket_regional_domain_name" {
  type = string
}

variable "backend_alb_domain_name" {
  type = string
}

variable "domain_name" {
  type        = string
  description = "Custom domain the distribution serves (e.g. www.example.com)."
}

variable "cloudfront_certificate_arn" {
  type        = string
  description = "ARN of the ACM certificate for the distribution. Must be in us-east-1 and cover domain_name."
}
