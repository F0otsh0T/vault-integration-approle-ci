# 01.01-02.vault.auth_approle.tf


resource "vault_auth_backend" "auth_approle_github" {
  path = "approle-github-actions"
  type = "approle"
}

resource "vault_approle_auth_backend_role" "auth_approle_role_github" {
  backend            = vault_auth_backend.auth_approle_github.path
  role_name          = "role-ci"
  secret_id_num_uses = 0
  secret_id_ttl      = "3600"
  token_num_uses     = 0
  token_ttl          = "3600"
  token_max_ttl      = "21600"
  token_policies = [
    "p.gha-app.r"
  ]
}
