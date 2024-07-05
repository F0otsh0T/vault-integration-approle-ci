# 01.02-01.vault.policies.tf

################################################
# VAULT POLICIES
################################################

################################################
# POLICY: ROOT LEVEL
resource "vault_policy" "p_root_crudl" {
  name   = "p.root.crudl"
  policy = <<EOF
  
  path "*" {
    capabilities = ["sudo","read","create","update","delete","list","patch"]
  }

  EOF
}

################################################
# POLICY: GLOBAL CRUDL
resource "vault_policy" "p_global_crudl" {
  name   = "p.global.crudl"
  policy = templatefile("${path.module}/templates/p.global.crudl.hcl", {})
}

################################################
# PERSONA: VAULT ADMIN POLICY




################################################
# PERSONA: TRUSTED BROKER POLICY (CI)



################################################
# PERSONA: APPLICATION POLICY (CONSUMER)
resource "vault_policy" "p_gha_app_r" {
  name   = "p.gha-app.r"
  policy = templatefile("${path.module}/templates/p.gha-app.r.hcl", {})
}









