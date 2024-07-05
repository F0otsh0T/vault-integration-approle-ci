# 01.01-01.vault.jwt_auth.tf

################################################
# GITHUB JWT/OIDC METHOD

resource "vault_jwt_auth_backend" "jwt_github" {
  depends_on = [

  ]
  description = "JWT/OIDC Auth Backend for GitHub"
  # REFERENCE: https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-hashicorp-vault#adding-the-identity-provider-to-hashicorp-vault
  path               = var.vault_auth_mount_path
  type               = "jwt"
  oidc_discovery_url = "https://token.actions.githubusercontent.com"
  # jwks_url           = "https://token.actions.githubusercontent.com"
  bound_issuer = "https://token.actions.githubusercontent.com"
  provider_config = {

  }
  # tune {
  #     listing_visibility = "unauth"
  # }
}
# ROLE: GITHUB CI Runner / Trusted Broker - Repo will run GitHub Actions CI
resource "vault_jwt_auth_backend_role" "jwt_github_ci_runner_role" {
  backend   = vault_jwt_auth_backend.jwt_github.path
  role_name = "role-github-ci-runner"
  #  user_claim           = "oid"
  user_claim             = "actor"
  bound_claims_type      = "string"
  role_type              = "jwt"
  verbose_oidc_logging   = true
  token_explicit_max_ttl = "60"
  bound_claims = {
    repository = "${var.github_ci_runner_org_name}/${var.github_ci_runner_repo_name}"
  }
  token_policies = [
    "p.global.crudl"
  ]
}

# ROLE: GITHUB Application / Secrets Consumer - Repo will run GitHub Actions as Application Persona
resource "vault_jwt_auth_backend_role" "jwt_github_app_role" {
  backend   = vault_jwt_auth_backend.jwt_github.path
  role_name = "role-github-app"
  #  user_claim           = "oid"
  user_claim             = "actor"
  bound_claims_type      = "string"
  role_type              = "jwt"
  verbose_oidc_logging   = true
  token_explicit_max_ttl = "60"
  bound_claims = {
    repository = "${var.github_app_org_name}/${var.github_app_repo_name}"
  }
  token_policies = [
    "p.global.crudl"
  ]
}



# resource "vault_identity_group" "github_external" {
#   name        = "group_github_external"
#   type        = "external"
#   policies    = [
#     "p.global.crudl"
#   ]
#   metadata = {
#     project_path = "project_path",
#     namespace_path = "namespace_path"
#   }
# }

# resource "vault_identity_group_alias" "github_external_alias" {
#   name     = "group_alias_github_external"
#   mount_accessor = vault_jwt_auth_backend.jwt_github.accessor
#   canonical_id = vault_identity_group.github_external.id
# }
