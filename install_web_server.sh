#!/bin/sh

yes | sudo yum -y update

# Install EPEL repository
yes | sudo yum install epel-release
# Install python and c compiler
yes | sudo yum install -y python-pip python-devel nginx gcc

# Install virtual env for python
yes | sudo pip install virtualenv

mkdir ~/helloapp/
cd ~/helloapp

# Create a virtual environment for the hello app
virtualenv helloappenv

source helloappenv/bin/activate
pip install uwsgi
uwsgi --version

# Create a simple wsgi application
cp ~/wsgi.py ~/helloapp/wsgi.py
cp ~/helloapp.ini ~/helloapp/helloapp.ini

sudo cp ~/uwsgi.service /etc/systemd/system/uwsgi.service
sudo systemctl start uwsgi
sudo systemctl enable uwsgi

# Edit nginx config
sudo cp ~/helloapp.nginx.conf /etc/nginx/nginx.conf

# Start the service
sudo systemctl start nginx
sudo systemctl enable nginx
