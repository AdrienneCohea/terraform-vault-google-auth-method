# terraform-vault-google-auth-method
Enables the Google authentication method

# Example usage

```terraform
module "google-cloud-authentication-method" {
  source = "AdrienneCohea/google-auth-method/vault"

  iam_roles = {
    "nomad-server" = {
      token_policies         = ["nomad-server"]
      bound_service_accounts = ["nomad-server@developer.gserviceaccount.com"]
    }
  }
}
```
