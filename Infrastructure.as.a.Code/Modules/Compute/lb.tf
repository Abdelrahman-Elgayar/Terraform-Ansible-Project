resource "aws_lb" "first-ALB" {
  # name               = var.alb_name[0]
  name               = "first-ALB-Public"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.sg_id
  subnets            = [var.subnet1_id,var.subnet3_id]
  }

  resource "aws_lb" "second-ALB" {
  # name               = var.alb_name[1]
  name               = "second-ALB-Private"
  internal           = true
  load_balancer_type = "application"
  security_groups    = var.sg_id
  subnets            = [var.subnet2_id,var.subnet4_id]
  }

resource "aws_lb_target_group" "tg1" {
  name     = "first-ALB-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "tg1-attach1" {
  target_group_arn = aws_lb_target_group.tg1.arn
  target_id        = aws_instance.public_instance1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg1-attach2" {
  target_group_arn = aws_lb_target_group.tg1.arn
  target_id        = aws_instance.public_instance2.id
  port             = 80
}

resource "aws_lb_target_group" "tg2" {
  name     = "second-ALB-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "tg2-attach1" {
  target_group_arn = aws_lb_target_group.tg2.arn
  target_id        = aws_instance.private_instance1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg2-attach2" {
  target_group_arn = aws_lb_target_group.tg2.arn
  target_id        = aws_instance.private_instance2.id
  port             = 80
}

resource "aws_lb_listener" "first-ALB-listener" {
  load_balancer_arn = aws_lb.first-ALB.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg1.arn
  }
}

resource "aws_lb_listener" "second-ALB-listener" {
  load_balancer_arn = aws_lb.second-ALB.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg2.arn
  }
}