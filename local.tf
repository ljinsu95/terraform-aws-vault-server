locals {
  # aws subnet ids 값이 없으면 data source를 통해 public ip 자동할탕 설정된 subnet 리스트를 가져옴
  aws_subnets_ids = var.aws_subnets_ids == null ? data.aws_subnets.main.ids : var.aws_subnets_ids
}
