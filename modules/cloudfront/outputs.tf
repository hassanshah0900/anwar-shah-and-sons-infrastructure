output "cloudfront_distribution_domain_name" {
  type        = string
  description = "The domain name of the CloudFront distribution (e.g., d111111abcdef8.cloudfront.net)."
  value       = aws_cloudfront_distribution.main.domain_name
}

output "cloudfront_distribution_arn" {
  type        = string
  description = "The ARN of the CloudFront distribution, used in S3 bucket policies for the frontend and storage buckets to allow secure origin access."
  value       = aws_cloudfront_distribution.main.arn
}
