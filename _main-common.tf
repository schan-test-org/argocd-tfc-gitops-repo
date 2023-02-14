############################# main : local #######################################
locals {
  region                    = var.aws_region
  # eks_package_bucket_name   = var.backend_s3_bucket_name
  # eks_package_bucket_key    = var.eks_s3_key
  # eks_package_bucket_region = local.region
  # eks_tfstat_path           = var.eks_tfstat_path
  # set eks variables from backend s3
  eks_cluster_name                       = var.eks_cluster_name == "" ? data.terraform_remote_state.eks.outputs.eks_cluster_name : var.eks_cluster_name
  eks_endpoint_url                       = var.eks_endpoint_url == "" ? data.terraform_remote_state.eks.outputs.eks_cluster_endpoint : var.eks_endpoint_url
  eks_cluster_certificate_authority_data = var.eks_cluster_certificate_authority_data == "" ? data.terraform_remote_state.eks.outputs.eks_cluster_certificate_authority_data : var.eks_cluster_certificate_authority_data
  eks_auth_token                         = data.aws_eks_cluster_auth.cluster.token

  common_tags = merge(var.default_tags, {
    "region"  = var.aws_region
    "project" = var.project
    "env"     = var.env
    "managed" = "terraform"
  })

  controller_values     = merge(var.controller_values, { nodeSelector = var.node_selector }, { affinity = var.affinity }, { tolerations = var.tolerations })
  dex_values            = merge(var.dex_values, { nodeSelector = var.node_selector }, { affinity = var.affinity }, { tolerations = var.tolerations })
  redis_values          = merge(var.redis_values, { nodeSelector = var.node_selector }, { affinity = var.affinity }, { tolerations = var.tolerations })
  server_values         = merge(var.server_values, { nodeSelector = var.node_selector }, { affinity = var.affinity }, { tolerations = var.tolerations })
  repoServer_values     = merge(var.repoServer_values, { nodeSelector = var.node_selector }, { affinity = var.affinity }, { tolerations = var.tolerations })
  applicationset_values = merge(var.applicationset_values, { nodeSelector = var.node_selector }, { affinity = var.affinity }, { tolerations = var.tolerations })
  notifications_values  = merge(var.notifications_values, { nodeSelector = var.node_selector }, { affinity = var.affinity }, { tolerations = var.tolerations })
}
