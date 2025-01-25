# Terraform Cloudflare Zero Trust Access Module

A Terraform module to configure Cloudflare Zero Trust Access applications and policies, including integration with identity providers like Google. This module automates the setup of protected applications, access groups, and policies to enforce secure authentication.

---

## Features

- **Identity Provider Integration**: Configure Google as an identity provider (IdP) for authentication.
- **Access Applications**: Protect one or multiple domains with Cloudflare Access.
- **Access Groups**: Define groups (e.g., "everyone") to control access.
- **Access Policies**: Create policies to link applications and groups.

---

## Requirements

- **Terraform 1.0+**
- **Cloudflare Provider**: Configured with API token or credentials.
- **Cloudflare Account ID**: The account where resources will be created.
- **Cloudflare Zone ID**: The DNS zone for your domain.
- **Google OAuth Credentials**: Client ID and secret from the [Google Cloud Console](https://console.cloud.google.com/).

---

## Usage

### Basic Example
```hcl
module "cloudflare_access" {
  source = "github.com/your-repo/terraform-cloudflare-access"

  account_id = "<CLOUDFLARE_ACCOUNT_ID>"
  zone_id    = "<CLOUDFLARE_ZONE_ID>"

  # Configure Google as an identity provider
  identity_providers = {
    google = {
      name = "Google"
      type = "google"
      config = {
        client_id     = "<GOOGLE_CLIENT_ID>"
        client_secret = "<GOOGLE_CLIENT_SECRET>"
        apps_domain   = "example.com"  # Your domain
      }
    }
  }

  # Define applications to protect
  applications = [
    {
      name         = "internal-app2"
      domain       = "internal-app2.example.com"
      allowed_idps = [module.cloudflare_access.identity_providers["google"].id]
      session_duration = "24h"  # Optional (default: 24h)
    }
  ]
}