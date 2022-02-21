#!/bin/bash
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 752436870060.dkr.ecr.us-east-1.amazonaws.com
sleep 2s
echo 'Building Docker Image'
docker build -t trey_node_api .
sleep 10s
docker tag trey_node_api:latest 752436870060.dkr.ecr.us-east-1.amazonaws.com/trey_node_api:latest
echo 'Pushing container to ECR'
sleep 2s
docker push 752436870060.dkr.ecr.us-east-1.amazonaws.com/trey_node_api:latest