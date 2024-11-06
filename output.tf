output "vault_public_ips" {
  value = aws_instance.vault_raft_amz2.*.public_ip
}

output "vault_instance_ids" {
  value = aws_instance.vault_raft_amz2.*.id
}

# https://developer.hashicorp.com/terraform/language/expressions/references#filesystem-and-workspace-info
output "workspace" {
  value = terraform.workspace
}
