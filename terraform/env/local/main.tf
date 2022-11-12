##############################################
# VPC
##############################################
module "mo_vpc" {
  source = "../../modules/vpc"

  cidr_block = "10.0.0.0/16"
  vpc_name   = "kurono-test-vpc"
  igw_name   = "kurono-test-igw"
}

##############################################
# Subnet
##############################################
module "mo_public_subnet" {
  source = "../../modules/subnet"

  vpc_id  = module.mo_vpc.vpc.id
  subnets = local.subnets
}
locals {
  subnets = {
    subnet01 = {
      name       = "kurono-pub-subnet01"
      cidr_block = "10.0.1.0/24"
    }
    subnet02 = {
      name       = "kurono-pub-subnet02"
      cidr_block = "10.0.2.0/24"
    }
  }
}
