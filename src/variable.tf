variable "digitalocean_token" {
  description = "DigitalOcean API Token"
  type        = string
  sensitive   = true
}

# project
variable "project_name" {
  description = "DigitalOcean project name"
  type        = string
  sensitive   = false
}

variable "project_description" {
  description = "DigitalOcean project description"
  type        = string
  sensitive   = false
}

# droplet
variable "droplet_image" {
  description = "The droplet image"
  type        = string
  sensitive   = false
  default     = "ubuntu-22-04-x64"

  validation {
    condition     = can(index(["ubuntu-22-04-x64", "ubuntu-20-04-x64"], var.droplet_image))
    error_message = "Invalid droplet image. Allowed values are: ubuntu-22-04-x64, ubuntu-20-04-x64."
  }
}

variable "droplet_name" {
  description = "The droplet name"
  type        = string
  sensitive   = false
}

variable "droplet_region" {
  description = "The droplet region"
  type        = string
  default     = "nyc1"
  sensitive   = false

  validation {
    condition     = can(index(["nyc1", "nyc2", "nyc3", "sfo1", "sfo2", "sfo3"], var.droplet_region))
    error_message = "Invalid droplet region. Allowed values are: nyc1, nyc2, nyc3, sfo1, sfo2, sfo3."
  }
}

variable "droplet_size" {
  description = "Size of the DigitalOcean Droplet"
  type        = string
  default     = "s-1vcpu-1gb"

  validation {
    condition     = can(index(["s-1vcpu-1gb", "s-2vcpu-2gb", "s-2vcpu-4gb"], var.droplet_size))
    error_message = "Invalid droplet size choice. Allowed values are: s-1vcpu-1gb, s-2vcpu-2gb, s-2vcpu-4gb."
  }
}

# domain
variable "domain_name" {
  description = "The main domain name"
  type        = string
}

variable "subdomain_name" {
  description = "The subdomain name"
  type        = string
}

# ssh key
variable "ssh_key_name" {
  description = "SSH Key name"
  type        = string
  default     = ""
}

variable "ssh_pubkey_file" {
  description = "SSH Key file path"
  type        = string
  default     = ""
}