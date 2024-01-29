****Note:

jenkins & nomad running on different ec2
allow 4646 port for nomad & 8080 port for jenkins 

jenkins installation:

ubuntu ec2: https://pkg.jenkins.io/debian-stable/

linux ec2: https://www.jenkins.io/doc/tutorials/tutorial-for-installing-jenkins-on-AWS/

Nomad Installation:

linux:

-->sudo yum install -y yum-utils

-->sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo

-->sudo yum -y install nomad

ubuntu:

-->sudo apt-get update && \

  sudo apt-get install wget gpg coreutils
  
-->wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

-->echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

-->sudo apt-get update && sudo apt-get install nomad

-->nomad version

-->sudo nomad agent -dev \
  -bind 0.0.0.0 \
  -network-interface='{{ GetDefaultInterfaces | attr "name" }}'
  
-->export NOMAD_ADDR=http://localhost:4646

-->nomad node status

jenkins ec2: 

1.Install jenkins,Docker,install nomad but dont run,git 

2.sudo apt install docker.io 

3.sudo systemctl enable docker

4.sudo systemctl start docker 

5.sudo systemctl status docker

6.sudo systemctl status jenkins

7.sudo apt-get update

8.sudo apt install openjdk-11-jdk

9.java --version

10.sudo chmod 666 /var/run/docker.sock

11.copy publicip:8080 on browser 
  username: admin
  password: cat /var/lib/jenkins/secrets/initialAdminPassword
  
12.Go to manage jenkins--> plugins --> nomad

13.Go to manage jenkins --> clouds --> click nomad option --> save

14.copy nomad url and paste on Nomad API URL box --> test connection --> successfull

if multi-node nomad need token 
create a token on nomad --> click on Nomad ACl ADD dropdown --> click on secret text --> add token in secret --> ID as nomad token --> description as Nomad token--> save 
click on test connection it is succesfull. 

Nomad ec2:

1.copy publicip:4646 on browser 


------------
Trigger jenkins job automatically whenever any changes in GitHub:-

IN Jenkins:

1.create new Freestyle job --> GitHub project --> paste git hub url https://github.com/jagadeeshreddy280/app-frontend.git

2.scm --> click Git --> give cred --> branch main or master

3.click on Github hook trigger for GITSCM option --> save

IN GITHUB:

1.Go to repository 

2.Inside repo --> settings -->click webhooks -->click add webhooks

3.Copy Jenkins url like http://2.33.344.44:8080 and Add /github-webhook/

     Example: http://35.154.114.196:8080/github-webhook/
     
4. Add in Payload URL --> save it.

5. Change anything or push any file into git repo we can see job is triggerd automatically.


links:

https://www.devopsschool.com/blog/how-to-build-when-a-change-is-pushed-to-github-in-jenkins/
