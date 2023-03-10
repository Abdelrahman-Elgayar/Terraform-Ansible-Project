resource "aws_nat_gateway" "Nat_gw" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.Subnets-AZ1[0].id

  tags = {
    Name = var.Nat_gw
  }
  }

  resource "aws_eip" "elastic_ip" {
    tags = {
      Name = var.eip_name
  }
}