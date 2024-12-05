module "cluster" {
  source = "./modules/cluster"
}

# module "cf_tunnel" {
#   source               = "./modules/cf_tunnel"
#   account_id           = var.cloudflare_account_id
#   cloudflare_api_key   = var.cloudflare_api_key
#   cloudflare_api_token = var.cloudflared_token
#   cloudflare_email     = var.cloudflare_email
#   cloudflare_zone_id   = var.cloudflare_zone_id
# }

# module "traefik" {
#   source     = "./modules/traefik"
#   depends_on = [module.cluster]
# }

module "monitoring" {
  source = "./modules/monitoring"
}

# module "httpbin" {
#   source = "./modules/httpbin"
# }

# resource "local_file" "k3d_kubeconfig" {
#   content    = module.cluster.cluster_config
#   filename   = "k3d_kubeconfig"
#   depends_on = [module.cluster]
# }

# resource "local_file" "k8s_dev_kubeconfig" {
#   filename   = "k8s_dev"
#   content    = module.cluster.credentials[0].raw
#   depends_on = [module.cluster]
# }