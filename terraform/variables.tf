variable "aws_region" {
  default = "eu-west-2"
}

variable "app_name" {
  default = "threat-modeler-ecs-project"
}

variable "ecr_image_url" {
  description = "Full ECR image URI"
}

variable "domain_name" {
  description = "Domain name for HTTPS"
}
