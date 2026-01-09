 #Aws Cloudformation and TerraformCode

1. VPC & Networking: VPC with public/private subnets across 2 availability zones (ap-south-1a, ap-south-1b)
2. Security Groups: Separate security groups for ALB, Frontend, Backend, ECS Tasks, Bastion, and RDS
3. Application Load Balancer: With listeners on ports 80 (frontend) and 3000 (backend)
4. RDS Aurora PostgreSQL: Serverless v2 cluster with scaling configuration (0.5-1.0 ACUs)
5. Bastion Host: Ubuntu 22.04 t3.micro instance with PostgreSQL client and helper scripts
6. ECR Repositories: For both frontend and backend Docker images
7. ECS Fargate: Cluster with task definition containing both containers
8. CloudWatch Logs: Log groups for frontend and backend services
9. IAM Roles: Execution and task roles for ECS
