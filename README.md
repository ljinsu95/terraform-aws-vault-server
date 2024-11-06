# terraform-aws-vault-server
EC2 Vault Server(Raft/Consul) 배포 모듈
## 입력 변수
### 필수 값
- `AWS_ACCESS_KEY_ID` `(string: <required>)` - AWS Provider에 사용되는 AWS ACCESS KEY
- `AWS_SECRET_ACCESS_KEY` `(string: <required>)` - AWS Provider에 사용되는 AWS SECRET ACCESS KEY
- `VAULT_LICENSE` `(string: <required>)` - VAULT Enterprise 구성에 사용되는 VAULT 라이센스

### 옵션 값
- `prefix` `(string: "terraform")` - 리소스 생성 시 TAG 등에 사용되는 prefix 값
- `aws_region` `(string: "ca-central-1")` - AWS Provider에 사용되는 AWS Region
- `ec2_vault_servers` `(int: 3)` - Vault Server 갯수 설정
- `ec2_consul_servers` `(int: 3)` - Consul Server 갯수 설정 (vault storage mode = consul 일 경우)
- `ec2_instance_type` `(string: "t3.micro")` - EC2 instance type
- `ec2_architecture` `(string: "x86")` - ec2에 사용되는 아키텍쳐 명 ( x86 or arm )
- `vault_tag_name` `(string: "vault_auto_join")` - vault_auto_join을 위한 태그 명
- `vault_storage_mode` `(string: "raft")` - Vault Storage Mode 지정 (raft or consul)
- `aws_subnets_ids` `(list(string): null)` - AWS Subnet ID List

## 출력 변수
- `vault_instance_ids` `(list(string): [])` - Vault Instance IDs
- `vault_public_ips` `(list(string): [])` - Vault Public IPs