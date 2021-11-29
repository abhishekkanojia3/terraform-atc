resource "aws_route53_record" "project" {
  name = "${var.files_name}"
  type = "CNAME"

  records = [
    aws_lb.LB.dns_name,
  ]

  zone_id = "Z01872269TZV15W4L1XV"
  ttl = "60" 
}
