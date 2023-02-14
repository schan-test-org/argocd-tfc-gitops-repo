########################################
# Common
########################################
project     = "dev-eks-prj"
aws_region  = "ap-northeast-2"
env             = "dev"

default_tags = {
  dept  = "DEVOPS/TERRAFORM-CLOUD-GITOPS-TESTING"
}

########################################
# workspace setting
########################################
tfc_org = "schan-test"
tfc_wk = "dev-eks-tfc"

########################################
# etc setting
########################################
eks_cluster_name       = "devtest-eks"

########################################
# helm
########################################
helm_release_name  = "argocd"
helm_chart_name    = "argo-cd"
helm_chart_version = "5.19.11"
# helm_chart_version  = "4.10.9"
helm_repository_url = "https://argoproj.github.io/argo-helm"
# helm_repository_url = "https://aws.github.io/eks-charts"

create_namespace = true
namespace        = "argocd"

controller_values = {
  replicas = 1
  metrics = {
    enabled = true
    serviceMonitor = {
      enabled = false
    }
  }

  resources = {}
}

dex_values = {
  enabled = true
  metrics = {
    enabled = true
    serviceMonitor = {
      enabled = false
    }
  }

  resources = {}
}

redis_values = {
  enabled = true
  metrics = {
    enabled = true
    serviceMonitor = {
      enabled = false
    }
  }

  resources = {}
}

redis_ha_values = {
  enabled = false
}
########################################
# argocd server value
########################################
server_values = {
  replicas = 1
  metrics = {
    enabled = true
    serviceMonitor = {
      enabled = false
    }
  }

  ingress = {
    enabled = true
    # enabled = false

    annotations = {
      "kubernetes.io/ingress.class"                        = "alb"
      "alb.ingress.kubernetes.io/scheme"                   = "internet-facing"
      "alb.ingress.kubernetes.io/target-type"              = "ip"
      "alb.ingress.kubernetes.io/load-balancer-name"       = "dev-argocd"
      "alb.ingress.kubernetes.io/subnets"                  = "subnet-0fbc809bfc2f2760e, subnet-09ab27b079a2aa375"
      "alb.ingress.kubernetes.io/certificate-arn"          = "arn:aws:acm:ap-northeast-2:524542846721:certificate/bb52c420-ccac-415c-9d51-8b42417bc886"
      "alb.ingress.kubernetes.io/backend-protocol"         = "HTTPS"
      "alb.ingress.kubernetes.io/listen-ports"             = "[{\"HTTP\": 80}, {\"HTTPS\": 443}]"
      "alb.ingress.kubernetes.io/ssl-redirect"             = "443"
      "alb.ingress.kubernetes.io/load-balancer-attributes" = "deletion_protection.enabled=false"
    }

    hosts = ["argocd.supk.xyz"]
    # hosts = [ "argocd.stg.megaone.com" ]
  }

  resources = {}
}

repoServer_values = {
  replicas = 1
  metrics = {
    enabled = true
    serviceMonitor = {
      enabled = false
    }
  }

  resources = {}
}


configs_values = {
  clusterCredentials = []
}

applicationset_values = {
  enabled = true
  metrics = {
    enabled = true
    serviceMonitor = {
      enabled = false
    }
  }
}

notifications_values = {
  enabled = true
  metrics = {
    enabled = true
    serviceMonitor = {
      enabled = false
    }
  }

  notifiers     = {}
  resources     = {}
  subscriptions = []
  templates     = {}
  triggers      = {}
  bots = {
    slack = {
      enabled = false
    }
  }
}

node_selector = {
  role = "ops"
}

affinity = {
  nodeAffinity = {
    requiredDuringSchedulingIgnoredDuringExecution = {
      nodeSelectorTerms = [{
        matchExpressions = [{
          key      = "role"
          operator = "In"
          values   = ["ops"]
        }]
      }]
    }
  }
}

tolerations = [{
  key      = "role"
  operator = "Equal"
  value    = "ops"
  effect   = "NoSchedule"
}]







