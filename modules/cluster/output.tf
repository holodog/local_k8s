data "k3d_cluster" "k8s_dev" {
  name       = "k8s.dev"
  depends_on = [resource.k3d_cluster.k8s_dev]
}

output "cluster_name" {
  value      = data.k3d_cluster.k8s_dev.name
  depends_on = [data.k3d_cluster.k8s_dev]
}

output "cluster_config" {
  value      = data.k3d_cluster.k8s_dev.kubeconfig_raw
  depends_on = [data.k3d_cluster.k8s_dev]
}

output "credentials" {
  value = k3d_cluster.k8s_dev.credentials
}