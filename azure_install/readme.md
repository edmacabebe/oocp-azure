"commandToExecute": "[
concat('bash ', variables('openshiftDeploymentScriptFileName'), ' \"', parameters('adminUsername'), '\" ', variables('singlequote'), parameters('openshiftPassword'), variables('singlequote'), ' \"', parameters('sshPrivateKey'), '\" \"', parameters('openshiftMasterHostname'), '\" \"', parameters('openshiftMasterPublicIpFqdn'), '\" \"', parameters('openshiftMasterPublicIpAddress'), '\" \"', parameters('openshiftInfraHostname'), '\" \"', parameters('openshiftNodeHostname'), '\" \"', parameters('nodeInstanceCount'), '\" \"', parameters('infraInstanceCount'), '\" \"', parameters('MasterInstanceCount'), '\" \"', parameters(parameters('subDomainChosen')), '\" \"', parameters('newStorageAccountRegistry'), '\" ', variables('singlequote'), parameters('newStorageAccountKey'), variables('singlequote'), ' ', variables('singlequote'), variables('tenantId'), variables('singlequote'), ' ', variables('singlequote'), variables('subscriptionId'), variables('singlequote'), ' ', variables('singlequote'), parameters('aadClientId'), variables('singlequote'), ' ', variables('singlequote'), parameters('aadClientSecret'), variables('singlequote'), ' ', variables('singlequote'), variables('resourceGroupName'), variables('singlequote'), ' ', variables('singlequote'), variables('location'), variables('singlequote'), ' ', variables('singlequote'), parameters('newStorageAccountPersistentVolume1'), variables('singlequote'), ' ', variables('singlequote'), parameters('newStorageAccountPV1Key'), variables('singlequote'))]"

az group deployment create -g MyResourceGroup --template-uri https://myresource/azuredeploy.json --parameters @myparameters.json
run deployOpenShift.sh.2

oc login -u system:admin
oc get nodes

then you run uninstall:

sudo runuser -l azureuser -c "ansible-playbook openshift-ansible/playbooks/adhoc/uninstall.yml”

then

rm -fr openshift-ansible

then

sudo bash deployOpenshift.sh.2

In reference to this email, after running deployOpenShift.sh.2, it still does not guarantee it will work. It’s so non-deterministic. This one i find to be deterministic and works.

After  running the deployOpenShift.sh.2, do the following:
1. run the file install.sh in the attached archived.
  bash install.sh
2. Read the comments inside that file, especially after “bash restart master"

IMPORTANT: I’m only using 1 master, 1 infra and 1 node. Please do this first before you do 3 masters, 2 infra and 1 node.


On 27 Dec 2017, at 10:30 PM, Bobby Corpus <bobby.corpus@icloud.com> wrote:

My experience, run the first time, it will give you “not ready” when you do


oc login -u system:admin
oc get nodes

then you run uninstall:

sudo runuser -l azureuser -c "ansible-playbook openshift-ansible/playbooks/adhoc/uninstall.yml”

then

rm -fr openshift-ansible

then

sudo bash deployOpenshift.sh.2


<deployOpenShift.sh.2>
