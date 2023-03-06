#!/bin/bash
#SetFilePermission.sh
# Set permissions to storage and bootstrap cache
cd /var/www/html/docturnalhealth

# Assign www-data User and Group to the folder
sudo chown -R www-data:www-data /var/www/html/docturnalhealth

# Set folder permission
sudo find /var/www/html/docturnalhealth -type d -exec chmod 755 {} \;

# Set storage permission to 775
sudo find /var/www/html/docturnalhealth/storage -type d -exec chmod 775 {} \;

# Set file permission
sudo find /var/www/html/docturnalhealth -type f -exec chmod 644 {} \;

# Clear caches
php artisan cache:clear

# Clear expired password reset tokens
php artisan auth:clear-resets

# Clear and cache config
php artisan config:cache

# Clear and cache routes
php artisan route:cache

# Clear and cache views
php artisan view:cache

# Install/update composer dependecies
composer install --no-interaction

# Assign www-data User and Group to the folder
sudo chown -R www-data:www-data /var/www/html/docturnalhealth

# Set folder permission
sudo find /var/www/html/docturnalhealth -type d -exec chmod 755 {} \;

# Set storage permission to 775
sudo find /var/www/html/docturnalhealth/storage -type d -exec chmod 775 {} \;

# Set bootstrap/cache permission to 775
sudo find /var/www/html/docturnalhealth/bootstrap/cache -type d -exec chmod 775 {} \;

# Set file permission
sudo find /var/www/html/docturnalhealth -type f -exec chmod 644 {} \;

# Show Migration Status
php artisan migrate:status

# Run pending migrations
php artisan migrate --force
