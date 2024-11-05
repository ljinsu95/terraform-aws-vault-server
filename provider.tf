provider "tfe" {
  hostname     = "jinsu.terraform.insideinfo-cloud.com"
  organization = var.TFE_ORG_NAME
  token        = var.TFE_TOKEN
}

provider "aws" {
  region     = var.aws_region
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}
