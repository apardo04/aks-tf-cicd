#! /bin/sh

# Variables
spnName="terraform"
resourceGroupName="terraform"
storageAccountName="terraformstateadrianpa"
containerName="terraform"

# Create SPN
az ad sp create-for-rbac --display-name=$spnName --role="Contributor" --scopes="/subscriptions/7bbf6a19-62e5-4383-bf13-ccc773342b84"

# Create RG, SA, Container
az group create -l eastus -n $resourceGroupName
az storage account create -n $storageAccountName -g $resourceGroupName -l eastus --sku Standard_LRS
az storage container create --name $containerName --account-name $storageAccountName \


