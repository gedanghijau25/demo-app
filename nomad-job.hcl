job "demo-app" {
  datacenters = ["dc1"]

  group "demo" {
    network {
      port "http" { to = 8080 }
    }

    task "app" {
      driver = "docker"

      config {
        image = "gedanghijau25/demo-app:latest"
        ports = ["http"]
      }

      resources {
        cpu    = 500
        memory = 512
      }
    }
  }
}
