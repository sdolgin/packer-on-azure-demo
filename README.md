# packer-on-azure-demo
Demo scripts to setup &amp; run a demo using HashiCorp Packer on Azure via Cloud Shell

These files can be pulled into Azure Cloud Shell by opening a broswer to https://shell.azure.com
Choose PowerShell for the preferred shell and simply run the following:

```
git clone https://github.com/sdolgin/packer-on-azure-demo.git
cd packer-on-azure-demo
code .
```

Define the PS variables at the top of setup-packer-demo.ps1 and save the file (Ctrl+S) 

```
./setup-packer-demo.ps1
```

Once complete, you will have a freshly published custom VM image with nginx installed & a powered-on VM instance with nginx running. You can test that nginx is responding by pasting the public IP address of the VM into a new browser tab. 
