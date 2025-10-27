#!/bin/bash

# Title: Install Ansible on Ubuntu 24.04
# Description: Installs Ansible, Python3, and required packages
# Usage: sudo bash install_ansible.sh

set -e

echo "🔹 Step 1: Update system packages..."
sudo apt-get update && sudo apt-get upgrade -y

echo "🔹 Step 2: Install required packages..."
sudo apt install -y software-properties-common

echo "🔹 Step 3: Add Ansible PPA..."
sudo add-apt-repository --yes --update ppa:ansible/ansible

echo "🔹 Step 4: Install Python3..."
sudo apt install -y python3 python3-venv python3-pip

echo "🔹 Step 5: Install Ansible..."
sudo apt install -y ansible

# Optional: install ansible-core
echo "🔹 Installing ansible-core (optional)..."
sudo apt install -y ansible-core

echo "🔹 Step 6: Verify Ansible installation..."
ansible --version

echo "✅ Ansible installation completed successfully!"
