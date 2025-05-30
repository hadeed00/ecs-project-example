module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.21.0"

  name = "threat-vpc"
  cidr = "10.0.0.0/16"

  azs                = ["eu-west-2a", "eu-west-2b"]
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  enable_nat_gateway = false

  tags = {
    Name = "threat-vpc"
  }
}
