resource "aws_ecr_repository" "bootcamp" {
  name         = "eks-bootcamp-web"
  force_delete = true
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name    = "eks-bootcamp-web"
    Project = var.project_name
  }
}