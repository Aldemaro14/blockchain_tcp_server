#!/bin/bash

activate(){
    source ./venv/bin/activate
}

sudo apt install python3
sudo apt install python3-pip

python3 -m venv venv
activate
echo "************************************************"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "Please pick an enviroment: " 
echo "only two options: dev, prod " $venv
read venv
pip3 install -r $venv

sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

docker run -p 6379:6379 -d redis:5

python3 manage.py migrate
echo "************************************************"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "WELCOME TO TCP_SERVER!!!"

python3 manage.py runserver
