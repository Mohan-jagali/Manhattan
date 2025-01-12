terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Create a Docker network
resource "docker_network" "app_network" {
  name = "app_network"
}

# Backend container
resource "docker_container" "backend" {
  name  = "backend"
  image = "backend:latest"
  ports {
    internal = 8282
    external = 8282
  }
  networks_advanced {
    name = docker_network.app_network.name
  }
}

# Frontend container
resource "docker_container" "frontend" {
  name  = "frontend"
  image = "project-frontend:latest"
  ports {
    internal = 80
    external = 8000
  }
  networks_advanced {
    name = docker_network.app_network.name
  }
}

# Reverse proxy container
resource "docker_container" "reverse_proxy" {
  name  = "reverse_proxy"
  image = "nginx:latest"
  ports {
    internal = 80
    external = 80
  }
  networks_advanced {
    name = docker_network.app_network.name
  }
  volumes {
    host_path      = "./nginx.conf"
    container_path = "/etc/nginx/nginx.conf"
  }
}

