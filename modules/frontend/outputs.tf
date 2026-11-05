output "s3_bucket_regional_domain_name" {
  type        = string
  description = "The regional domain name of the frontend S3 bucket, used as the origin domain name for CloudFront."
  value       = aws_s3_bucket.frontend.bucket_regional_domain_name
}
