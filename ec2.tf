## 인스턴스(Vault Server) 생성
### https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "vault_raft_amz2" {
  count = var.ec2_vault_servers

  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = var.ec2_instance_type
  subnet_id              = local.aws_subnets_ids[(tonumber(count.index) + 1) % length(local.aws_subnets_ids)]
  # subnet_id              = data.aws_subnets.main.ids[(tonumber(count.index) + 1) % length(data.aws_subnets.main.ids)]
  vpc_security_group_ids = toset([aws_security_group.vault_server.id])
  key_name               = var.ec2_pem_key_name
  tags = {
    Name    = "${var.prefix}-Vault-${count.index}"
    service = "${var.vault_tag_name}"
  }

  root_block_device {
    volume_type = "gp3"
    volume_size = "10"
    tags = {
      Name = "${var.prefix}_Vault_Volume_${count.index}"
    }
  }

  credit_specification {
    cpu_credits = "standard"
  }

  iam_instance_profile = aws_iam_instance_profile.vault_join_profile.name

  # user_data = data.template_file.user_data.rendered
  user_data = templatefile(
    "${path.module}/user_data_vault_raft.tpl",
    {
      TAG           = var.vault_tag_name
      vault_license = var.VAULT_LICENSE
    }
  )

  # lifecycle {
  #     ignore_changes = [ user_data ]
  # }
}

