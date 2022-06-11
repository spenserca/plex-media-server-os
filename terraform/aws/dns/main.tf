terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.6.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region     = var.AWS_REGION
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}

data "aws_route53_zone" "domain_zone" {
  name         = var.domain
  private_zone = false
}

resource "aws_route53_zone" "subdomain_zone" {
  name = var.subdomain
}

resource "aws_route53_record" "domain_ns_record_for_subdomain" {
  name    = var.subdomain
  type    = "NS"
  zone_id = data.aws_route53_zone.domain_zone.id
  ttl     = 172800
  records = aws_route53_zone.subdomain_zone.name_servers
}

resource "aws_route53_record" "subdomain_record_for_ip" {
  name    = var.subdomain
  type    = "A"
  zone_id = aws_route53_zone.subdomain_zone.id
  ttl     = 86400
  records = [var.droplet_ip_address]
}
