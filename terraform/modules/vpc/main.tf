##############################################
# VPC
##############################################
resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.igw_name
  }
}
