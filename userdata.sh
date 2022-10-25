#!/bin/bash
sudo apt -y update
sudo apt install nginx -y
sudo rm -rf NginX-Testing
sudo git clone https://github.com/si-vas/NginX-Testing.git
sudo rm -rf /var/www/html/index.nginx-debian.html
sudo cp NginX-Testing/index.html /var/www/html/index.nginx-debian.html
sudo chmod 777 /var/www/html/index.nginx-debian.html
sudo cp NginX-Testing/style.css /var/www/html/style.css
sudo cp NginX-Testing/scorekeeper.js /var/www/html/scorekeeper.js
sudo echo "<center> <div id='container'> <h1> Welcome to public server </h1></div></center>" >> /var/www/html/index.nginx-debian.html
