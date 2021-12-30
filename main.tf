resource "vault_gcp_auth_backend" "method" {
  credentials = var.credentials
  path        = var.path
  description = var.description
}

resource "vault_gcp_auth_backend_role" "gce" {
  for_each = var.gce_roles

  backend                = vault_gcp_auth_backend.method.path
  role                   = each.key
  type                   = "gce"
  token_policies         = each.value.token_policies
  bound_projects         = each.value.bound_projects
  bound_service_accounts = each.value.bound_service_accounts
  bound_zones            = each.value.bound_zones
  bound_instance_groups  = each.value.bound_instance_groups
  bound_labels           = each.value.bound_labels
}

resource "vault_gcp_auth_backend_role" "iam" {
  for_each = var.iam_roles

  backend                = vault_gcp_auth_backend.method.path
  role                   = each.key
  type                   = "iam"
  token_policies         = each.value.token_policies
  bound_service_accounts = each.value.bound_service_accounts
  max_jwt_exp            = each.value.max_jwt_exp
  allow_gce_inference    = each.value.allow_gce_inference
}
