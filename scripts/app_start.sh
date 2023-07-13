#!/bin/bash

cd /home/ec2-user/server/src

# Start the application in the background
npm start > /dev/null 2>&1 &

# Wait for the application to start (adjust the sleep duration if needed)
sleep 10

# Start the application with PM2
pm2 start npm --name "sanjeebapp" -- start

# Configure PM2 to start on system boot
pm2 startup

# Save the PM2 process list
pm2 save

# Restart all PM2 processes (including the application)
pm2 restart all
