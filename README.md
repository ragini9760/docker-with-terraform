Docker installed and running on your system.

Terraform installed.

Directory structure:
nginx-terraform/
│
├── provider.tf
├── main.tf
🧩 Step-by-Step Explanation
🔹 1. provider.tf – Docker provider
This tells Terraform to use the local Docker engine:
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}
Make sure your user has permission to access the Docker socket (or run with sudo if needed).

🔹 2. main.tf – Define Docker image and container
resource "docker_image" "nginx_image" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx_container" {
  name  = "nginx_terraform"
  image = docker_image.nginx_image.latest
  ports {
    internal = 80
    external = 8080
  }
}
This creates an Nginx container that maps port 80 inside the container to 8080 on your host.

🚀 How to Deploy
In your terminal, run the following commands:

terraform init
terraform plan
terraform apply
