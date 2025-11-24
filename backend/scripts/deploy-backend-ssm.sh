#!/bin/bash
cd /home/ec2-user/pythonbuddy/backend

# Pull latest code
git pull

# Rebuild docker image
sudo docker build -t pythonbuddy-backend .

# Stop and remove old container if exists
sudo docker stop pythonbuddy-backend || true
sudo docker rm pythonbuddy-backend || true

# Run container again
sudo docker run -d \
  --name pythonbuddy-backend \
  --restart always \
  -p 5001:5001 \
  pythonbuddy-backend
