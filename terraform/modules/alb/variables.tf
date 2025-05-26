variable "alb_name" {
  default = "ecs-app-alb"
}

variable "vpc_id" {}

variable "public_subnets" {
  type = list(string)
}

variable "ecs_target_group_name" {
  default = "ecs-target-group"
}

variable "domain_name" {
  description = "Domain name for HTTPS"
}

# variable "acm_certificate_arn" {
#   description = "ARN of the SSL certificate"
# }