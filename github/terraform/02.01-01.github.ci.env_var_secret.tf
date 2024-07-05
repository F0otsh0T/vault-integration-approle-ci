# 02.01-01.github.ci.env_secret.tf

data "github_repository" "repo_ci_runner" {
  full_name = "${var.github_ci_runner_org_name}/${var.github_ci_runner_repo_name}"
}

# ENVIRONMENT: VARIABLES & SECRETS
# PERSISTS BETWEEN STEPS

# resource "github_repository_environment" "repo_environment" {
#   repository       = data.github_repository.repo_ci_runner.name
#   environment      = "example_environment"
# }

# resource "github_actions_environment_secret" "env_secret_roleid" {
#   repository       = data.github_repository.repo_ci_runner.name
#   environment      = github_repository_environment.repo_environment.environment
#   secret_name      = "env_secret_roleid"
#   plaintext_value  = vault_approle_auth_backend_role.auth_approle_role_github.role_id
# }

# resource "github_actions_environment_variable" "env_variable_roleid" {
#   repository       = data.github_repository.repo_ci_runner.name
#   environment      = github_repository_environment.repo_environment.environment
#   variable_name    = "env_variable_roleid"
#   value            = vault_approle_auth_backend_role.auth_approle_role_github.role_id
# }

# EXAMPLES

# resource "github_actions_environment_secret" "test_secret" {
#   repository       = data.github_repository.repo_ci_runner.name
#   environment      = github_repository_environment.repo_environment.environment
#   secret_name      = "test_secret_name"
#   plaintext_value  = "%s"
# }

# resource "github_actions_environment_variable" "example_variable" {
#   repository       = data.github_repository.repo_ci_runner.name
#   environment      = github_repository_environment.repo_environment.environment
#   variable_name    = "example_variable_name"
#   value            = "example_variable_value"
# }

# GITHUB ACTIONS: VARIABLES AND SECRETS

resource "github_actions_variable" "variable_example" {
  repository    = data.github_repository.repo_ci_runner.name
  variable_name = "variable_name"
  value         = "example_variable_value"
}

resource "github_actions_variable" "variable_roleid" {
  repository    = data.github_repository.repo_ci_runner.name
  variable_name = "variable_roleid"
  value         = vault_approle_auth_backend_role.auth_approle_role_github.role_id
}

# resource "github_actions_variable" "variable_docker_test" {
#   repository    = data.github_repository.repo_ci_runner.name
#   variable_name = "variable_docker_test"
#   value         = var.docker_password
# }

resource "github_actions_secret" "secret_roleid_plaintext" {
  repository      = data.github_repository.repo_ci_runner.name
  secret_name     = "secret_roleid"
  plaintext_value = vault_approle_auth_backend_role.auth_approle_role_github.role_id
}

resource "github_actions_secret" "secret_vault" {
  repository      = data.github_repository.repo_ci_runner.name
  secret_name     = each.key
  plaintext_value = each.value
  for_each = {
    "VAULT_ADDR"                 = var.vault_url
    "VAULT_NAMESPACE"            = var.vault_namespace
    "VAULT_AUTH_JWT_GITHUB_PATH" = vault_jwt_auth_backend.jwt_github.path
    "VAULT_AUTH_JWT_GITHUB_ROLE" = vault_jwt_auth_backend_role.jwt_github_ci_runner_role.role_name
    "VAULT_AUTH_APPROLE_PATH"    = vault_auth_backend.auth_approle_github.path
    "VAULT_AUTH_APPROLE_ROLE"    = vault_approle_auth_backend_role.auth_approle_role_github.role_name
    "DOCKER_USER"                = var.docker_user
    "DOCKER_PASSWORD"            = var.docker_password
  }
}

# resource "github_actions_secret" "secret_roleid_encrypted" {
#   repository       = data.github_repository.repo_ci_runner.name
#   secret_name      = "example_secret_name"
#   encrypted_value  = vault_approle_auth_backend_role.auth_approle_role_github.role_id
# }


