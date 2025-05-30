variable "app_name" {
  type = string
}
variable "aws_region" {
  type = string
}

variable "ecr_image_url" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "target_group_arn" {
  type = string
}