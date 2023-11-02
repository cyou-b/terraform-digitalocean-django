data "digitalocean_ssh_key" "existing_key" {
  name = var.ssh_key_name
}