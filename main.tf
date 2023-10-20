terraform {
  required_version = ">= 0.13.1"

  required_providers {
    shoreline = {
      source  = "shorelinesoftware/shoreline"
      version = ">= 1.11.0"
    }
  }
}

provider "shoreline" {
  retries = 2
  debug = true
}

module "etag_header_server_information_leak_protection_for_nginx_server" {
  source    = "./modules/etag_header_server_information_leak_protection_for_nginx_server"

  providers = {
    shoreline = shoreline
  }
}