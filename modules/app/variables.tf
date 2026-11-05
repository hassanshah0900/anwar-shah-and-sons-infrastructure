variable "project_name" {
  type        = string
  description = "Name of the project used for resource naming prefix"
}

variable "environment" {
  type        = string
  description = "Deployment environment (e.g., dev, staging, prod)"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC where network resources are deployed"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type for the application launch template"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnet IDs for the Application Load Balancer"
}

variable "app_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for the Auto Scaling Group"
}

variable "db_cluster_resource_id" {
  type        = string
  description = "The resource ID of the Aurora cluster (cluster-XXXX), used to build the rds-db:connect IAM policy ARN."
}

variable "db_user" {
  type        = string
  description = "The PostgreSQL user the application connects as with IAM authentication. Must exist in the database and be granted the rds_iam role."
}

variable "alb_certificate_arn" {
  type        = string
  description = "ARN of the ACM certificate for the ALB's HTTPS listener. Must be in the same region as the ALB."
}
