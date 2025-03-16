data "k3d_cluster" "k3d_cluster" {
  name       = k3d_cluster.k3d_cluster.name
  depends_on = [resource.k3d_cluster.k3d_cluster]
}

output "cluster_name" {
  value      = data.k3d_cluster.k3d_cluster.name
  depends_on = [data.k3d_cluster.k3d_cluster]
}

output "cluster_config" {
  value      = data.k3d_cluster.k3d_cluster.kubeconfig_raw
  depends_on = [data.k3d_cluster.k3d_cluster]
}

output "credentials" {
  value = k3d_cluster.k3d_cluster.credentials
}