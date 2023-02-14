############################# main : var #######################################

variable "env" { type = string }
variable "aws_region" { type = string }
variable "project" { type = string }
variable "default_tags" { type = map(string) }

############################# bknd & vpc & network about : var #######################################
variable "tfc_org" { default = "" }
variable "tfc_wk" { default = "" }

############################# eks-cluster : var #######################################
variable "eks_cluster_name" { default = "" }
variable "eks_endpoint_url" { default = "" }
variable "eks_cluster_certificate_authority_data" { default = "" }
variable "eks_auth_token" { default = "" }
# variable "eks_oidc_provider_arn" { default = "" }
# variable "eks_oidc_provider_url" { default = "" }

############################# helm : var #######################################

variable "helm_release_name" { default = "" }
variable "helm_chart_name" { default = "" }
variable "helm_chart_version" { default = "" }
variable "helm_repository_url" { default = "" }
variable "create_namespace" { default = true }
variable "namespace" { default = "argo-cd" }

############################# others : var #######################################
variable "controller_values" { default = {} }

variable "dex_values" { default = {} }

variable "redis_values" { default = {} }

variable "redis_ha_values" { default = {} }

variable "server_values" { default = {} }

variable "repoServer_values" { default = {} }

variable "configs_values" { default = {} }

variable "applicationset_values" { default = {} }

variable "notifications_values" { default = {} }

variable "slack" { default = {} }

variable "node_selector" { default = {} }

variable "affinity" { default = {} }

variable "tolerations" { default = [] }
