#! /bin/sh

# Variables
spnName="terraform-actions"
resourceGroupName="terraform"
storageAccountName="terraformstateadrianpa"
containerName="terraform"

# Create SPN
az ad sp create-for-rbac --display-name=$spnName --role="Contributor" --scopes="/subscriptions/7bbf6a19-62e5-4383-bf13-ccc773342b84"

# Create RG, SA, Container for TF State File
az group create -l eastus -n $resourceGroupName
az storage account create -n $storageAccountName -g $resourceGroupName -l eastus --sku Standard_LRS
az storage container create --name $containerName --account-name $storageAccountName \

# After Provisioning, Run the following command to retrieve the access credentials for your cluster and automatically configure kubectl.
az aks get-credentials --resource-group $(terraform output -raw resource_group_name) --name $(terraform output -raw kubernetes_cluster_name)
    # CLI Return: Merged "light-eagle-aks" as current context in /Users/dos/.kube/config