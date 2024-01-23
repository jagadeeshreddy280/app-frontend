job "frontend-log" {
    datacenters = ["dc1"]
    group "frontend" {
        count = 1 
      task "f-logs" {
      driver = "docker"
      config {
        image = "jagadeesh280/app:9"
      }       
      resources {
        network {
          mbits = 10
          port "http" {
            static = "80"
          }
        }
      }
    }        
    }
}        
