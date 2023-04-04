#!/bin/bash

# Define the Docker image names and tags
image1="vote-va"
tag1="latest"
image2="worker-va"
tag2="latest"
image3="result-va"
tag3="latest"

# Login to Docker Hub
#docker login -u your-username -p your-password

# delete existing images
docker rmi anshuhtwt/${image1} anshuhtwt/${image2} anshuhtwt/${image3}

# Build and tag the Docker images
docker build -t anshuhtwt/${image1}:${tag1} /home/admin/Voting-App/vote/
docker build -t anshuhtwt/${image2}:${tag2} /home/admin/Voting-App/result/
docker build -t anshuhtwt/${image3}:${tag3} /home/admin/Voting-App/worker/

# Push the Docker images to Docker Hub
docker push anshuhtwt/${image1}:${tag1}
docker push anshuhtwt/${image2}:${tag2}
docker push anshuhtwt/${image3}:${tag3}

# Logout from Docker Hub
#docker logout
