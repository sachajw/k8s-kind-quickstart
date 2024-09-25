terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "~>0.6.0"
    }

    kubectl = {
      source  = "alekc/kubectl"
      version = "~>2.1.0-beta2"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~>2.15.0"
    }
  }
  required_version = "~>1.5.7"
}

provider "kubectl" {
  #apply_retry_count      = 15
  host                   = kind_cluster.ortelius.endpoint
  cluster_ca_certificate = kind_cluster.ortelius.cluster_ca_certificate
  client_certificate     = kind_cluster.ortelius.client_certificate
  client_key             = kind_cluster.ortelius.client_key
  load_config_file       = false
}

provider "helm" {
  debug = true
  kubernetes {
    host                   = kind_cluster.ortelius.endpoint
    cluster_ca_certificate = kind_cluster.ortelius.cluster_ca_certificate
    client_certificate     = kind_cluster.ortelius.client_certificate
    client_key             = kind_cluster.ortelius.client_key
    config_path            = pathexpand(var.kind_cluster_config_path)
  }
}
