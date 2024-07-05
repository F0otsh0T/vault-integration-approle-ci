# 00.variables.tf

# variable "" {
#     type = string
#     description = ""
#     sensitive = false
#     default = ""
# }

################################################
# DEMO VARIABLES

variable "user" {
  type        = string
  description = "Demo User"
  sensitive   = false
  default     = "user"
}

################################################
# RANDOM VARIABLES

variable "pet_name" {
  type        = string
  description = "Pet Name"
  sensitive   = false
  default     = "pet"
}

variable "uuid" {
  type        = string
  description = "UUID"
  sensitive   = false
  default     = "00000000-0000-0000-0000-000000000"
}

################################################
# VAULT VARIABLES

variable "vault_token" {
  type        = string
  description = "Vault Token"
  sensitive   = false
  default     = ""
}

variable "vault_url" {
  type        = string
  description = "Vault URL"
  sensitive   = false
  default     = "http://localhost:8200"
}

variable "vault_namespace" {
  type        = string
  description = "Vault Namespace"
  sensitive   = false
  default     = "admin"
}

variable "vault_port" {
  type        = string
  description = "Vault Port"
  sensitive   = false
  default     = "8200"
}

variable "vault_cli_port" {
  type        = string
  description = "Vault CLI Port"
  sensitive   = false
  default     = "8250"
}

variable "vault_auth_mount_path" {
  type        = string
  description = "Vault Authentication Mount Path"
  sensitive   = false
  default     = "jwt-github-actions"
}

################################################
# GITHUB VARIABLES

variable "github_token" {
  type        = string
  description = "GitHub Token - Environment Variable: GITHUB_TOKEN" # Utilize this unless using `GITHUB_TOKEN` environment variable
  sensitive   = true
  default     = ""
}

variable "github_ci_runner_org_name" {
  type        = string
  description = "GitHub Organization Name for CI Runner / Trusted Broker"
  sensitive   = false
  default     = "org"
}

variable "github_ci_runner_repo_name" {
  type        = string
  description = "GitHub Repository Name for CI Runner / Trusted Broker"
  sensitive   = false
  default     = "repo"
}

variable "github_app_org_name" {
  type        = string
  description = "GitHub Organization Name for App"
  sensitive   = false
  default     = "org"
}

variable "github_app_repo_name" {
  type        = string
  description = "GitHub Repository Name for App"
  sensitive   = false
  default     = "repo"
}

################################################
# DOCKER VARIABLES

variable "docker_user" {
    type = string
    description = "Docker User"
    sensitive = false
    default = ""
}

variable "docker_password" {
    type = string
    description = "Docker Password or Personal Access Token"
    sensitive = false
    default = ""
}
