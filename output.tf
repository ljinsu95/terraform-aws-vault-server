output "vault_public_ip" {
  value = aws_instance.vault_raft_amz2.*.public_ip
}
