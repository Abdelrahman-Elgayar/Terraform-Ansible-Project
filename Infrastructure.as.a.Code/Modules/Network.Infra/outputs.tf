output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet1_id" {
  value = aws_subnet.Subnets-AZ1[0].id
}

output "subnet2_id" {
  value = aws_subnet.Subnets-AZ1[1].id
}

output "subnet3_id" {
  value = aws_subnet.Subnets-AZ2[0].id
}

output "subnet4_id" {
  value = aws_subnet.Subnets-AZ2[1].id
}
