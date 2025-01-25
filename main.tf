module "cloudflare_access" {
  source = "./modules/cloudflare-access"

  account_id = var.account_id
  zone_id    = var.zone_id
  client_id = var.client_id # google client id in this case for the identity provider
  client_secret = var.client_secret
  # Configure Google as an identity provider
  identity_providers = {
    google = {
      name = "Google Workspace"
      type = "google"
    }
  }

  applications = [
    # application number 1
    {
      name         = "my-web-app",
      domain       = "internal-app2.nexgendevworks.com",
      # Reference the Google IdP ID using Terraform's resource reference
     allowed_idps = [module.cloudflare_access.my_idp_id]
      group_name   = "all-users"
      policy_name  = var.policy_name1
    }
  ]
}