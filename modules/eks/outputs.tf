# EKS Cluster Name

output "cluster_name" {

  value = aws_eks_cluster.main.name

}


# EKS Cluster Endpoint

output "cluster_endpoint" {

  value = aws_eks_cluster.main.endpoint

}


# OIDC Provider URL

output "oidc_provider_url" {

  value = aws_eks_cluster.main.identity[0].oidc[0].issuer

}


# OIDC Provider ARN

output "oidc_provider_arn" {

  value = aws_iam_openid_connect_provider.eks.arn

}