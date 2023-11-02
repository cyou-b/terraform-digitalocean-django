# Cyou.b - terraform-digitalocean-droplet

This Terraform project simplifies the process of setting up a DigitalOcean droplet by leveraging the power of Terraform. It provides a well-organized approach to provisioning resources, making it easier for users to automate the deployment process.

## Terraform Resources Used:

### 1. DigitalOcean Droplet
**Resource:** digitalocean_droplet.instance

**Purpose:** Creates a DigitalOcean droplet based on specified configurations, including image, region, size, and name.

## Prerequisites:
**DigitalOcean Account:** You need an active DigitalOcean account to create and manage the droplet.

**Terraform Installed:** Ensure Terraform is installed on your local machine.

**DigitalOcean API Token:** Obtain a DigitalOcean API token and set it in the digitalocean_token variable.


## Usage

1. **Clone the Repository**

```bash
git clone https://github.com/cyou-b/terraform-staticsite.git
cd terraform-staticsite
```

2. **Configure main (Optional)**

- Configure main.tf if want to configure a S3 bucket backend to store terraform config.

3. **Set Terraform Variables**

create tfvars file with data

```bash
# terraform.tfvars
digitalocean_token = "YOUR_DIGITALOCEAN_API_TOKEN"
droplet_image      = "ubuntu-22-04-x64"
droplet_name       = "your-droplet-name"
droplet_region     = "nyc1"
droplet_size       = "s-1vcpu-1gb"
```


4. **Initialize Terraform**

```bash
terraform init
```

5. **Review Terraform Plan**

```bash
terraform plan --var-file terraform.tfvars
```

6. **Apply Terraform Changes**

```bash
terraform apply --var-file terraform.tfvars
```

After apply changes, will be necessary add DNS nameservers to you domain 

7. **Cleanup (Optional)**

```bash
terraform destroy
```

## License
This project is licensed under the [License Name] License - see the [LICENSE.md](LICENSE.md) file for details.
