variable "image_tag" {
  type        = string
  description = "Docker image tag to deploy."
  default     = "20"
}

job "frontend-logs" {
    datacenters = ["dc1"]
    group "frontend" {
        count = 1 
    task "f-logs" {
      driver = "docker"
      config {
        image = "jagadeesh280/app:${var.image_tag}"
auth {
      username = "jagadeeshbhavanam@gmail.com"
      password = "jagadeesh280"
    }   
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




