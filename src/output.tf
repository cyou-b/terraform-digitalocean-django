output "droplet_ip" {
  value = digitalocean_droplet.instance.ipv4_address
}

output "domain" {
  value = digitalocean_domain.main_domain.name
}
