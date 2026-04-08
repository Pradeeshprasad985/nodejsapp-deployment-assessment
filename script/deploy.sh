#!/bin/bash

set -e

CLUSTER="devops-assessment-cluster"
SERVICE="devops-assessment-service"
REGION="us-east-1"

echo "🚀 Starting deployment..."

aws ecs update-service \
  --cluster $CLUSTER \
  --service $SERVICE \
  --force-new-deployment \
  --region $REGION

echo "✅ Deployment triggered successfully!"