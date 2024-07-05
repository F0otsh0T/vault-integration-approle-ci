# 99.outputs.tf

# output "" {
#     value = 
# }

################################################
#  OUTPUTS
################################################

output "vault_auth_approle_role_id" {
  value = vault_approle_auth_backend_role.auth_approle_role_github.role_id
}







