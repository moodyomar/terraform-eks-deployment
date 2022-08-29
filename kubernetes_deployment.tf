resource "kubernetes_namespace" "qoq" {
  metadata {
    name = "qoq-ns"
  }
}

resource "kubernetes_deployment" "qoq" {
  metadata {
    name = "qoq-app"
    labels = {
      app = "qoq"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "qoq"
      }
    }
    template {
      metadata {
        labels = {
          app = "qoq"
        }
      }
      spec {
        container {
          image = "moodyomarz/qoq"
          name  = "qoq-app"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}
resource "kubernetes_service" "qoq" {
  metadata {
    name      = "qoq-ser"
    namespace = kubernetes_namespace.qoq.metadata.0.name
  }
  spec {
    selector = {
      app = kubernetes_deployment.qoq.spec.0.template.0.metadata.0.labels.app
    }
    type = "LoadBalancer"
    port {
      port        = 80
      target_port = 80
    }
  }
}