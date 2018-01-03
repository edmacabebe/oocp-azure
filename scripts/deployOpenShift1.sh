#!/bin/bash

echo $(date) " - Starting Script"

set -e

SUDOUSER=oocpadmin
PASSWORD=asdfgh
PRIVATEKEY="-----BEGIN RSA PRIVATE KEY-----
MIIEpQIBAAKCAQEAwayAadGLrCxTEAJ9muFxR137WFItG+EQYOlbJmhB15T7HMVq
HtHZPzZO7Q6kHEaWkYiq0e8keGXBQPru207ip/++QWOSr0rOwVDk1XvCXWpTyI6i
eed7C9Kg3qw269igpfPZ1kqL8Wwabqrtg1KwPofA+fawygzasJ7Ig57MvR0snaYA
ohgkN98uTPuwPGFEz22BPgoWj0I198TCZKlTu1jszjKRFBN4RVgjz0pKvInmIlDc
uk2JdDuridQN5jWuK1vcP7BBuRfLvtex7A25P0ZxREkhuoCi6iIfMf5ub1adjafL
DfcAJdPUBzlSrZWSKICDPR5u1+/HEdOXyozK3wIDAQABAoIBAQCZTNTcbdwz7WXW
H1KS3O4QgoioMWu5TJ3tR+k5bn7niOp3rJ/CQ3LFwVQZ+mPWad1W1yn3QGbK0ih1
KesVNszcE+fh1FJQZFNh24k2nl6MGNS2xIhBHAReqFtjxkc2yeLnWSzNnXZGI76M
aMnWEAaniEcs1KK9XA1ijlzDKlh/O4xlQigb9jQ+ckeDN8+DhzDxHjO4GmPGjIJx
o7woWSpRHZmElcKTmB/gv9VdIV5R1Z0uFEeRNTJmvV0X3gNOCQG2Sm2QiTAi+XgI
v2nhQeakNCot+cN5o29IgXj3rVvEiNpV5yoaI8VUcZ9s+I/Wp9C2BztMXyJGLkj9
XcGKn/WBAoGBAPuv8u7RPdUIuPirgCKb2nIke+bJfxa7VmXIHenb0eK9RGbIqE4B
rPbNDg0cmVOOjqFhieUVEXYEd7PyK3N6+3uF6Vk6DdJP2l8tdfMbH7u+vMzMKf/s
rOdupBRzGK2RJ4CDntOOd2GJb2t2slEhbULntvTfTXOZqJvO1QxWHMXBAoGBAMT+
EiY2GzeyEhSABaswy8+hmKWclGBV9xv9swvHTnL4U5G2K4o7YbJgMYqt3H1Pbk1M
A6dwvi17xz6qDje6zTxROhimSarIVU8lDD1QqCbHBPl+G6QMxc5sSLj5FrNrtIZ1
6QwtypV8MmiFq6npaOf4ckKm0lrmjT/NeZQD2/ifAoGBAIwY5KEK1+A9erjwveKF
3pKqvE063ANLRExjmEMUmUAdGnYcO5MwW5cFjUy/HpnkQICUSq25jH6k/fysUIN3
cYTQhZOlPQxUZrmUFJO+BWv8QBu/iaFrnNM2Qx8e8h2rLtHacg5QvyML3Xl0GM4Q
TUFwueaUZghy/+e6udykEmABAoGABxjEHJ5MYrhGkHiAO8eZQBSpRCYc7k+KhHai
UaVPfTLXB+PRM7yp61wtzLowvE71QVGgvBKCt27DIc3Mj1Nqe2bNuf+bncxzzlMe
WsMiG6uF0VsqscFICwS5pfhLShFyQnnS+H5Z0wLTahKOuaNQBTNdImuSHnY51neX
jq6I6S8CgYEA5mxYBJQ0X2BnXrLlM2bknarQNJwRXcllDOsgMbiiRhmOZIbkvd/q
3CPubLuxj1gcUH0Xz/vTxcALMTQ/cw19EHnreTc/ANiybeJeXAlTuz30cY4C+DVX
LJvjnDPBDfUaIGyJEaOOGUJPmiYadp2QgFMr+BAEi1PpKgVLIrJZKc0=
-----END RSA PRIVATE KEY-----"

MASTER=banking-master
MASTERPUBLICIPHOSTNAME=masterdnsz3dyhluinmwbs.southeastasia.cloudapp.azure.com
MASTERPUBLICIPADDRESS=52.187.167.176
INFRA=banking-infra
NODE=banking-node
NODECOUNT=1
INFRACOUNT=1
MASTERCOUNT=1
ROUTING=52.187.167.176.nip.io
REGISTRYSA=registryfolnc7szid3ao
ACCOUNTKEY="8kOY9161KGpFzIZCYYfYFuIUeTelRYdEoYfqItfc4rZY7Mspdnps7XX14xug35ge3DqPg0gHI6byOgCKa6keXQ=="
TENANTID=b253ae19-4e83-4d81-8b21-cd562d93edaa
SUBSCRIPTIONID=ff6294e2-6c87-4b62-b3a3-aba5e0a17c8d
AADCLIENTID=a7c6337d-0bcc-46a8-9466-1fc63e040bec
AADCLIENTSECRET="Pass@word1"
RESOURCEGROUP=INGASIAOOCP
LOCATION=southeastasia
STORAGEACCOUNT1=pv1sauf3q55sfmcuk2
SAKEY1="n9jNJtAdUdOgmCg3O8ou7GIDXocYcj1Jctw1s0QYqrqwJS13uAWFtelunwCgGMTURk4r61A43hzb4hNteGVt4g=="

MASTERLOOP=2
INFRALOOP=1
NODELOOP=0
####
echo "SUDOUSER=$1" >> /tmp/variables.log
echo "PASSWORD="$2"" >> /tmp/variables.log
echo "PRIVATEKEY=$3" >> /tmp/variables.log
echo "MASTER=$4" >> /tmp/variables.log
echo "MASTERPUBLICIPHOSTNAME=$5" >> /tmp/variables.log
echo "MASTERPUBLICIPADDRESS=$6" >> /tmp/variables.log
echo "INFRA=$7" >> /tmp/variables.log
echo "NODE=$8" >> /tmp/variables.log
echo "NODECOUNT=$9" >> /tmp/variables.log
echo "INFRACOUNT=${10}" >> /tmp/variables.log
echo "MASTERCOUNT=${11}" >> /tmp/variables.log
echo "ROUTING=${12}" >> /tmp/variables.log
echo "REGISTRYSA=${13}" >> /tmp/variables.log
echo "ACCOUNTKEY="${14}"" >> /tmp/variables.log
echo "TENANTID=${15}" >> /tmp/variables.log
echo "SUBSCRIPTIONID=${16}" >> /tmp/variables.log
echo "AADCLIENTID=${17}" >> /tmp/variables.log
echo "AADCLIENTSECRET="${18}"" >> /tmp/variables.log
echo "RESOURCEGROUP=${19}" >> /tmp/variables.log
echo "LOCATION=${20}" >> /tmp/variables.log
echo "STORAGEACCOUNT1=${21}" >> /tmp/variables.log
echo "SAKEY1=${22}" >> /tmp/variables.log
echo "" >> /tmp/variables.log
echo "MASTERLOOP=$((MASTERCOUNT - 1))" >> /tmp/variables.log
echo "INFRALOOP=$((INFRACOUNT - 1))" >> /tmp/variables.log
echo "NODELOOP=$((NODECOUNT - 1))" >> /tmp/variables.log
###
# Generate private keys for use by Ansible
echo $(date) " - Generating Private keys for use by Ansible for OpenShift Installation"

runuser -l $SUDOUSER -c "echo \"$PRIVATEKEY\" > ~/.ssh/id_rsa"
runuser -l $SUDOUSER -c "chmod 600 ~/.ssh/id_rsa*"

echo $(date) "- Configuring SSH ControlPath to use shorter path name"

sed -i -e "s/^# control_path = %(directory)s\/%%h-%%r/control_path = %(directory)s\/%%h-%%r/" /etc/ansible/ansible.cfg
sed -i -e "s/^#host_key_checking = False/host_key_checking = False/" /etc/ansible/ansible.cfg
sed -i -e "s/^#pty=False/pty=False/" /etc/ansible/ansible.cfg

# Create playbook to update ansible.cfg file

cat > updateansiblecfg.yaml <<EOF
#!/usr/bin/ansible-playbook

- hosts: localhost
  gather_facts: no
  tasks:
  - lineinfile:
      dest: /etc/ansible/ansible.cfg
      regexp: '^library '
      insertafter: '#library        = /usr/share/my_modules/'
      line: 'library = /home/${SUDOUSER}/openshift-ansible/library/'
EOF

# Run Ansible Playbook to update ansible.cfg file

echo $(date) " - Updating ansible.cfg file"

ansible-playbook ./updateansiblecfg.yaml

# Create Ansible Playbooks for Post Installation tasks
echo $(date) " - Create Ansible Playbooks for Post Installation tasks"

# Run on all masters - Create Inital OpenShift User on all Masters

cat > /home/${SUDOUSER}/addocpuser.yml <<EOF
---
- hosts: masters
  gather_facts: no
  remote_user: ${SUDOUSER}
  become: yes
  become_method: sudo
  vars:
    description: "Create OpenShift Users"
  tasks:
  - name: create directory
    file: path=/etc/origin/master state=directory
  - name: add initial OpenShift user
    shell: htpasswd -cb /etc/origin/master/htpasswd ${SUDOUSER} "${PASSWORD}"
EOF

# Run on MASTER-0 - Make initial OpenShift User a Cluster Admin

cat > /home/${SUDOUSER}/assignclusteradminrights.yml <<EOF
---
- hosts: master0
  gather_facts: no
  remote_user: ${SUDOUSER}
  become: yes
  become_method: sudo
  vars:
    description: "Make user cluster admin"
  tasks:
  - name: make OpenShift user cluster admin
    shell: oadm policy add-cluster-role-to-user cluster-admin $SUDOUSER --config=/etc/origin/master/admin.kubeconfig
EOF

# Run on MASTER-0 - configure registry to use Azure Storage

cat > /home/${SUDOUSER}/dockerregistry.yml <<EOF
---
- hosts: master0
  gather_facts: no
  remote_user: ${SUDOUSER}
  become: yes
  become_method: sudo
  vars:
    description: "Set registry to use Azure Storage"
  tasks:
  - name: Configure docker-registry to use Azure Storage
    shell: oc env dc docker-registry -e REGISTRY_STORAGE=azure -e REGISTRY_STORAGE_AZURE_ACCOUNTNAME=$REGISTRYSA -e REGISTRY_STORAGE_AZURE_ACCOUNTKEY=$ACCOUNTKEY -e REGISTRY_STORAGE_AZURE_CONTAINER=registry
EOF

# Run on MASTER-0 - configure Storage Class

cat > /home/${SUDOUSER}/configurestorageclass.yml <<EOF
---
- hosts: master0
  gather_facts: no
  remote_user: ${SUDOUSER}
  become: yes
  become_method: sudo
  vars:
    description: "Create Storage Class"
  tasks:
  - name: Create Storage Class with StorageAccountPV1
    shell: oc create -f /home/${SUDOUSER}/scgeneric1.yml
EOF

# Create vars.yml file for use by setup-azure-config.yml playbook

cat > /home/${SUDOUSER}/vars.yml <<EOF
g_tenantId: $TENANTID
g_subscriptionId: $SUBSCRIPTIONID
g_aadClientId: $AADCLIENTID
g_aadClientSecret: $AADCLIENTSECRET
g_resourceGroup: $RESOURCEGROUP
g_location: $LOCATION
EOF

# Create Azure Cloud Provider configuration Playbook for Master Config

cat > /home/${SUDOUSER}/setup-azure-master.yml <<EOF
#!/usr/bin/ansible-playbook
- hosts: masters
  gather_facts: no
  serial: 1
  vars_files:
  - vars.yml
  become: yes
  vars:
    azure_conf_dir: /etc/azure
    azure_conf: "{{ azure_conf_dir }}/azure.conf"
    master_conf: /etc/origin/master/master-config.yaml
  handlers:
  - name: restart origin-master-api
    systemd:
      state: restarted
      name: origin-master-api

  - name: restart origin-master-controllers
    systemd:
      state: restarted
      name: origin-master-controllers

  post_tasks:
  - name: make sure /etc/azure exists
    file:
      state: directory
      path: "{{ azure_conf_dir }}"

  - name: populate /etc/azure/azure.conf
    copy:
      dest: "{{ azure_conf }}"
      content: |
        {
          "aadClientID" : "{{ g_aadClientId }}",
          "aadClientSecret" : "{{ g_aadClientSecret }}",
          "subscriptionID" : "{{ g_subscriptionId }}",
          "tenantID" : "{{ g_tenantId }}",
          "resourceGroup": "{{ g_resourceGroup }}",
          "location": "{{ g_location }}",
        }
    notify:
    - restart origin-master-api
    - restart origin-master-controllers

  - name: insert the azure disk config into the master
    modify_yaml:
      dest: "{{ master_conf }}"
      yaml_key: "{{ item.key }}"
      yaml_value: "{{ item.value }}"
    with_items:
    - key: kubernetesMasterConfig.apiServerArguments.cloud-config
      value:
      - "{{ azure_conf }}"

    - key: kubernetesMasterConfig.apiServerArguments.cloud-provider
      value:
      - azure

    - key: kubernetesMasterConfig.controllerArguments.cloud-config
      value:
      - "{{ azure_conf }}"

    - key: kubernetesMasterConfig.controllerArguments.cloud-provider
      value:
      - azure
    notify:
    - restart origin-master-api
    - restart origin-master-controllers
EOF

# Create Azure Cloud Provider configuration Playbook for Node Config (Master Nodes)

cat > /home/${SUDOUSER}/setup-azure-node-master.yml <<EOF
#!/usr/bin/ansible-playbook
- hosts: masters
  serial: 1
  gather_facts: no
  vars_files:
  - vars.yml
  become: yes
  vars:
    azure_conf_dir: /etc/azure
    azure_conf: "{{ azure_conf_dir }}/azure.conf"
    node_conf: /etc/origin/node/node-config.yaml
  handlers:
  - name: restart origin-node
    systemd:
      state: restarted
      name: origin-node
  post_tasks:
  - name: make sure /etc/azure exists
    file:
      state: directory
      path: "{{ azure_conf_dir }}"

  - name: populate /etc/azure/azure.conf
    copy:
      dest: "{{ azure_conf }}"
      content: |
        {
          "aadClientID" : "{{ g_aadClientId }}",
          "aadClientSecret" : "{{ g_aadClientSecret }}",
          "subscriptionID" : "{{ g_subscriptionId }}",
          "tenantID" : "{{ g_tenantId }}",
          "resourceGroup": "{{ g_resourceGroup }}",
          "location": "{{ g_location }}",
        }
    notify:
    - restart origin-node
  - name: insert the azure disk config into the node
    modify_yaml:
      dest: "{{ node_conf }}"
      yaml_key: "{{ item.key }}"
      yaml_value: "{{ item.value }}"
    with_items:
    - key: kubeletArguments.cloud-config
      value:
      - "{{ azure_conf }}"

    - key: kubeletArguments.cloud-provider
      value:
      - azure
    notify:
    - restart origin-node
EOF

# Create Azure Cloud Provider configuration Playbook for Node Config (Non-Master Nodes)

cat > /home/${SUDOUSER}/setup-azure-node.yml <<EOF
#!/usr/bin/ansible-playbook
- hosts: nodes:!masters
  serial: 1
  gather_facts: no
  vars_files:
  - vars.yml
  become: yes
  vars:
    azure_conf_dir: /etc/azure
    azure_conf: "{{ azure_conf_dir }}/azure.conf"
    node_conf: /etc/origin/node/node-config.yaml
  handlers:
  - name: restart origin-node
    systemd:
      state: restarted
      name: origin-node
  tasks:
  - name: make sure /etc/azure exists
    file:
      state: directory
      path: "{{ azure_conf_dir }}"

  - name: populate /etc/azure/azure.conf
    copy:
      dest: "{{ azure_conf }}"
      content: |
        {
          "aadClientID" : "{{ g_aadClientId }}",
          "aadClientSecret" : "{{ g_aadClientSecret }}",
          "subscriptionID" : "{{ g_subscriptionId }}",
          "tenantID" : "{{ g_tenantId }}",
          "resourceGroup": "{{ g_resourceGroup }}",
          "location": "{{ g_location }}",
        }
    notify:
    - restart origin-node
  - name: insert the azure disk config into the node
    modify_yaml:
      dest: "{{ node_conf }}"
      yaml_key: "{{ item.key }}"
      yaml_value: "{{ item.value }}"
    with_items:
    - key: kubeletArguments.cloud-config
      value:
      - "{{ azure_conf }}"

    - key: kubeletArguments.cloud-provider
      value:
      - azure
    notify:
    - restart origin-node
  #- name: delete the node so it can recreate itself
  #  command: oc delete node {{inventory_hostname}}
  #  delegate_to: ${MASTER}-0
  #  notify:
  #  - restart origin-node
  #post_tasks:
  #- name: sleep to let node come back to life
  #  pause:
  #     seconds: 25
EOF

# Create Playbook to delete stuck Master nodes and set as not schedulable

cat > /home/${SUDOUSER}/deletestucknodes.yml <<EOF
- hosts: masters
  gather_facts: no
  become: yes
  vars:
    description: "Delete stuck nodes"
  handlers:
  - name: restart origin-node
    systemd:
      state: restarted
      name: origin-node
  tasks:
  - name: Delete stuck nodes so it can recreate itself
    command: oc delete node {{inventory_hostname}}
    delegate_to: ${MASTER}-0
    notify:
    - restart origin-node
  post_tasks:
  - name: sleep between deletes
    pause:
      seconds: 25

  - name: set masters as unschedulable
    command: oadm manage-node {{inventory_hostname}} --schedulable=false
EOF

# Create Ansible Hosts File
echo $(date) " - Create Ansible Hosts file"

cat > /etc/ansible/hosts <<EOF
# Create an OSEv3 group that contains the masters and nodes groups
[OSEv3:children]
masters
nodes
etcd
master0
new_nodes

# Set variables common for all OSEv3 hosts
[OSEv3:vars]
ansible_ssh_user=$SUDOUSER
ansible_become=yes
openshift_install_examples=true
openshift_deployment_type=origin
openshift_release=v3.6
# Need this repo for openvswitch RPMs
openshift_additional_repos=[{'id': 'ovirt-4.2', 'name': 'ovirt-4.2', 'baseurl': 'http://mirror.centos.org/centos/7/virt/x86_64/ovirt-4.2/', 'enabled': 1, 'gpgcheck': 0}]
docker_udev_workaround=True
openshift_use_dnsmasq=True
openshift_master_default_subdomain=$ROUTING
openshift_override_hostname_check=true
osm_use_cockpit=false
#os_sdn_network_plugin_name='redhat/openshift-ovs-multitenant'
#console_port=443
openshift_cloudprovider_kind=azure
osm_default_node_selector='type=app'
openshift_disable_check=disk_availability,memory_availability
# default selectors for router and registry services
openshift_router_selector='type=infra'
openshift_registry_selector='type=infra'
template_service_broker_selector={ 'type': 'infra' }

openshift_master_cluster_method=native
openshift_master_cluster_hostname=$MASTERPUBLICIPHOSTNAME
openshift_master_cluster_public_hostname=$MASTERPUBLICIPHOSTNAME
openshift_master_cluster_public_vip=$MASTERPUBLICIPADDRESS

# Enable HTPasswdPasswordIdentityProvider
openshift_master_identity_providers=[{'name': 'htpasswd_auth', 'login': 'true', 'challenge': 'true', 'kind': 'HTPasswdPasswordIdentityProvider', 'filename': '/etc/origin/master/htpasswd'}]

# host group for masters
[masters]
$MASTER-[0:${MASTERLOOP}]

# host group for etcd
[etcd]
$MASTER-[0:${MASTERLOOP}]

[master0]
$MASTER-0

# host group for nodes
[nodes]
EOF

# Loop to add Masters

for (( c=0; c<$MASTERCOUNT; c++ ))
do
  echo "$MASTER-$c openshift_node_labels=\"{'type': 'master', 'zone': 'default'}\" openshift_hostname=$MASTER-$c" >> /etc/ansible/hosts
done

# Loop to add Infra Nodes

for (( c=0; c<$INFRACOUNT; c++ ))
do
  echo "$INFRA-$c openshift_node_labels=\"{'type': 'infra', 'zone': 'default'}\" openshift_hostname=$INFRA-$c" >> /etc/ansible/hosts
done

# Loop to add Nodes

for (( c=0; c<$NODECOUNT; c++ ))
do
  echo "$NODE-$c openshift_node_labels=\"{'type': 'app', 'zone': 'default'}\" openshift_hostname=$NODE-$c" >> /etc/ansible/hosts
done

# Create new_nodes group

cat >> /etc/ansible/hosts <<EOF

# host group for adding new nodes
[new_nodes]
EOF

echo $(date) " - Cloning openshift-ansible repo for use in installation"
runuser -l $SUDOUSER -c "git clone -b release-3.6 https://github.com/openshift/openshift-ansible /home/$SUDOUSER/openshift-ansible"

echo $(date) " - Running network_manager.yml playbook"
DOMAIN=`domainname -d`

# Setup NetworkManager to manage eth0
runuser -l $SUDOUSER -c "ansible-playbook openshift-ansible/playbooks/byo/openshift-node/network_manager.yml"

echo $(date) " - Setting up NetworkManager on eth0"
# Configure resolv.conf on all hosts through NetworkManager

runuser -l $SUDOUSER -c "ansible all -b -m service -a \"name=NetworkManager state=restarted\""
sleep 5
runuser -l $SUDOUSER -c "ansible all -b -m command -a \"nmcli con modify eth0 ipv4.dns-search $DOMAIN\""
runuser -l $SUDOUSER -c "ansible all -b -m service -a \"name=NetworkManager state=restarted\""

# Initiating installation of OpenShift Container Platform using Ansible Playbook
echo $(date) " - Installing OpenShift Container Platform via Ansible Playbook"

runuser -l $SUDOUSER -c "ansible-playbook openshift-ansible/playbooks/byo/config.yml"

echo $(date) " - Modifying sudoers"

sed -i -e "s/Defaults    requiretty/# Defaults    requiretty/" /etc/sudoers
sed -i -e '/Defaults    env_keep += "LC_TIME LC_ALL LANGUAGE LINGUAS _XKB_CHARSET XAUTHORITY"/aDefaults    env_keep += "PATH"' /etc/sudoers

# Deploying Registry
echo $(date) "- Registry automatically deployed to infra nodes"

# Deploying Router
echo $(date) "- Router automaticaly deployed to infra nodes"

echo $(date) "- Re-enabling requiretty"

sed -i -e "s/# Defaults    requiretty/Defaults    requiretty/" /etc/sudoers

# Adding user to OpenShift authentication file
echo $(date) "- Adding OpenShift user"

runuser -l $SUDOUSER -c "ansible-playbook ~/addocpuser.yml"

# Assigning cluster admin rights to OpenShift user
echo $(date) "- Assigning cluster admin rights to user"

runuser -l $SUDOUSER -c "ansible-playbook ~/assignclusteradminrights.yml"

# Create Storage Class
echo $(date) "- Creating Storage Class"

runuser -l $SUDOUSER -c "ansible-playbook ~/configurestorageclass.yml"

# Configure Docker Registry to use Azure Storage Account
echo $(date) "- Configuring Docker Registry to use Azure Storage Account"

runuser -l $SUDOUSER -c "ansible-playbook ~/dockerregistry.yml"

echo $(date) "- Sleep for 120"

sleep 120

# Execute setup-azure-master and setup-azure-node playbooks to configure Azure Cloud Provider
echo $(date) "- Configuring OpenShift Cloud Provider to be Azure"

runuser -l $SUDOUSER -c "ansible-playbook ~/setup-azure-master.yml"
runuser -l $SUDOUSER -c "ansible-playbook ~/setup-azure-node-master.yml"
runuser -l $SUDOUSER -c "ansible-playbook ~/setup-azure-node.yml"
#runuser -l $SUDOUSER -c "ansible-playbook ~/deletestucknodes.yml"

# Delete postinstall files
echo $(date) "- Deleting post installation files"


#rm /home/${SUDOUSER}/addocpuser.yml
#rm /home/${SUDOUSER}/assignclusteradminrights.yml
#rm /home/${SUDOUSER}/dockerregistry.yml
#rm /home/${SUDOUSER}/vars.yml
#rm /home/${SUDOUSER}/setup-azure-master.yml
#rm /home/${SUDOUSER}/setup-azure-node-master.yml
#rm /home/${SUDOUSER}/setup-azure-node.yml
#rm /home/${SUDOUSER}/deletestucknodes.yml

echo $(date) " - Script complete"
