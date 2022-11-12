##############################################
# VPC
##############################################
module "mo_vpc" {
  source = "../../modules/vpc"

  cidr_block = "10.0.0.0/16"
  vpc_name   = "kurono-test-vpc"
  igw_name   = "kurono-test-igw"
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
