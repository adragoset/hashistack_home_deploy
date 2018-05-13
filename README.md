# wag_infrastructure_ansible_playbooks
A repository to hold Ansible playbooks for cluster infrastructure operation and configuration

## Operating Cluster Playbooks

### Setup an Ansible control node on a development workstation
Follow the Ansible configuration guide at [Ansible Setup](/ANSIBLE_SETUP.md) to configure your workstation
### Use the Development Teams shared Ansible control node
The development team has a preconfigured Ansible control machine that can be used for running plays against a cluster.
This machine already has this repository checked out under the wag_ansible_automation users home folder. Additionally the machine has /Secrets/Production and /Secrets/Staging mounted from a network share and symlinked into the repositories secrets folder. This allows a team member to avoid having to setup an ansible environment and mount cluster secrets for production and staging environments.

For information about the location of this machine contact the development team.

### Setting up new cluster Instance Inventories and Secrets 
When initing new cluster instances follow the [Inventory Guide](/inventories/create/README.md) and [Secret Guide](/secrets/create/README.md) before moving on to initing a cluster in [Cluster wide operations](/playbooks/cluster_operations/README.md) 



### Executing Plays against the cluster
The general operational instructions are written as if they will be executed from the development teams shared ansible server.
- Login to the control machine using the wag_ansible_automation credentials
- Navigate to the project folder for this repository ```cd wag_infrastructure_ansible_playbooks```
- Checkout the version of this repository you wish to execute against ```git checkout <branch/or tag name>```

#### Play by Play Instructions
- [Cluster wide operations](/playbooks/cluster_operations/README.md)
- [Server node operations](/playbooks/server_operations/README.md)
- [Worker node operations](/playbooks/worker_operations/README.md)
- [Consul operations](/playbooks/consul_operations/README.md)
- [Vault operations](/playbooks/vault_operations/README.md)
- [Infrastructure Job Deployments](/playbooks/deployment_jobs/README.md)

## Trouble Shooting FAQ
TBD





