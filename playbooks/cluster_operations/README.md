# Cluster Operations

## Initialize
A new cluster can be created using the cluster_operations/init.yml playbook.

### Secret Creation
**Before Initializing a new cluster follow the [Secret Guide](/secrets/create/README.md) to create an secret directory where all of the secrets required for operating a cluster will be stored.**

### Inventory Creation
**Before Initializing a new cluster follow the [Inventory Guide](/inventories/create/README.md) to create an inventory directory containing a hosts.yml and group_vars folder holding group variables required for operating a cluster.**

### Execution
- Navigate to the root of this projects directory on the machine that will be executing the playbooks against the cluster hosts.
- Checkout the latest release tag for this repository ```git checkout <tag_name>```
- RUN:```ansible-playbook playbooks/cluster_operations/init.yml -i inventories/{env}/{datacenter}/hosts.yml --ask-sudo-p```

**After running this command you will be prompted for the wag_ansible_automation users password which is required to start the script.**

**Execution times vary depending on the number of server and worker nodes specified in the inventory file.**

## Update
Updates can be rolled out to an existing cluster using the cluster_operations/update.yml playbook. This playbook performs a rolling update across all server and worker nodes in the cluster. Server node updates are performed first across all server nodes in the cluster followed by updates to all worker nodes in the cluster. This update is performed in place with a single target node being safely removed from the cluster, updated, and rejoined into the cluster before proceeding to the next target node.

### Execution
- Navigate to the root of this projects directory on the machine that will be executing the playbooks against the cluster hosts.
- Checkout the latest release tag for this repository ```git checkout <tag_name>```
- RUN:```ansible-playbook playbooks/cluster_operations/update.yml -i inventories/{env}/{datacenter}/hosts.yml --ask-sudo-p```

**After running this command you will be prompted for the wag_ansible_automation users password which is required to start the script.**

**Execution times vary depending on the number of server and worker nodes specified in the inventory file. Updates are performed sequentially**

## Nuke
The Nuke completely wipes any cluster data and configuration from every node contained in the inventory file.

### Execution
- Navigate to the root of this projects directory on the machine that will be executing the playbooks against the cluster hosts.
- Checkout the latest release tag for this repository ```git checkout <tag_name>```
- RUN:```ansible-playbook playbooks/cluster_operations/nuke.yml -i inventories/{env}/{datacenter}/hosts.yml --ask-sudo-p```

**After running this command you will be prompted for the wag_ansible_automation users password which is required to start the script.**

**This operation completely destroys all cluster state and configuration requiring the user to re init a new cluster targeting the environment and datacenter. All data for Consul Nomad and Vault is wiped including data for and about deployed jobs. __YOU HAVE BEEN WARNED__**





