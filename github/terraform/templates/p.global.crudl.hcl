# Allow tokens to look up their own properties
path "auth/token/lookup-self" {
    capabilities = ["read"]
}

# Allow tokens to renew themselves
path "auth/token/renew-self" {
    capabilities = ["update"]
}

# Allow tokens to revoke themselves
path "auth/token/revoke-self" {
    capabilities = ["update"]
}

# Allow a token to look up its own capabilities on a path
path "sys/capabilities-self" {
    capabilities = ["update"]
}

# Allow a token to look up its own entity by id or name
path "identity/entity/id/{{identity.entity.id}}" {
  capabilities = ["read"]
}
path "identity/entity/name/{{identity.entity.name}}" {
  capabilities = ["read"]
}


# Allow a token to look up its resultant ACL from all policies. This is useful
# for UIs. It is an internal path because the format may change at any time
# based on how the internal ACL features and capabilities change.
path "sys/internal/ui/resultant-acl" {
    capabilities = ["read"]
}

# Allow a token to renew a lease via lease_id in the request body; old path for
# old clients, new path for newer
path "sys/renew" {
    capabilities = ["update"]
}
path "sys/leases/renew" {
    capabilities = ["update"]
}

# Allow looking up lease properties. This requires knowing the lease ID ahead
# of time and does not divulge any sensitive information.
path "sys/leases/lookup" {
    capabilities = ["update"]
}

# Allow management of secrets path hello (r)
path "hello/*" {
    capabilities = ["read"]
}

# Allow management of secrets path hello (crudl)
path "hello/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

# Allow a token to manage its own cubbyhole
path "cubbyhole/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

# Allow management of secrets path afw_kv (crudl)
path "afw_kv/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

# Allow management of secrets path afw_ncvsrx_kv (crudl)
path "afw_ncvsrx_kv/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

# Allow management of secrets path afw_ncvsrx_var_kv (crudl)
path "afw_ncvsrx_var_kv/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

# Allow management of secrets path afw_ssh (crudl)
path "afw_ssh/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

# Allow management of secrets path aws (crudl)
path "aws/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

# Allow management of secrets path kv1 (crudl)
path "kv1/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

# Allow management of secrets path pki (crudl)
path "pki/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

# Allow management of secrets path pki_int (crudl)
path "pki_int/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

# Allow a token to manage all secrets
path "*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

# Allow a token to wrap arbitrary values in a response-wrapping token
path "sys/wrapping/wrap" {
    capabilities = ["update"]
}

# Allow a token to look up the creation time and TTL of a given
# response-wrapping token
path "sys/wrapping/lookup" {
    capabilities = ["update"]
}

# Allow a token to unwrap a response-wrapping token. This is a convenience to
# avoid client token swapping since this is also part of the response wrapping
# policy.
path "sys/wrapping/unwrap" {
    capabilities = ["update"]
}

# Allow general purpose tools
path "sys/tools/hash" {
    capabilities = ["update"]
}
path "sys/tools/hash/*" {
    capabilities = ["update"]
}

# Allow checking the status of a Control Group request if the user has the
# accessor
path "sys/control-group/request" {
    capabilities = ["update"]
}

# Mount the AppRole auth method
path "sys/auth/approle" {
  capabilities = [ "create", "read", "update", "delete", "sudo" ]
}

# Configure the AppRole auth method
path "sys/auth/approle/*" {
  capabilities = [ "create", "read", "update", "delete" ]
}

# Create and manage roles
path "auth/approle/*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}

# Write ACL policies
path "sys/policies/acl/*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}

# Write test data
# Set the path to "secret/data/mysql/*" if you are running `kv-v2`
path "secret/mysql/*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}
