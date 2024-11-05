data "tfe_workspace" "self" {
  name = terraform.workspace

}

resource "tfe_variable" "ec2_vault_servers" {
  key          = "ec2_vault_servers"
  value        = var.ec2_vault_servers
  category     = "terraform"
  workspace_id = data.tfe_workspace.self.id
  description  = "a useful description"
}
