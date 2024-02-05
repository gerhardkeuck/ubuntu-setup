#!/bin/bash

# Check if Ansible is already installed and exit if it is
if ansible --version &> /dev/null; then
    echo "Ansible is already installed."
    exit 0
fi

# Update the system package index
sudo apt-get update

# Install the software-properties-common package
sudo apt-get install -y software-properties-common

# Add the Ansible PPA
sudo add-apt-repository --yes --update ppa:ansible/ansible

# Update the package index again after adding the PPA
sudo apt-get update

# Install Ansible
sudo apt-get install -y ansible

# Display the Ansible version to confirm the installation
ansible --version
