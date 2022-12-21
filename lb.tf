resource "aws_lb" "lb" {
  name               = "terraform-elb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.wordpress_lb_sg.id]
  subnets            = [aws_subnet.pub_subnet.id, aws_subnet.pub_subnet1.id]

  enable_deletion_protection = false
  ip_address_type            = "ipv4"
  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "healthcheck" {
  name        = "terraform-health"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.vpc.id
  health_check {
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    path                = "/"
    protocol = "HTTP"
    interval = 120
    matcher  = "200-299"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.healthcheck.arn
  }
  depends_on = [aws_lb_target_group.healthcheck]
}
