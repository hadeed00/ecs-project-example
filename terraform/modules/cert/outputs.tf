output "domain_validation_options" {
  value = {
    for dvo in aws_acm_certificate.app_cert.domain_validation_options : dvo.domain_name => dvo.resource_record_name
  }
}

output "cert_arn" {
  value = aws_acm_certificate.app_cert.arn
}