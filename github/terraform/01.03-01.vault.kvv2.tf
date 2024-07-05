# 01.03-01.vault.kvv2.tf

resource "vault_mount" "github" {
  type        = "kv"
  description = "KVv2 Secret Engine Mount: GitHub"
  options     = { version = "2" }
  path        = "github"
}

resource "vault_kv_secret_v2" "dadgarcorp-dev" {
  mount               = vault_mount.github.path
  name                = "app01"
  cas                 = 1
  delete_all_versions = true
  data_json = jsonencode(
    {
      password = "@Pp10P@$$w0rd",
      zip      = "zap1",
      foo      = "bar1"
    }
  )
}





