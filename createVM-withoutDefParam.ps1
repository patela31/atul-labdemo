Param(
 [Parameter(Mandatory=$true)]
 [string]$VMName,
 [Parameter(Mandatory=$true)]
 [string]$ResourceGroupName,
 [Parameter(Mandatory=$true)]
 [string]$Location,
 [Parameter(Mandatory=$true)]
 [string]$Image,
 [Parameter(Mandatory=$true)]
 [string]$Pip,
 [Parameter(Mandatory=$true)]
 [string]$Size,
 [Parameter(Mandatory=$true)]
 [string]$Subnet,
 [Parameter(Mandatory=$true)]
 [string]$Port
)


$Password = ConvertTo-SecureString "Santos10Santos10" -AsPlainText -Force
$WindowsCred = New-Object System.Management.Automation.PSCredential('azureuser', $password)


$vmParams = @{
    Location = $Location
    ResourceGroupName = $ResourceGroupName
    Name = $VMName
    Image = $Image
    PublicIpAddressName = $Pip
    Credential = $WindowsCred
    Size = $Size
    VirtualNetworkName = "atulrg-south-vnet"
    SubnetName = $Subnet
    OpenPorts = $Port
}


New-AzVM @vmParams


# centos
# rhel
# debian
# 

PS /home/atul> az vm image list --output table
You are viewing an offline list of images, use --all to retrieve an up-to-date list
Offer          Publisher               Sku                 Urn                                                             UrnAlias             Version
-------------  ----------------------  ------------------  --------------------------------------------------------------  -------------------  ---------
CentOS         OpenLogic               7.5                 OpenLogic:CentOS:7.5:latest                                     CentOS               latest
CoreOS         CoreOS                  Stable              CoreOS:CoreOS:Stable:latest                                     CoreOS               latest
debian-10      Debian                  10                  Debian:debian-10:10:latest                                      Debian               latest
openSUSE-Leap  SUSE                    42.3                SUSE:openSUSE-Leap:42.3:latest                                  openSUSE-Leap        latest
RHEL           RedHat                  7-LVM               RedHat:RHEL:7-LVM:latest                                        RHEL                 latest
SLES           SUSE                    15                  SUSE:SLES:15:latest                                             SLES                 latest
UbuntuServer   Canonical               18.04-LTS           Canonical:UbuntuServer:18.04-LTS:latest                         UbuntuLTS            latest
WindowsServer  MicrosoftWindowsServer  2019-Datacenter     MicrosoftWindowsServer:WindowsServer:2019-Datacenter:latest     Win2019Datacenter    latest
WindowsServer  MicrosoftWindowsServer  2016-Datacenter     MicrosoftWindowsServer:WindowsServer:2016-Datacenter:latest     Win2016Datacenter    latest
WindowsServer  MicrosoftWindowsServer  2012-R2-Datacenter  MicrosoftWindowsServer:WindowsServer:2012-R2-Datacenter:latest  Win2012R2Datacenter  latest
WindowsServer  MicrosoftWindowsServer  2012-Datacenter     MicrosoftWindowsServer:WindowsServer:2012-Datacenter:latest     Win2012Datacenter    latest
WindowsServer  MicrosoftWindowsServer  2008-R2-SP1         MicrosoftWindowsServer:WindowsServer:2008-R2-SP1:latest         Win2008R2SP1         latest
PS /home/atul>
