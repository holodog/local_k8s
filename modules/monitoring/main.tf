resource "helm_release" "monitoring" {
  chart            = "kube-prometheus-stack"
  name             = "kube-prometheus-stack"
  repository       = "https://prometheus-community.github.io/helm-charts"
  namespace        = "monitoring"
  create_namespace = true

  values = ["${file("${path.module}/values.yaml")}"]
}

resource "kubectl_manifest" "traefik_middleware_prefix" {
  yaml_body = <<YAML
apiVersion: traefik.io/v1alpha1
kind: Middleware
metadata:
  name: grafana-stripprefix-prefix
spec:
  stripPrefix:
    prefixes:
      - /grafana
YAML
}

resource "kubectl_manifest" "traefik_middleware_redirect" {
  yaml_body = <<YAML
apiVersion: traefik.io/v1alpha1
kind: Middleware
metadata:
  name: grafana-stripprefix-redirect
spec:
  redirectRegex:
    regex: ^https://k8s_local/(.*)
    replacement: https://k8s.dev/${1}
YAML
}

resource "kubectl_manifest" "grafana_dashboard_ing_route" {
  yaml_body = <<YAML
apiVersion: traefik.containo.us/v1alpha1
kind: IngressRoute
metadata:
  name: grafana
  namespace: monitoring
spec:
  entryPoints:
    - websecure
  routes:
    - kind: Rule
      match: Host(`k8s.dev`) && PathPrefix(`/grafana`)
      services:
        - kind: Service
          name: kube-prometheus-stack-grafana
          port: 80
      middlewares:
        - name: grafana-stripprefix-prefix
        - name: grafana-stripprefix-redirect
YAML
}
