# rpi-cloud9-go
rpi-cloud9-ide with golang support

usage:  

docker run --restart=always --name cloud9 -it -d -p 8181:8181 -v ~/projects:/workspace rzgrzg/cloud9 node server.js -w/workspace --listen 0.0.0.0 -a user:password
