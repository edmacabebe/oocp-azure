SUB=$1
sp_id=$(az ad sp list --display-name openshiftcloudprovider|grep objectId|awk -F\" '{ print $4 }')
if [ "$sp_id" != "" ]
then
  az ad sp delete --id $sp_id
fi
az ad sp create-for-rbac -n openshiftcloudprovider --password Pass@word1 --role contributor --scopes $SUB
