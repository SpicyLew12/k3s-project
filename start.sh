#!/bin/bash

# Ensure the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Please use sudo."
    exit 1
fi

# Install ansible if not installed on control node
if ! command -v ansible &> /dev/null
then
    apt update
    apt install -y software-properties-common
    add-apt-repository --yes --update ppa:ansible/ansible
    apt install ansible -y
fi

# Install k3s onto cluster
ansible-playbook -i inventory/hosts.ini k3s-setup.yml

# Install software into cluster
ansible-playbook -i inventory/hosts.ini development-setup.yml
