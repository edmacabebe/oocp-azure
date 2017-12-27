az group create -n INGASIAOOCP -l 'southeastasia'
az keyvault create -n INGASIAOOCP-KV -g INGASIAOOCP -l 'southeastasia' --enabled-for-template-deployment true
az keyvault secret set --vault-name INGASIAOOCP-KV -n INGASIAOOCP-Secret --file ~/.ssh/id_rsa
