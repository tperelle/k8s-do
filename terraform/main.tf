# Configure Terraform
terraform {
  required_version = "~> 0.12.0"
}

# Configure the DigitalOcean Provider
# DO token is taken from DIGITALOCEAN_TOKEN environment variable
provider "digitalocean" {
  version = "~> 1.4.0"
}

provider "local" {
  version = "~> 1.2.2"
}

provider "template" {
  version = "~> 2.1.2"
}

provider "random" {
  version = "~> 2.0"
}