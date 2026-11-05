output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer for client traffic"
  value       = aws_lb.app.dns_name
}

output "target_group_arn" {
  description = "ARN of the ALB target group linked to the ASG"
  value       = aws_lb_target_group.app.arn
}

output "asg_name" {
  description = "Name of the Auto Scaling Group managing the application instances"
  value       = aws_autoscaling_group.app.name
}

output "security_group_id" {
  description = "Security group ID assigned to the EC2 application instances"
  value       = aws_security_group.app.id
}
