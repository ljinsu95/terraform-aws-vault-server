#!/bin/bash
## https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install vault-enterprise-1.16.7+ent-1.$(uname -m)

export NI_NAME=$(ip -o link show | awk -F': ' 'NR==2 {print $2}')


sudo tee /etc/vault.d/vault.hcl -<<EOF
# Full configuration options can be found at https://www.vaultproject.io/docs/configuration

ui = true

#mlock = true
disable_mlock = true
cluster_addr  = "http://{{ GetInterfaceIP \"$${NI_NAME}\" }}:8201"
api_addr      = "http://{{ GetInterfaceIP \"$${NI_NAME}\" }}:8200"

storage "raft" {
  node_id = "node-$(ec2-metadata --instance-id | cut -d " " -f 2)"
  path = "/opt/vault/data"
  retry_join {
    auto_join = "provider=aws tag_key=service tag_value=${TAG}"
    auto_join_scheme = "http"
  }
}

# HTTP listener
listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = 1
}

# Enterprise license_path
license_path = "/etc/vault.d/vault.hclic"

# Example AWS KMS auto unseal
# seal "awskms" {
#   region = "ca-central-1"
#   kms_key_id = ""
# }

# reporting disable
reporting {
  license {
    enabled = false
  }
}

EOF

sudo tee /etc/vault.d/vault.hclic -<<EOF
${vault_license}
EOF


sudo systemctl enable vault
sudo systemctl start vault