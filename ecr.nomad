job "frontend-logs" {
    datacenters = ["dc1"]
    group "frontend" {
        count = 1 
    task "f-logs" {
      driver = "docker"
      config {
        image = "051650638025.dkr.ecr.us-east-1.amazonaws.com/avaloq:${IMAGE_TAG}"
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
