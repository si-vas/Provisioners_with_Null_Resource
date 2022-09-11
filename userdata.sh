#!/bin/bash
sudo apt -y update
sudo apt install nginx -y
sudo git clone https://github.com/mavrick202/webhooktesting.git
sudo rm -rf /var/www/html/index.nginx-debian.html
sudo cp webhooktesting/index.html /var/www/html/index.nginx-debian.html
sudo cp webhooktesting/style.css /var/www/html/style.css
sudo cp webhooktesting/scorekeeper.js /var/www/html/scorekeeper.js
