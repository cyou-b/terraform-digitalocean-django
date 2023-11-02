# ------------------------------------------
# droplet
# ------------------------------------------

resource "digitalocean_droplet" "instance" {
  image  = var.droplet_image
  name   = var.droplet_name
  region = var.droplet_region
  size   = var.droplet_size
}


# ------------------------------------------
# project
# ------------------------------------------

resource "digitalocean_project" "example_project" {
  count       = var.project_name != null ? 1 : 0
  name        = var.project_name
  description = var.project_description
  resources   = [digitalocean_droplet.instance.urn]
}


# ------------------------------------------
# custom domain
# ------------------------------------------

resource "digitalocean_domain" "main_domain" {
  name       = var.domain_name
  ip_address = digitalocean_droplet.instance.ipv4_address
}

resource "digitalocean_record" "main_record" {
  domain = digitalocean_domain.main_domain.name
  type   = "A"
  name   = var.subdomain_name
  value  = digitalocean_droplet.instance.ipv4_address
}

resource "digitalocean_record" "www_record" {
    domain = digitalocean_domain.main_domain.name
    type   = "CNAME"
    name   = "www"
    value  = "${digitalocean_domain.main_domain.name}."
}