resource "vault_aws_secret_backend" "this" {
  path                      = var.path
  access_key                = var.access_key_id
  secret_key                = var.secret_access_key
  default_lease_ttl_seconds = var.default_lease_ttl_seconds
  max_lease_ttl_seconds     = var.max_lease_ttl_seconds
}

resource "vault_aws_secret_backend_role" "this" {
  for_each        = var.roles
  backend         = vault_aws_secret_backend.this.path
  name            = each.key
  credential_type = each.value.credential_type
  default_sts_ttl = each.value.default_sts_ttl
  max_sts_ttl     = each.value.max_sts_ttl
  policy_arns     = each.value.policy_arns
  role_arns       = each.value.role_arns
  policy_document = each.value.policy_document
}