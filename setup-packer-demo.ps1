$rg_name            = "RG-PACKER-DEMO"  # create a container for the image & VM resources to be managed together
$subscription_name  = "your-subscription-name" # update this value to your target subscription

# set the correct Azure Subscription & retrieve the subscription ID
az account set -s $subscription_name 
$subscription_id = az account show -o tsv --query id

# create an RG container for the demo
az group create -n $rg_name -l eastus2


# Create ubuntu.json file from template using subscription_id & rg_name from above.
$template = Get-Content ./ubuntu_template.json -Raw
$template = $template -Replace '\$rg_name',"$rg_name"
$template = $template -Replace '\$subscription_id',"$subscription_id"
$template | Out-File -Path ./ubuntu.json

# run packer build with the generated json file
# Azure CLI will prompt for a device login the first time you run this in cloud shell
packer build ubuntu.json

# create a VM from the image
az vm create `
    --resource-group $rg_name `
    --name myVM `
    --image myCustomImage `
    --admin-username azureuser `
    --generate-ssh-keys


# open access to NGINX 
az vm open-port `
    --resource-group $rg_name `
    --name myVM `
    --port 80