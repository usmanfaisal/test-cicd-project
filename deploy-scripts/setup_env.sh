#!/bin/bash

# Please update below variables as per your development setup
PARAMATER=""
# Get parameter store values for Development environment
if [ "$DEPLOYMENT_GROUP_NAME" == "docturnalhealth-deploy-grp-dev" ]; then

PARAMATER="docturnalhealth-dev"

fi

# Get parameter store values for Production environment
if [ "$DEPLOYMENT_GROUP_NAME" == "docturnalhealth-deploy-grp-prod" ]; then

PARAMATER="docturnalhealth-prod"

fi



REGION="us-east-2"
WEB_DIR="/var/www/html/docturnalhealth"
WEB_USER="www-data"

# Get parameters and put it into .env file inside application root
aws ssm get-parameter --with-decryption --name $PARAMATER --region $REGION --query Parameter.Value  | sed -e 's/^"//' -e 's/"$//' -e 's/\\n/\n/g' -e 's/\\//g' > $WEB_DIR/.env

# Clear laravel configuration cache
cd $WEB_DIR
chown $WEB_USER. .env
