resource "aws_iam_user_policy" "eks_console_access" {
  name = "${var.project_name}-eks-console-access"
  user = "eks-admin"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "eks:AccessKubernetesApi",
          "eks:DescribeCluster",
          "eks:DescribeNodegroup",
          "eks:ListNodegroups",
          "eks:ListAddons",
          "eks:ListFargateProfiles",
          "eks:ListUpdates",
          "eks:ListIdentityProviderConfigs"
        ]

        Resource = aws_eks_cluster.bootcamp.arn
      }
    ]
  })
}