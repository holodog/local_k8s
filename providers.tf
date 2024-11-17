terraform {
  required_providers {
    k3d = {
      source  = "pvotal-tech/k3d"
      version = "0.0.7"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.12.1"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 4.26.0"
    }
  }
}

provider "local" {
}

provider "k3d" {
}