#!/bin/bash
apt-get update
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 5173
sudo ufw allow 8080
sudo ufw enable