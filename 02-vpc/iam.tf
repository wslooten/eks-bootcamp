resource "aws_iam_role" "ec2_ecr" {
  name = "${var.project_name}-ec2-ecr-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name    = "${var.project_name}-ec2-ecr-role"
    Project = var.project_name
  }
}

resource "aws_iam_role_policy" "ecr_push" {
  name = "${var.project_name}-ecr-push-policy"
  role = aws_iam_role.ec2_ecr.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid    = "ECRAuthorization"
        Effect = "Allow"

        Action = [
          "ecr:GetAuthorizationToken"
        ]

        Resource = "*"
      },
      {
        Sid    = "PushImageToBootcampRepository"
        Effect = "Allow"

        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:CompleteLayerUpload",
          "ecr:DescribeImages",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ]

        Resource = aws_ecr_repository.bootcamp.arn
      }
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_ecr" {
  name = "${var.project_name}-ec2-ecr-profile"
  role = aws_iam_role.ec2_ecr.name
}