##############################################
# Public Subnet
##############################################
resource "aws_subnet" "pub_subnet" {
  for_each = var.pub_subnets

  vpc_id     = aws_vpc.main.id
  cidr_block = each.value.cidr_block

  tags = {
    Name = each.value.name
  }
}
##############################################
# Private Subnet
##############################################
resource "aws_subnet" "pri_subnet" {
  for_each = var.pri_subnets

  vpc_id     = aws_vpc.main.id
  cidr_block = each.value.cidr_block

  tags = {
    Name = each.value.name
  }
}
