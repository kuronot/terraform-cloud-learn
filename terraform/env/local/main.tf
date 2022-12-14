data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
output region {
  value       = data.aws_region.current.name
}
output account_id {
  value       = data.aws_caller_identity.current.account_id
}


##############################################
# VPC
##############################################
module "vpc" {
  source  = "app.terraform.io/kurono-learn/vpc/aws"
  version = "0.1.0"

  cidr_block  = "10.0.0.0/16"
  vpc_name    = "kurono-test-vpc"
  igw_name    = "kurono-test-igw"
  pub_subnets = local.pub_subnets
  pri_subnets = local.pri_subnets
}
##############################################
# Public Subnet
##############################################
locals {
  pub_subnets = {
    subnetpub01 = {
      name       = "kurono-pub-subnet01"
      cidr_block = "10.0.1.0/24"
    }
    subnetpub02 = {
      name       = "kurono-pub-subnet02"
      cidr_block = "10.0.2.0/24"
    }
  }
}
##############################################
# Private Subnet
##############################################
locals {
  pri_subnets = {
    subnetpri01 = {
      name       = "kurono-pri-subnet01"
      cidr_block = "10.0.3.0/24"
    }
    subnetpri02 = {
      name       = "kurono-pri-subnet02"
      cidr_block = "10.0.4.0/24"
    }
  }
}
##############################################
# S3
##############################################
module "s3" {
  source  = "app.terraform.io/kurono-learn/s3/aws"
  version = "0.1.0"

  bucket_name       = "kurono-test-s3"
  versioning_enable = "Enabled"
  sse_enable        = 0
}
