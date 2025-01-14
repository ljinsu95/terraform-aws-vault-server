#################################################
# 필수 값
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
  description = "License for the Vault"
  sensitive   = true
}
#################################################

# 옵션 값
variable "prefix" {
  description = "prefix"
  default     = "tf-vault-server"
}

variable "aws_region" {
  description = "aws region"
  default     = "ca-central-1"
}

variable "ec2_vault_servers" {
  type        = number
  description = "Vault Server 갯수 설정"
  default     = 3
}

variable "ec2_consul_servers" {
  type        = number
  description = "Consul Server 갯수 설정 (vault storage mode = consul 일 경우)"
  default     = 3
}

variable "ec2_instance_type" {
  type        = string
  description = "x86 instance type"
  default     = "t3.micro"
}

variable "ec2_architecture" {
  type        = string
  description = "ec2에 사용되는 아키텍쳐 명 ( x86 or arm )"
  default     = "x86"
}

variable "ec2_pem_key_name" {
  type        = string
  description = "ec2에 사용되는 pem key 명"
  default     = "jinsu"
}

variable "vault_tag_name" {
  type        = string
  description = "vault_auto_join을 위한 태그 명"
  default     = "vault_auto_join"
}

variable "vault_storage_mode" {
  type        = string
  description = "Vault Storage Mode 지정 (raft or consul)"
  default     = "raft"
}

variable "aws_subnets_ids" {
  type        = list(string)
  description = "AWS Subnet ID List"
  nullable    = true
  default     = null
}
