export SUDOUSER=azureuser
sudo runuser -l azureuser -c "ansible-playbook /home/$SUDOUSER/openshift-ansible/playbooks/adhoc/uninstall.yml"
sudo runuser -l $SUDOUSER -c "ansible-playbook /home/$SUDOUSER/openshift-ansible/playbooks/byo/config.yml"
oc login -u system:admin
echo "Sleep 120 s"
sleep 120
NUM_NODES=$(oc get nodes --no-headers|wc -l)
NODES=$(oc get nodes --no-headers|awk '{print $1}')
echo "Copy Master configs to Masters"
bash copy_master_configs_to_masters
echo "Copy Node configs to Nodes"
bash copy_node_configs_to_nodes
echo "Copy password file"
#btw, i set the password of azureuser to asdfgh
bash copy_pwd_file
echo "Create Storage class"
bash create_storage_class 
echo "Restart Node"
bash restart_node 
echo "Restart Master"
bash restart_master

# At this point, i find that doing them manually works. If done by this script, you run into  problems.
# Execute the commented commands using the commandline ONE AT A TIME.
echo "Delete Nodes"
#bash delete_nodes 
echo "See if all nodes appear now. Repeat the below command until you see all node appear"
#oc get nodes
echo "Make Master unschedulable"
#bash make_master_unschedulable 
echo "See if master is now unschedulable"
#oc get nodes
# A this point, test that you can login to docker registry
#oc login -u azureuser -p asdfgh
#sudo docker login -u azureuser -p $(oc whoami -t) docker-registry.default.svc:5000

#if the above command succeeds, then we are good
#Now, using the UI, you create a new project  called "test"
# 1. Create a new NodeJs app. Name = node. For the git url, click on "Try it." Click Create.
# 2. look at the logs. When the build will push the image to repo, it should succeed.
# 3. Click on the route that is created automatically, it should give you the web page.
# 4. Got to Applications->Deployments->test->Configuration->Add Storage. Give it a name "test-storage", Single User (RWO), Size 1 GiB
# 5. Go to your console
#   - oc login -u azureuser
#   - oc project test
#   - oc get pvc
# you should get something like:
#NAME           STATUS    VOLUME                                     CAPACITY   ACCESSMODES   STORAGECLASS   AGE
#test-storage   Bound     pvc-11428eda-ef64-11e7-8667-000d3a1a5eb3   1Gi        RWO           generic        3s
# If you reached this far, your install is successful!
