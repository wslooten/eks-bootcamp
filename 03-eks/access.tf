resource "aws_eks_access_entry" "eks_admin" {
  cluster_name  = aws_eks_cluster.bootcamp.name
  principal_arn = "arn:aws:iam::222104430672:user/eks-admin"
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "eks_admin_cluster_admin" {
  cluster_name  = aws_eks_cluster.bootcamp.name
  principal_arn = aws_eks_access_entry.eks_admin.principal_arn

  policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }
}