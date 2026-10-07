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

variable "node_count" {
  description = "Aantal EKS worker nodes voor de bootcamp (0 = stop, 1 = start)"
  type        = number
  default     = 1

  validation {
    condition     = var.node_count >= 0 && var.node_count <= 2
    error_message = "node_count moet 0, 1 of 2 zijn."
  }
}