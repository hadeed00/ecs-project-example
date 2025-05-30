I have got this working but I do not have a domain so I got it working with HTTP and not HTTPS:

![here](image.png)

I have the code for it with HTTPS commented out.

To get the code running you simply run the GitHub Action and go to the link given as an output.

### Architecture Diagram

```mermaid
graph TD
  User[User Browser]
  ALB[Application Load Balancer port 80]
  ECSService[ECS Service]
  ECSTask[ECS Task Container from ECR]
  ECR[Elastic Container Registry]
  VPC[VPC with Subnets]

  User --> ALB
  ALB --> ECSService
  ECSService --> ECSTask
  ECSTask --> ECR

  subgraph Infrastructure
    VPC --> ALB
    VPC --> ECSService
  end
```

### Project Code Structure

```mermaid
graph LR
  A[ecs-project-example/]
  A --> App[app/]
  A --> Terraform[terraform/]

  App --> SourceFiles[Front-end source code React + Yarn]
  App --> Dockerfile[Dockerfile]
  App --> NginxConf[nginx.conf]
  App --> ReadmeApp[README.md]

  Terraform --> provider[provider.tf]
  Terraform --> main[main.tf]
  Terraform --> outputs[outputs.tf]
  Terraform --> variables[variables.tf]
  Terraform --> tfvars[terraform.tfvars]
  Terraform --> gitignore[.gitignore]
  Terraform --> lock[.terraform.lock.hcl]
  Terraform --> Modules[modules/]

  Modules --> VPC[vpc/]
  Modules --> ECS[ecs/]
  Modules --> ALB[alb/]
  Modules --> Cert[cert/]
  Modules --> DNS[dns/]
```
