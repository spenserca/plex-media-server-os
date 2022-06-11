module "droplet" {
  source                                      = "./digital-ocean/droplet"
  DIGITALOCEAN_TOKEN                          = var.DIGITALOCEAN_TOKEN
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
  service_account_private_key                 = var.service_account_private_key
  service_account_private_key_id              = var.service_account_private_key_id
  service_account_project_id                  = var.service_account_project_id
  service_account_token_uri                   = var.service_account_token_uri
  service_account_type                        = var.service_account_type
  ssh_public_key                              = var.ssh_public_key
  ssh_public_key_laptop                       = var.ssh_public_key_laptop
}

# Remove this section of config if you don't want to setup a domain for your plex server
module "dns" {
  source                = "./aws/dns"
  AWS_ACCESS_KEY_ID     = var.AWS_ACCESS_KEY_ID
  AWS_SECRET_ACCESS_KEY = var.AWS_SECRET_ACCESS_KEY
  domain                = var.domain
  droplet_ip_address    = module.droplet.ip_address
  subdomain             = var.subdomain
}
