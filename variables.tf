variable "account_id" {
  type        = string
  description = "Cloudflare account ID where the Access Group will be created."
}

variable "zone_id" {
  type        = string
  description = "Cloudflare zone ID where the Access Application will be created."
}

variable "client_id" {
  type        = string
  description = "Google client ID for the identity provider."
}
variable "client_secret" {
  type        = string
  description = "Google client secret for the identity provider."
}

variable "policy_name1" {
  type        = string
  description = "Name of the policy to create."
}
