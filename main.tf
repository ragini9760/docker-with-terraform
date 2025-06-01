
# Pull the Nginx image
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

# Create and run the Nginx container
resource "docker_container" "nginx_container" {
  name  = "nginx_container"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = 8080
  }
}
