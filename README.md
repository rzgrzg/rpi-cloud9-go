# rpi-cloud9-go
rpi-cloud9-ide with golang support

usage:  
sudo apt-get install git  (if git not installed)  
docker build -t rzgrzg/rpi-cloud9-go https://github.com/rzgrzg/rpi-cloud9-go.git  
docker run --restart=always --name cloud9 -it -d -p 8181:8181 -v ~/projects:/workspace rzgrzg/rpi-cloud9-go node server.js -w/workspace --listen 0.0.0.0 -a user:password
