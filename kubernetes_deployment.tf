resource "kubernetes_deployment" "qoq" {
  metadata {
    name = "qoq-app"
    labels = {
      App = "qoq"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "qoq"
      }
    }
    template {
      metadata {
        labels = {
          App = "qoq"
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