variable "aws_region" {
  description = "AWS region waarin het EKS-cluster wordt gebouwd"
  type        = string
}

variable "project_name" {
  description = "Naam die wordt gebruikt voor AWS-resources"
  type        = string
}

variable "cluster_name" {
  description = "Naam van het EKS-cluster"
  type        = string
}