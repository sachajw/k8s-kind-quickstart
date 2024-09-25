variable "kind_cluster_name" {
  type        = string
  description = "The name of the cluster"
  default     = "kind"
}

variable "kind_cluster_config_path" {
  type        = string
  description = "Cluster's kubeconfig location"
  default     = "~/.kube/config"
}

variable "ortelius_namespace" {
  type        = string
  description = "namespace"
  default     = "kind"
}

#variable "backstage_namespace" {
#  type        = string
#  description = "The Backstage namespace"
#  default     = "backstage"
#}
