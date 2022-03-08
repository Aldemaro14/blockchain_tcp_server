# tcp_server

Hello, thanks for your time, there are 2 ways to install this server, first one is automated, second one is manual.

---

# AUTOMATED WAY

1. please use the installation.sh script, just make sure you're able to run it:

```
chmod +rwx installation.sh
./installation.sh
```
2. Script will request for enviroment, which you can choose from "dev" to "prod".

3. Make sure you press "Y" when requested.

4. You should be ready to go. Dont worry if you see some errors, script fix them afterwards.

---

# MANUAL

1. please install python3+

```
sudo apt install python3
sudo apt install -y python3-pip
```
2. generate Python enviroment and download dependencies.
```
python3 -m venv venv
source /venv/bin/activate
pip3 install -r prod
```
3. Install Docker
```
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
```
4. Get reddis image from dockerhub
```
docker run -p 6379:6379 -d redis:5
```
5. Run server
```
python3 manage.py migrate
python3 manage.py runserver
```
