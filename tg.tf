resource "aws_lb_target_group" "TG" {
  name     = "${var.files_name}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
  health_check {
    path = "/index.html"
    port = 80
    healthy_threshold = 3
    unhealthy_threshold = 2
    timeout = 2
    interval = 5
    matcher = "200"  # has to be HTTP 200 or fails
  }
}

resource "aws_lb_target_group_attachment" "TGA" {
  target_group_arn = aws_lb_target_group.TG.arn
  target_id        = aws_instance.instance.id
  port             = 80
}
resource "aws_lb_target_group_attachment" "TGA2" {
  target_group_arn = aws_lb_target_group.TG.arn
  target_id        = aws_instance.instance2.id
  port             = 80
}


resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.LB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.TG.arn
  }
}
