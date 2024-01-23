job "java-logs" {
    datacenters = ["dc1"]
    group "java-logs" {
        count = 1 
    network {
      port "java" {
        static = 8092
        to = 8092
      }
    }
    service {
      name     = "java-svc"
      port     = "java"
      provider = "nomad"
    }        
        task "server" {
            driver = "java" 
            artifact {
                source = "s3://nomad-avaloq-artifacts.s3-us-east-1.amazonaws.com/Vishal-logs-project-1-0.0.1-SNAPSHOT.jar"
            }
            config {
                jar_path = "local/Vishal-logs-project-1-0.0.1-SNAPSHOT.jar"
                args = ["-jar", "Vishal-logs-project-1-0.0.1-SNAPSHOT.jar", "-server.port=8092"]
            }
      constraint {
        attribute = "${attr.unique.hostname}"
        value     = "ip-172-31-85-30.ec2.internal"  # Replace with the actual node name you want to target
      }            
        }
        }
      }
