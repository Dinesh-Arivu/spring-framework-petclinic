#!/bin/bash

set -e  # Stop script on any error
set -u  # Exit on unset variable
set -o pipefail  # Catch errors in pipelines

echo "=== Updating system and installing Java (OpenJDK 17) ==="
sudo apt update -y
sudo apt install openjdk-17-jdk -y
java -version

echo "=== Install Terraform ==="
sudo apt install wget -y
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform -y

echo "=== Install AWS CLI ==="
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt-get install unzip -y
unzip awscliv2.zip
sudo ./aws/install

echo "=== Install Maven ==="
sudo apt install maven -y
mvn -version

echo "=== All installations completed successfully ==="
