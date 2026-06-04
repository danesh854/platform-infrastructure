terraform {

  backend "s3" {

    bucket = "enterprise-terraform-state-danesh"

    key = "dev/terraform.tfstate"

    region = "ap-south-1"

    dynamodb_table = "terraform-state-lock"

    encrypt = true
  }

}