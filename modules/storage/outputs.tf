output "s3_bucket_regional_domain_name" {
  type        = string
  description = "The regional domain name of the storage S3 bucket, used as the origin domain name for CloudFront."
  value       = aws_s3_bucket.storage.bucket_regional_domain_name
}
