variable "path" {
  default = null
}

variable "access_key_id" {}

variable "secret_access_key" {}

variable "default_lease_ttl_seconds" {
  default = null
}

variable "max_lease_ttl_seconds" {
  default = null
}

variable "roles" {
  type = map(object({
    credential_type = optional(string, "assumed_role")
    policy_arns     = optional(set(string), [])
    role_arns       = optional(set(string), [])
    default_sts_ttl = optional(string)
    max_sts_ttl     = optional(string)
    policy_document = optional(string)
  }))
  default  = {}
  nullable = true
}