#!/bin/bash

LOG_DIR="./logs"
DATE=$(date +%F)

echo "🧹 Rotating logs..."

mkdir -p $LOG_DIR

if [ -f "$LOG_DIR/app.log" ]; then
  mv "$LOG_DIR/app.log" "$LOG_DIR/app-$DATE.log"
  gzip "$LOG_DIR/app-$DATE.log"
  echo "✅ Logs rotated"
else
  echo "ℹ️ No log file found"
fi