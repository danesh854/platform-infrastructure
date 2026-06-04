# EKS Cluster

resource "aws_eks_cluster" "main" {


  name = "${var.project_name}-cluster"


  version = var.cluster_version


  role_arn = var.cluster_role_arn



  vpc_config {


    subnet_ids = var.private_subnets


    endpoint_private_access = true


    endpoint_public_access = true

  }



  enabled_cluster_log_types = [

    "api",

    "audit",

    "authenticator",

    "controllerManager",

    "scheduler"

  ]



}



# Managed Node Group

resource "aws_eks_node_group" "general" {


  cluster_name = aws_eks_cluster.main.name


  node_group_name = "${var.project_name}-general-ng"



  node_role_arn = var.node_role_arn



  subnet_ids = var.private_subnets



  instance_types = [

    "t3.medium"

  ]



  scaling_config {


    desired_size = 2


    max_size = 5


    min_size = 2

  }



  update_config {


    max_unavailable = 1

  }



  labels = {


    role = "general"

  }


  depends_on = [

    aws_eks_cluster.main

  ]

}