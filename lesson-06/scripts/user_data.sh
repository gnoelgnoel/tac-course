#!/bin/bash
cd /tmp
#installing ssm agent
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent
#installing nginx 
sudo yum install -y yum-utils
nginx_repo_content="[nginx-stable]
name=nginx stable repo
baseurl=http://nginx.org/packages/centos/\$releasever/\$basearch/
gpgcheck=1
enabled=1
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true"
echo "$nginx_repo_content" | sudo tee /etc/yum.repos.d/nginx.repo
sudo yum update -y
sudo yum install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
# deploying application
sudo rm /usr/share/nginx/html/index.html
html='<html lang="en"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Welcome to Bipolar Bits</title><style>body{font-family:Arial, sans-serif;margin:20px;text-align:center;}h1{color:#333;}p{color:#666;}img{width:300px;height:300px;animation:wobble 3s ease-in-out infinite;}</style><style>@keyframes wobble{0%,100%{transform:translateX(0) rotate(0);}25%{transform:translateX(5px) rotate(3deg);}50%{transform:translateX(-5px) rotate(-3deg);}75%{transform:translateX(3px) rotate(2deg);}</style></head><body><h1>Welcome to Bipolar Bits</h1><img src="https://images.audacy2-prod.ext.audacy.com/177f8d90-1918-4c44-a510-9b3bdc56835b.jpg" alt="Bipolar Bits Image" width="300" height="300"><p>Thank you for checking out this page!</p><p>I am really glad this page is up and running (fingers crossed)!</p></body></html>'
sudo touch index.html
echo $html | sudo tee -a index.html
ipaddr=$(ifconfig | grep 'inet 10')
echo $ipaddr | sudo tee -a index.html
sudo touch /usr/share/nginx/html/index.html
cat index.html | sudo tee /usr/share/nginx/html/index.html