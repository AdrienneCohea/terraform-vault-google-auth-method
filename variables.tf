variable "description" {
  type        = string
  default     = "Google authentication"
  description = "Description of the authentication method"
}

variable "path" {
  type        = string
  default     = "gcp"
  description = "Endpoint path to the authentication method"
}

variable "credentials" {
  type        = string
  default     = null
  description = "A JSON string containing the contents of a GCP credentials file. If this value is empty, Vault will try to use Application Default Credentials from the machine on which the Vault server is running."
}

variable "gce_roles" {
  type = map(object({
    bound_service_accounts = optional(list(string))
    token_policies         = optional(list(string))
    bound_zones            = optional(list(string))
    bound_instance_groups  = optional(list(string))
    bound_labels           = optional(list(string))
  }))
  default     = {}
  description = "The GCE roles to configure in this authentication method"
}

variable "iam_roles" {
  type = map(object({
    token_policies         = list(string)
    bound_service_accounts = list(string)
    max_jwt_exp            = optional(number)
    allow_gce_inference    = optional(bool)
  }))
  default     = {}
  description = "The IAM roles to configure in this authentication method"
}
