# Creating Inventories for a Cluster
When creating a new cluster the following steps should be performed to setup an inventory. The inventory contains a manifest of the host machines that belong to the cluster along with some minimal configuration values required for the cluster to be configured and started.
## Creating an Inventory
- Navigate to the inventories/create folder
- RUN: ```./create_inventory.sh --env={your_environment_name} --dc={your_datacenter_name}```
eg:```./create_inventory.sh --env=development --dc=test-dc```
- This script will create a folder structure populated with an empty hosts.yml file and a group_vars folder populated with templated variable files at inventories/{your_environment_name}/{your_datacenter_name}

## Filling out hosts.yml and group vars templates
Once the folder structure and files are created they must be filled out with the specifics of your cluster. An example hosts.yml is populated below.
- Fill out hosts.yml with your host info
- Fill out stubbed files in the inventories/{your_environment_name}/{your_datacenter_name}/group_vars folder with cluster specific configuration. 


### Example Hosts File
```
all:
    children:
        cluster:
            children:
                consul:
                    children:
                        consul-leader:
                            hosts:
                               testserver1.somedomain:
                        consul-servers:
                            hosts:
                                testserver2.somedomain:
                                testserver3.somedomain:
                        consul-clients:
                            hosts:
                                testclient1.somedomain:
                                testclient2.somedomain:
                nomad:
                    children:
                        nomad-leader:
                            hosts:
                                testserver1.somedomain:
                        nomad-servers:
                            hosts:
                                testserver2.somedomain:
                                testserver3.somedomain:
                        nomad-clients:
                            hosts:
                                 testclient1.somedomain:
                                    nomad_client_meta:
                                        # example node meta
                                        species: "genpurpose"
                                 testclient2.somedomain:
                                    nomad_client_meta:
                                        # example node meta
                                        species: "genpurpose"
                vault:
                    children:
                        vault-active:
                            hosts:
                                testserver1.somedomain:
                        vault-standby:
                            hosts:
                                testserver2.somedomain:
                                testserver3.somedomain:
```
### group_vars folder structure
```
- inventories/{env}/{dc}/group_vars
    - all
    - cluster
    - consul
    - nomad
    - vault
```

## Committing to Github
Once you are satisfied with inventory configuration commit the changes to github. Committing inventories and their group configuration is an integral step in ensuring that developers can execute these playbooks across any workstation they have configured to run Ansible. 
Additionally the inventories provide a manifest of every cluster that is configured and exactly which machines belong to it and how they are configured. 