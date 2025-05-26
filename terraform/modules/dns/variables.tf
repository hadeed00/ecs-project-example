variable "private_domain_name" {
  default = "ecs.local"
}

variable "vpc_id" {}

variable "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
}