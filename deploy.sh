#!/bin/bash
set -e

username=$1
remote_host=$2
ssh_port=$3

sudo docker build -t webpack-demo_prod .
sudo docker create --name webpack-demo_prod_container webpack-demo_prod
sudo docker cp webpack-demo_prod_container:/usr/src/webpack-demo/src/dist/bundle.js ./dist
sudo docker rm webpack-demo_prod_container

echo "Copying bundle.js to "$username"@"$remote_host":"$ssh_port

scp -P $ssh_port ./dist/bundle.js $username@$remote_host:/home/$username/
ssh $username@$remote_host -p $ssh_port "sudo cp bundle.js /var/www/html/"
