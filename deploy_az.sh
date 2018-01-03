az group create -n INGASIAOOCP -l 'southeastasia'
az keyvault create -n INGASIAOOCP-KV -g INGASIAOOCP -l 'southeastasia' --enabled-for-template-deployment true
az keyvault secret set --vault-name INGASIAOOCP-KV -n SecretName --file ~/.ssh/id_rsa
#az ad sp create-for-rbac -n openshiftcloudprovider --password Pass@word1 --role contributor --scopes /subscriptions/86cc6e41-9cbb-45c8-94b8-03d7d5aa2ae5/resourceGroups/ResourceGroupName
# delete the existing sp
sp_id=$(az ad sp list --display-name openshiftcloudprovider|grep objectId|awk -F\" '{ print $4 }')
if [ "$sp_id" != "" ]
then
  az ad sp delete --id $sp_id
fi
az ad sp create-for-rbac -n openshiftcloudprovider --password Pass@word1 --role contributor --scopes

/subscriptions/ff6294e2-6c87-4b62-b3a3-aba5e0a17c8d/resourceGroups/INGAsiaOriginOCP

az ad sp create-for-rbac -n openshiftcloudprovider --password Pass@word1 --role contributor --skip-assignment
#b5274777-45fb-47df-8fbc-c514bb8d8c42
#az group deployment create --resource-group INGASIAOOCP --template-file azuredeploy.json --parameters @azuredeploy.parameters.local.json --no-wait

scp -v -i ~/.ssh/id_rsa -P 2200 scripts/deployOpenShift.sh edm@52.187.130.254
ssh -v -i ~/.ssh/id_rsa edm@52.187.130.254 -p 2200

Phase 1: Provision the Virtual Machines on Microsoft Azure
Phase 2: Install OpenShift Container Platform on Microsoft Azure
Phase 3: Post deployment activities
