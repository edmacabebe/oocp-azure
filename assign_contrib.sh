SUB=$1
sp_id=$(az ad sp list --display-name openshiftcloudprovider|grep objectId|awk -F\" '{ print $4 }')
if [ "$sp_id" != "" ]
then
  az ad sp delete --id $sp_id
fi
az ad sp create-for-rbac -n openshiftcloudprovider --password Pass@word1 --role contributor --scopes $SUB

#az group deployment create --resource-group INGASIAOOCP --template-file azuredeploy.json --parameters @azuredeploy.parameters.local.json --no-wait
#52.187.57.83
#52.187.57.83
#52.187.58.170.nip.io

#scp -v -i ~/.ssh/id_rsa -P 2200 scripts/deployOpenShift.sh edm@52.187.130.254
#ssh -v -i ~/.ssh/id_rsa oocpadmin@52.187.57.83 -p 2200
