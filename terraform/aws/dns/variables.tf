variable "AWS_ACCESS_KEY_ID" {
  type        = string
  sensitive   = true
  description = "The AWS access key id. Sourced from AWS_ACCESS_KEY_ID env var."
}

variable "AWS_REGION" {
  type        = string
  description = "The AWS region to use."
  default     = "us-east-1"
}

variable "AWS_SECRET_ACCESS_KEY" {
  type        = string
  sensitive   = true
  description = "The AWS access key. Sourced from AWS_SECRET_ACCESS_KEY env var."
}

variable "domain" {
  type        = string
  description = "The root domain to use. ex: my-domain.com"
}

variable "droplet_ip_address" {
  type        = string
  description = "The ip address of the digital ocean droplet."
}

variable "subdomain" {
  type        = string
  description = "The subdomain to be used for the droplet. ex: plex.my-domain.com"
}
