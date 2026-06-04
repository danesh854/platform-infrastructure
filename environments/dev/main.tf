module "networking" {


  source = "../../modules/networking"


  project_name = "enterprise-dev"


  vpc_cidr = "10.0.0.0/16"


  public_subnets = [

    "10.0.1.0/24",

    "10.0.2.0/24"

  ]


  private_subnets = [

    "10.0.10.0/24",

    "10.0.20.0/24"

  ]


  availability_zones = [

    "ap-south-1a",

    "ap-south-1b"

  ]


}
module "iam" {


  source = "../../modules/iam"


  project_name = "enterprise-dev"

}



module "eks" {


  source = "../../modules/eks"



  project_name = "enterprise-dev"



  cluster_version = "1.33"



  private_subnets = module.networking.private_subnets



  cluster_role_arn = module.iam.eks_cluster_role_arn



  node_role_arn = module.iam.node_role_arn



}