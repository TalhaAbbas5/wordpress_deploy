#!/bin/bash

set -e


echo "Starting deployment"


PROJECT_DIR="/var/www/html"


echo "Pulling latest code"


cd $PROJECT_DIR


sudo git pull origin main



echo "Restarting Apache"


sudo systemctl restart httpd


echo "Deployment completed successfully"
