terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.17.1"
    }
  }
}

provider "digitalocean" {
  # Configuration options
  token = var.DIGITALOCEAN_TOKEN
}

data "template_file" "cloud_config" {
  template = file("${path.module}/cloud-config.yml")
  vars = {
    subdomain                                   = var.subdomain
    droplet_user                                = var.droplet_user
    email                                       = var.email
    oauth_client_id                             = var.oauth_client_id
    oauth_client_secret                         = var.oauth_client_secret
    root_folder_id                              = var.root_folder_id
    service_account_auth_provider_x509_cert_url = var.service_account_auth_provider_x509_cert_url
    service_account_auth_uri                    = var.service_account_auth_uri
    service_account_client_email                = var.service_account_client_email
    service_account_client_id                   = var.service_account_client_id
    service_account_client_x509_cert_url        = var.service_account_client_x509_cert_url
    service_account_file_name                   = var.service_account_file_name
    service_account_private_key                 = var.service_account_private_key
    service_account_private_key_id              = var.service_account_private_key_id
    service_account_project_id                  = var.service_account_project_id
    service_account_token_uri                   = var.service_account_token_uri
    service_account_type                        = var.service_account_type
    ssh_public_key                              = var.ssh_public_key
  }
}

resource "digitalocean_droplet" "droplet" {
  image     = "ubuntu-18-04-x64"
  name      = "plex-1"
  region    = "nyc1"
  size      = "s-1vcpu-1gb"
  user_data = data.template_file.cloud_config.rendered
  tags      = var.tags

  # TODO: remove this is you need to make changes to the user_data property
  lifecycle {
    ignore_changes = [
      user_data
    ]
  }
}

output "ip_address" {
  value = digitalocean_droplet.droplet.ipv4_address
}
