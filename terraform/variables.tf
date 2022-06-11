variable "AWS_ACCESS_KEY_ID" {
  type        = string
  sensitive   = true
  description = "The AWS access key id. Sourced from AWS_ACCESS_KEY_ID env var. DO NOT CHECK INTO SOURCE CONTROL!"
}

variable "AWS_SECRET_ACCESS_KEY" {
  type        = string
  sensitive   = true
  description = "The AWS access key. Sourced from AWS_SECRET_ACCESS_KEY env var. DO NOT CHECK INTO SOURCE CONTROL!"
}

variable "DIGITALOCEAN_TOKEN" {
  type        = string
  sensitive   = true
  description = "Digital Ocean access token. DO NOT CHECK INTO SOURCE CONTROL!"
}

variable "domain" {
  type        = string
  description = "The root domain to use. ex: my-domain.com"
}

variable "droplet_user" {
  type        = string
  description = "The username to use when logging in to the droplet."
}

variable "email" {
  type        = string
  description = "The email address associated with your domain. Used when registering certificates for the server."
}

variable "oauth_client_id" {
  type        = string
  sensitive   = true
  description = "Google OAuth client id. DO NOT CHECK INTO SOURCE CONTROL!"
}

variable "oauth_client_secret" {
  type        = string
  sensitive   = true
  description = "Google OAuth client secret. DO NOT CHECK INTO SOURCE CONTROL!"
}

variable "root_folder_id" {
  type        = string
  description = "The id of the Google drive folder to mount."
}

variable "service_account_type" {
  type        = string
  description = "Sourced from Google service account json file."
}

variable "service_account_project_id" {
  type        = string
  description = "Sourced from Google service account json file."
}

variable "service_account_private_key_id" {
  type        = string
  description = "Sourced from Google service account json file."
}

variable "service_account_private_key" {
  type        = string
  sensitive   = true
  description = "Sourced from Google service account json file. DO NOT CHECK INTO SOURCE CONTROL!"
}

variable "service_account_client_email" {
  type        = string
  description = "Sourced from Google service account json file."
}

variable "service_account_auth_uri" {
  type        = string
  description = "Sourced from Google service account json file."
}

variable "service_account_token_uri" {
  type        = string
  description = "Sourced from Google service account json file."
}

variable "service_account_auth_provider_x509_cert_url" {
  type        = string
  description = "Sourced from Google service account json file."
}

variable "service_account_client_x509_cert_url" {
  type        = string
  description = "Sourced from Google service account json file."
}

variable "service_account_file_name" {
  type        = string
  default     = "service_account.json"
  description = "Name of the service account credential file."
}

variable "service_account_client_id" {
  type        = string
  description = "Sourced from Google service account json file."
}

variable "ssh_public_key" {
  type        = string
  description = "Public SSH key for my desktop."
}

variable "ssh_public_key_laptop" {
  type        = string
  description = "Publish SSH key for my laptop."
}

variable "subdomain" {
  type        = string
  description = "The subdomain to be used for the droplet. ex: plex.my-domain.com"
}
