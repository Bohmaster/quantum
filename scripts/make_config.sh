#!/bin/bash

sudo cp /home/andres/projects/amentia/scripts/amentia.nginx /etc/nginx/sites-available/amentia
sudo ln -s /etc/nginx/sites-available/amentia /etc/nginx/sites-enabled/amentia
sudo service nginx restart

sudo cp /home/andres/projects/amentia/scripts/amentia.conf /etc/supervisor/conf.d/amentia.conf
sudo supervisorctl reread
sudo service supervisor stop
sudo service supervisor start

#sudo -u postgres psql postgres