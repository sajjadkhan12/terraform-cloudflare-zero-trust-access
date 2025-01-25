variable "account_id" {
  type        = string
  description = "Cloudflare account ID where the Access Group will be created."
}

variable "zone_id" {
  type        = string
  description = "Cloudflare zone ID where the Access Application will be created."
}

variable "applications" {
  type = list(object({
    name             = string
    domain           = string
    allowed_idps     = list(string)
    session_duration = optional(string, "24h")
    group_name       = optional(string, "everyone")
    policy_name      = optional(string, "allow-policy")
  }))
  description = "List of applications to protect with Cloudflare Access, each with its own Access Group and Policy."
}
variable "identity_providers" {
  type = map(object({
    name = string
    type = string
    # For Google, you'll need additional configurations like client_id/client_secret
    config = optional(list(map(string)), [])
  }))
  description = "Map of identity providers (e.g., Google) to configure."
}

variable "client_id" {
  type        = string
  description = "Google client ID for the identity provider."
}
variable "client_secret" {
  type        = string
  description = "Google client secret for the identity provider."
}
