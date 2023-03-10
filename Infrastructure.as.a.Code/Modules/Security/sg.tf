resource "aws_security_group" "SecGroup" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id

  ingress {
    from_port        = var.security_rules.internal[0]
    to_port          = var.security_rules.external[0]
    protocol         = var.security_rules.protocol[0]
    cidr_blocks      = [var.security_source]
  }

  ingress {
    from_port        = var.security_rules.internal[1]
    to_port          = var.security_rules.external[1]
    protocol         = var.security_rules.protocol[0]
    cidr_blocks      = [var.security_source]
  }

  egress {
    from_port        = var.security_rules.internal[2]
    to_port          = var.security_rules.external[2]
    protocol         = var.security_rules.protocol[1]
    cidr_blocks      = [var.security_source]
  }


  tags = {
    Name = var.sg_name
  }
}