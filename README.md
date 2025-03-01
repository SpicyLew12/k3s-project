# K3s Project

## Overview
This project sets up a lightweight Kubernetes cluster using K3s, and deploys some test applications into the cluster

## Assumptions
This project assumes the infrastructure has been provisioned before-hand and we will now be configuring it into a k3s cluster. With this assumption we assume we have multiple nodes that have connectivity to eachother and we are able to connect to over ssh. This specific project was built with 3 ubuntu server vms on virtualbox on windows. One node being the ansible Control node and the other 2 being the eventual k3s cluster provisioned by the control node.
## Installation

1. **Clone the repository:**
    ```bash
    # On the control node clone the repo
    git clone https://github.com/SpicyLew12/k3s-project.git
    cd k3s-project
    ```
2. **Configure Inventory:**
    Update the `inventory/hosts.ini` file with your node information. Example:  
    ```
    [k3s_workers]
    k3s-worker ansible_host=192.168.1.2 ansible_ssh_user=k3s-admin ansible_ssh_pass=k3s-admin ansible_become=yes ansible_become_user=root ansible_become_pass=k3s-admin
    ```

3. **Run the setup script:**
    ```bash
    sudo ./start.sh
    ```

## Testing

1. The applications deployed can be tested by running the ansible test.yml playbook 
```bash
ansible-playbook test.yml
```

## Clean Up

1. The cluster can be torn down by running the k3s-delete.yml playbook 
```bash
ansible-playbook -i inventory/hosts.ini k3s-delete.yml
```
