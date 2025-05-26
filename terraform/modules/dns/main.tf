resource "aws_route53_zone" "private_zone" {
  name = var.private_domain_name
  vpc {
    vpc_id = var.vpc_id
  }

  tags = {
    Name = "Private DNS Zone"
  }
}

resource "aws_route53_record" "alb_dns" {
  zone_id = aws_route53_zone.private_zone.zone_id
  name    = "app.${var.private_domain_name}"
  type    = "CNAME"
  records = [var.alb_dns_name]
  ttl     = 300
}