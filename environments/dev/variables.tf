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

variable "domain_name" {
  type        = string
  description = "Custom domain viewers use to reach the CloudFront distribution (e.g. www.example.com)."
}

variable "alb_certificate_arn" {
  type        = string
  description = "ARN of the ACM certificate for the ALB's HTTPS listener. Must be in the same region as the ALB and cover domain_name."
}

variable "cloudfront_certificate_arn" {
  type        = string
  description = "ARN of the ACM certificate for the CloudFront distribution. Must be in us-east-1 and cover domain_name."
}
