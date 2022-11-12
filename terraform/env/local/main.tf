##############################################
# VPC
##############################################
module "mo_vpc" {
  source = "../modules/vpc"

  cidr_block = "10.0.0.0/16"
  vpc_name   = "kurono-test-vpc"
  igw_name   = "kurono-test-igw"
}
