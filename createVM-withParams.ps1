Param(
 [Parameter(Mandatory=$true)]
 [string]$VMName,
 [Parameter(Mandatory=$false)]
 [string[]]$ResourceGroupName="atulrg-south",
 [Parameter(Mandatory=$false)]
 [string[]]$Location="uksouth",
 [Parameter(Mandatory=$true)]
 [string]$Image,
 [Parameter(Mandatory=$true)]
 [string]$Pip,
 [Parameter(Mandatory=$false)]
 [string[]]$Size="Standard_B2s",
 [Parameter(Mandatory=$false)]
 [string[]]$Subnet="default",
 [Parameter(Mandatory=$false)]
 [string[]]$Port='22'
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

