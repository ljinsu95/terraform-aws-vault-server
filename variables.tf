#################################################
# 필수 값
variable "TFE_ORG_NAME" {
  type        = string
  description = "Terraform Organization Name"
}
variable "TFE_TOKEN" {
  type        = string
  description = "TFE Token"
}

variable "AWS_ACCESS_KEY_ID" {
  description = "AWS ACCESS KEY"
  sensitive   = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS SECRET ACCESS KEY"
  sensitive   = true
}

variable "VAULT_LICENSE" {
  type        = string
  sensitive   = true
  description = "License for the Vault"
  # default    = "YOUR_DEFAULT_VALUE" # 필요한 경우 기본값 설정 
}
#################################################

# 옵션 값

variable "prefix" {
  default     = "terraform_jinsu"
  description = "prefix"
}

variable "aws_region" {
  default     = "ca-central-1"
  description = "aws region"
}

variable "ec2_vault_servers" {
  type        = number
  default     = 3
  description = "Vault Server 갯수 설정"
}

variable "ec2_consul_servers" {
  type        = number
  default     = 3
  description = "Consul Server 갯수 설정 (vault storage mode = consul 일 경우)"
}

variable "tag_name" {
  type        = string
  default     = "vault_auto_join"
  description = "vault_auto_join을 위한 태그 명"
}

variable "vault_storage_mode" {
  type        = string
  default     = "raft"
  description = "Vault Storage Mode 지정 (raft or consul)"
}

variable "pem_key_name" {
  type        = string
  default     = "jinsu"
  description = "ec2에 사용되는 pem key 명"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "x86 instance type"
}

variable "architecture" {
  type = string
  # default     = "arm"
  default     = "x86"
  description = "ec2에 사용되는 아키텍쳐 명 ( x86 or arm )"
}

