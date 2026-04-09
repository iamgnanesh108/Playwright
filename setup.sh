#!/bin/bash
# Switch to root
#sudo su -

#---Install Git ---
yum install git -y
git clone https://github.com/iamgnanesh108/Playwright.git
cd Playwright



# --- Install Docker ---
yum install -y docker
systemctl start docker
systemctl enable docker

# Add ec2-user to docker group
sudo groupadd docker || true
sudo usermod -a -G docker ec2-user
sudo chmod 666 /var/run/docker.sock

#-------Build image------
docker build -t pwimage .

#------run image----
docker run pwimage

docker rm -f pwimage
