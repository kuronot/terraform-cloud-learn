##############################################
# Subnet
##############################################
resource "aws_subnet" "main" {
  for_each = var.subunets

  vpc_id     = var.vpc_id
  cidr_block = each.value.cidr_block

  tags = {
    Name = each.value.name
  }
}
