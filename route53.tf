resource "aws_route53_record" "project" {
  name = "${var.files_name}"
  type = "CNAME"

  records = [
    aws_lb.LB.dns_name,
  ]

  zone_id = "Z028295339PBIMG6UQVHI"
  ttl = "60" 
}
