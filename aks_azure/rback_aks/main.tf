provider "kubernetes" {
  config_path      = data.azurerm_kubernetes_cluster.aksv.kube_admin_config_raw
  load_config_file = false
  host             = data.azurerm_kubernetes_cluster.aksv.kube_admin_config[0].host
  username         = data.azurerm_kubernetes_cluster.aksv.kube_admin_config[0].username
  password         = data.azurerm_kubernetes_cluster.aksv.kube_admin_config[0].password
  client_certificate = base64decode(
    data.azurerm_kubernetes_cluster.aksv.kube_admin_config[0].client_certificate,
  )
  client_key = base64decode(
    data.azurerm_kubernetes_cluster.aksv.kube_admin_config[0].client_key,
  )
  cluster_ca_certificate = base64decode(
    data.azurerm_kubernetes_cluster.aksv.kube_admin_config[0].cluster_ca_certificate,
  )
}


resource "kubernetes_cluster_role" "cluster-reader_tag" {
  metadata {
    name = "cluster-reader"
  }

  rule {
    api_groups = [""]
    resources  = ["*"]
    verbs      = ["get", "list", "watch"]
  }
   rule {
    api_groups = ["extensions"]
    resources  = ["*"]
    verbs      = ["get", "list", "watch"]
  }
  
   rule {
    api_groups = ["events.k8s.io"]
    resources  = ["*"]
    verbs      = ["get", "list", "watch"]
  }
}

resource "kubernetes_cluster_role_binding" "example" {
  metadata {
    name = "cluster-reader-binding"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-reader"
  }
  subject {
   	kind      = "Group"
    name      = data.azuread_group.binding_cert.object_id
    api_group = "rbac.authorization.k8s.io"
  }
  depends_on = [kubernetes_cluster_role.cluster-reader_tag]
}

