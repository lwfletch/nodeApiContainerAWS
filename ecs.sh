#!/bin/bash
cluster=lwfletch-node-api-cluster
taskDefinition=lwfletch-node-api-task
service=lwfletch-node-api-service
region=us-east-1

# create a cluster
aws ecs create-cluster --cluster-name $cluster --region $region
sleep 2s

echo 'Creating cluser ' $cluster ' on ECS'


# describe task defintion 
# num after : is revision number in --task-definition
# aws ecs describe-task-definition --task-definition trey-node-api-task:5 --region us-east-1
sleep 2s


# register task definition
# --family is name of task definition
aws ecs register-task-definition --family $taskDefinition --cli-input-json file://node-api-task.json --region $region
sleep 2s
echo 'registering task definition ' $taskDefinition ' on ' $cluster

# create service
aws ecs create-service --cluster $cluster --cli-input-json file://node-api-service.json --region $region

# update service
# aws ecs update-service \
#   --cluster your-cluster-name \
#   --service your-service-name \
#   --task-definition your-td-family-name:N \
#   --force-new-deployment \
#   --enable-execute-command