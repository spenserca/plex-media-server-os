variable "DIGITALOCEAN_TOKEN" {
  type        = string
  sensitive   = true
  description = "Digital Ocean access token."
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
  description = "Google OAuth client id."
}

variable "oauth_client_secret" {
  type        = string
  sensitive   = true
  description = "Google OAuth client secret."
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
  sensitive   = true
  description = "Sourced from Google service account json file."
}

variable "service_account_private_key" {
  type        = string
  sensitive   = true
  description = "Sourced from Google service account json file."
}

variable "service_account_client_email" {
  type        = string
  sensitive   = true
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
  sensitive   = true
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
  description = "Public SSH key used to create a secure connection with the droplet."
}

variable "subdomain" {
  type        = string
  description = "The subdomain to be used for the droplet. ex: plex.my-domain.com"
}
