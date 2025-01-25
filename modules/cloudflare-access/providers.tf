# modules/zero-trust-cloudflare/providers.tf
terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

provider "cloudflare" {
  api_token = "2cKO3cT6Uceq8OMQgBj4r_5lAq3D7yqGafOeoiOt"
}