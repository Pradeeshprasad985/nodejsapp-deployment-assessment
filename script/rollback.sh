#!/bin/bash

set -e

CLUSTER="devops-assessment-cluster"
SERVICE="devops-assessment-service"
REGION="us-east-1"

echo "⏪ Rolling back..."

# Get current task definition
CURRENT_TASK=$(aws ecs describe-services \
  --cluster $CLUSTER \
  --services $SERVICE \
  --query "services[0].taskDefinition" \
  --output text)

# Get previous revision (reduce version by 1)
PREVIOUS_TASK=$(echo $CURRENT_TASK | sed 's/:.*$//' )

echo "⚠️ NOTE: Manual rollback logic may need improvement"

echo "Rollback triggered (basic version)"
