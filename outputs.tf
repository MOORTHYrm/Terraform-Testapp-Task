# ==========================================
# Outputs
# ==========================================

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "alb_dns_name" {
  description = "ALB DNS Name"
  value       = aws_lb.main.dns_name
}

output "frontend_url" {
  description = "Frontend URL"
  value       = "http://${aws_lb.main.dns_name}"
}

output "backend_url" {
  description = "Backend API URL"
  value       = "http://${aws_lb.main.dns_name}:3000"
}

output "bastion_public_ip" {
  description = "Bastion Host Public IP"
  value       = aws_eip.bastion.public_ip
}

output "bastion_ssh_command" {
  description = "SSH Command for Bastion"
  value       = "ssh -i ${var.key_pair_name}.pem ubuntu@${aws_eip.bastion.public_ip}"
}

output "rds_endpoint" {
  description = "RDS Cluster Endpoint"
  value       = aws_rds_cluster.main.endpoint
  sensitive   = true
}

output "rds_connect_command" {
  description = "Command to connect to RDS from bastion"
  value       = "psql -h ${aws_rds_cluster.main.endpoint} -U postgres -d testdb"
  sensitive   = true
}

output "ecr_backend_url" {
  description = "Backend ECR Repository URL"
  value       = aws_ecr_repository.backend.repository_url
}

output "ecr_frontend_url" {
  description = "Frontend ECR Repository URL"
  value       = aws_ecr_repository.frontend.repository_url
}

output "ecs_cluster_name" {
  description = "ECS Cluster Name"
  value       = aws_ecs_cluster.main.name
}

output "ecs_service_name" {
  description = "ECS Service Name"
  value       = aws_ecs_service.main.name
}

output "deployment_summary" {
  description = "Deployment Summary"
  value = <<-EOT
    ================================================
    ${var.environment} Environment Deployed
    ================================================
    
    Frontend:  http://${aws_lb.main.dns_name}
    Backend:   http://${aws_lb.main.dns_name}:3000
    
    Bastion:   ssh -i ${var.key_pair_name}.pem ubuntu@${aws_eip.bastion.public_ip}
    
    Database:  ${aws_rds_cluster.main.endpoint}
    
    ECR Backend:  ${aws_ecr_repository.backend.repository_url}
    ECR Frontend: ${aws_ecr_repository.frontend.repository_url}
    
    ECS Cluster: ${aws_ecs_cluster.main.name}
    ECS Service: ${aws_ecs_service.main.name}
    
    ================================================
    Next: Push Docker images to ECR and access ALB
    ================================================
  EOT
}
