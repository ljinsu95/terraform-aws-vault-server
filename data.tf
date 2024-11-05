## 사용가능한 vpc 목록 조회
data "aws_vpcs" "existing" {}

## 사용가능한 VPC 조회
### https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc
data "aws_vpc" "selected" {
  id = data.aws_vpcs.existing.ids[0]
}

### https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_groups
data "aws_security_groups" "main" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

## 인터넷 게이트웨이 조회
### https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/internet_gateway
data "aws_internet_gateway" "default" {
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

## 서브넷 리스트 조회
data "aws_subnets" "main" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
  filter {
    name   = "map-public-ip-on-launch"
    values = ["true"]
  }
}

data "aws_availability_zones" "available" {}

# 아마존 리눅스 2 이미지 조회
### https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  # filter {
  #   name   = "platform"
  #   values = ["amazon"]
  # }

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*"]
  }
}
