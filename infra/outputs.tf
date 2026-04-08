output "vpc_id" {
  value = aws_vpc.main.id
}

output "ecr_repo_url" {
  value = aws_ecr_repository.app_repo.repository_url
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "load_balancer_dns" {
  value = aws_lb.app_lb.dns_name
}

