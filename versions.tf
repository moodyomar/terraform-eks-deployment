terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.28.0"
    }
    docker = {
      source = "kreuzwerker/docker"
      version = "2.20.2"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.13.0"
    }
  }
}
