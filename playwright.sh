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

# --- Pull Playwright image ---
docker pull mcr.microsoft.com/playwright:v1.58.1-jammy
docker tag mcr.microsoft.com/playwright:v1.58.1-jammy mypw:latest

# --- Run container with port mapping ---
docker run -dit -p 8080:8080 --name playwright mypw:latest /bin/bash

# --- Inside container automation ---
docker exec -it playwright bash -c "
  mkdir -p /workspace &&
  cd /workspace &&
  apt-get update &&
  apt-get install -y git &&
  git clone https://github.com/iamgnanesh108/Playwright.git &&
  cd Playwright/saucedemo/tests &&
  npm install &&
  npx playwright test --reporter=html &&
  npm install -g serve &&
  cd ../playwright-report &&
  serve -s . -l 8080
"
