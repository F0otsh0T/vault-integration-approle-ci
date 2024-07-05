# 00.versions.tf

terraform {
  required_version = ">= 0.13"
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = ">= 4.1.0"
    }
    github = {
      source  = "integrations/github"
      version = ">=6.2.2"
    }
    random = {
      source  = "hashicorp/random"
      version = ">=3.6.0"
    }
  }
}

locals {
  #   vault_root_token  = var.vault_root_token
  vault_url       = var.vault_url
  vault_namespace = var.vault_namespace
  docker_user     = var.docker_user
  docker_password = var.docker_password
  #   vault_port        = var.vault_port
  #   vault_cli_port    = var.vault_cli_port
}

provider "vault" {
  # Configuration options
  ## export VAULT_ADDR="http://localhost:8200"
  # address = var.vault_url
  #  address = "${var.vault_url}:${var.vault_port}"
  ## export VAULT_TOKEN="your-root-token"
  #  token   = var.vault_root_token
  #  skip_child_token = true
}

provider "github" {
  # Configuration options
  ## export GITHUB_TOKEN="your-personal-access-token"
  # token    = var.github_token
}

provider "random" {
  # Configuration options
}
