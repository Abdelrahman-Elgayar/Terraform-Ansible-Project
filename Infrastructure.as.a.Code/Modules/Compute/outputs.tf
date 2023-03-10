output "first-alb-dns" {
    value = aws_lb.first-ALB.dns_name
}

output "second-alb-dns" {
    value = aws_lb.second-ALB.dns_name
}
