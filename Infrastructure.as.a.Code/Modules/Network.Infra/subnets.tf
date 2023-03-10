resource "aws_subnet" "Subnets-AZ1" {
  vpc_id     = aws_vpc.vpc.id
  count = length(var.AZ1_subnet_cidr_block)
  cidr_block = var.AZ1_subnet_cidr_block [count.index]
  availability_zone = var.availability_zones[0]
  map_public_ip_on_launch = var.public_ip [count.index]
  tags = {
    count = length(var.AZ1_subnet_name)
    Name = var.AZ1_subnet_name [count.index]
  }
}

resource "aws_subnet" "Subnets-AZ2" {
  vpc_id     = aws_vpc.vpc.id
  count = length(var.AZ2_subnet_cidr_block)
  cidr_block = var.AZ2_subnet_cidr_block [count.index]
  availability_zone = var.availability_zones[1]
  map_public_ip_on_launch = var.public_ip [count.index]
  tags = {
    count = length(var.AZ2_subnet_name)
    Name = var.AZ2_subnet_name [count.index]
  }
}
