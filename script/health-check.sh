#!/bin/bash

URL=$1

if [ -z "$URL" ]; then
  echo "Usage: ./health-check.sh <url>"
  exit 1
fi

STATUS=$(curl -s -o /dev/null -w "%{http_code}" $URL)

if [ "$STATUS" -eq 200 ]; then
  echo "✅ Application is healthy"
  exit 0
else
  echo "❌ Application is unhealthy (Status: $STATUS)"
  exit 1
fi