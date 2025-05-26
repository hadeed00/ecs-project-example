module "vpc" {
  source    = "./modules/vpc"
  aws_region = var.aws_region
  app_name  = var.app_name
  ecr_image_url = var.ecr_image_url
  domain_name = var.domain_name
  # vpc_cidr  = var.vpc_cidr
}

module "ecs" {
  source    = "./modules/ecs"
  aws_region = var.aws_region
  app_name  = var.app_name
  ecr_image_url = var.ecr_image_url
  domain_name = var.domain_name
  public_subnets = module.vpc.public_subnets
  vpc_id = module.vpc.vpc_id
  target_group_arn = module.alb.target_group_arn

  depends_on = [ module.alb ]
}

# module "cert" {
#   source      = "./modules/cert"
#   domain_name = var.domain_name
# }

module "alb" {
  source                    = "./modules/alb"
  domain_name               = var.domain_name
  vpc_id                    = module.vpc.vpc_id
  public_subnets            = module.vpc.public_subnets
  # acm_certificate_arn       = module.cert.cert_arn

  depends_on = [ module.vpc ]
}

module "dns" {
  source              = "./modules/dns"
  private_domain_name = "ecs.local"
  vpc_id              = module.vpc.vpc_id
  alb_dns_name        = module.alb.alb_dns_name

  depends_on = [ module.vpc ]
}