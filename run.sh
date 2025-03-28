#!/bin/bash

# Create log directory if it doesn't exist
mkdir -p /var/log/hq_auto_logs

# Ensure the log file exists
touch /var/log/hq_auto_logs/hq_auto.log

# Set correct permissions
chmod 666 /var/log/hq_auto_logs/hq_auto.log

# Start FastAPI with Uvicorn
exec uvicorn main:app --host 0.0.0.0 --port 8000
