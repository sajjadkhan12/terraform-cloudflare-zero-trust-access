
resource "cloudflare_zero_trust_access_application" "this" {
  for_each = { for app in var.applications : app.name => app }

  zone_id          = var.zone_id
  name             = each.value.name
  domain           = each.value.domain
  session_duration = each.value.session_duration
  allowed_idps     = each.value.allowed_idps
}

resource "cloudflare_zero_trust_access_group" "this" {
  for_each = { for app in var.applications : app.name => app }

  account_id = var.account_id
  name       = each.value.group_name

  include {
    everyone = true
  }
}

// Specify identity provider
resource "cloudflare_zero_trust_access_identity_provider" "this" {
  name       = "My google identity provider"
  type       = "google"
  account_id = var.account_id
  config {
    client_id     = var.client_id
    client_secret = var.client_secret
  }
 
}
resource "cloudflare_zero_trust_access_policy" "this" {
  for_each = { for app in var.applications : app.name => app }

  application_id = cloudflare_zero_trust_access_application.this[each.key].id
  zone_id        = var.zone_id
  name           = each.value.policy_name
  decision       = "allow"
  precedence     = 1

  include {
    group = [cloudflare_zero_trust_access_group.this[each.key].id]
  }
}