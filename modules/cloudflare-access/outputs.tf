output "access_applications" {
  description = "Map of created Access Applications."
  value       = { for k, v in cloudflare_zero_trust_access_application.this : k => v }
}

output "access_groups" {
  description = "Map of created Access Groups."
  value       = { for k, v in cloudflare_zero_trust_access_group.this : k => v }
}

output "access_policies" {
  description = "Map of created Access Policies."
  value       = { for k, v in cloudflare_zero_trust_access_policy.this : k => v }
}

output "my_idp_id" {
  value = cloudflare_zero_trust_access_identity_provider.this.id
}