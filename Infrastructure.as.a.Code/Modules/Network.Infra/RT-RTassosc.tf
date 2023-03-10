resource "aws_route_table" "PublicRT" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.security_source
    gateway_id = aws_internet_gateway.IGW.id
  }

  tags = {
    Name = var.RT_name[0]
  }
}

resource "aws_route_table_association" "PublicRT-PublicSubnet-AZ1" {
  subnet_id      = aws_subnet.Subnets-AZ1[0].id
  route_table_id = aws_route_table.PublicRT.id
}

resource "aws_route_table_association" "PublicRT-PublicSubnet-AZ2" {
  subnet_id      = aws_subnet.Subnets-AZ2[0].id
  route_table_id = aws_route_table.PublicRT.id
}

resource "aws_route_table" "PrivateRT" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.security_source
    gateway_id = aws_nat_gateway.Nat_gw.id
  }

  tags = {
    Name = var.RT_name[1]
  }
}

resource "aws_route_table_association" "PrivateRT-PrivateSubnet-AZ1" {
  subnet_id      = aws_subnet.Subnets-AZ1[1].id
  route_table_id = aws_route_table.PrivateRT.id
}

resource "aws_route_table_association" "PrivateRT-PrivateSubnet-AZ2" {
  subnet_id      = aws_subnet.Subnets-AZ2[1].id
  route_table_id = aws_route_table.PrivateRT.id
}