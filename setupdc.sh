#!/bin/bash
# Switch to root
#sudo su -

#---Install Git ---
#yum install git -y
#git clone https://github.com/iamgnanesh108/Playwright.git
#cd Playwright



# --- Install Docker ---
yum install -y docker
systemctl start docker
systemctl enable docker

# Add ec2-user to docker group
sudo groupadd docker || true
sudo usermod -a -G docker ec2-user
sudo chmod 666 /var/run/docker.sock

sudo curl -L "https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

docker-compose up --scale myapp=2
