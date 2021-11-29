resource "aws_lb" "LB" {
  name               = "${var.files_name}"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.subnet.id,aws_subnet.subnet2.id]
  security_groups    = [aws_security_group.SG.id]
  enable_deletion_protection = false
}

