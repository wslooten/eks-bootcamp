output "vpc_id" {
  description = "Bestaande VPC voor het EKS-cluster"
  value       = data.aws_vpc.bootcamp.id
}

output "private_subnet_ids" {
  description = "Private subnet-ID's voor het EKS-cluster"
  value       = data.aws_subnets.private.ids
}