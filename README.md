# rpi-cloud9-go
rpi-cloud9-ide with golang support

usage:  
docker build -t rzgrzg/aliddns https://github.com/rzgrzg/rpi-aliddns.git  
docker run --restart=always --name cloud9 -it -d -p 8181:8181 -v ~/projects:/workspace rzgrzg/cloud9 node server.js -w/workspace --listen 0.0.0.0 -a user:password
