output "target_group_arn" {
  value = aws_lb_target_group.ecs_target.arn
}

output "alb_dns_name" {
  value = aws_lb.ecs_alb.dns_name
}