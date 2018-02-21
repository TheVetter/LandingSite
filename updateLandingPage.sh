#!/bin/bash
#
# Short bash script by Thor Hanson and Andrew Vetter
# The multiple sleep commands are to give the user a
# chance to cancel (ctrl+c) if they realize they've messed up.
# The script must be run with sudo.

echo "Removing old site home landing page files..."
sleep 2
rm -r /var/www/html/images
rm /var/www/html/*.css
rm /var/www/html/*.html

echo "Copying new home page files to directory..."
sleep 2
cp index.html /var/www/html/
cp *.css /var/www/html/
cp -r images /var/www/html/

echo "Fixing permissions..."
sleep 2
chown www-data:www-data -R /var/www/html/
chmod 755 -R /var/www/html/


echo "Will restart apache server..."
sleep 3
wall "Thorandrew.com  has been updated"
wall "Apache service will be restarting in 10 seconds"
sleep 10
systemctl restart apache2
