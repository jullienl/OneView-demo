<#
 
This PowerShell script collects server information managed by HPE OneView
and generate a text file report providing the following information:

-------------------------------------------------------------------------------------------------------
Report generated on 11/25/2020 13:56:08

RH [Serial number: CN76010B73 - iLO: 192.168.1.203]: 
	Model: Synergy 480 Gen9
	Total Memory: 64GB
	Memory configuration:
		PROC 1 DIMM 12: HP RDIMM DDR4 16GB - Part Number=752369-081
		PROC 1 DIMM 9: HP RDIMM DDR4 16GB - Part Number=752369-081
		PROC 2 DIMM 1: HP RDIMM DDR4 16GB - Part Number=752369-081
		PROC 2 DIMM 4: HP RDIMM DDR4 16GB - Part Number=752369-081
	Adapters configuration:
		1-Synergy 3820C 10/20Gb CNA: Part Number=777430-B21 - Number of ports=6 - Position=NIC.Slot.3.1
	Array Controllers configuration:
		1-Smart Array P542D Controller: Part Number=Not available - Logical Drives=0 - Position=Slot 1

ESX-2.lj.lab [Serial number: CN76010B6R - iLO: 192.168.1.162]: 
	Model: Synergy 480 Gen9
	Total Memory: 64GB
	Memory configuration:
		PROC 1 DIMM 12: HP RDIMM DDR4 16GB - Part Number=752369-081
		PROC 1 DIMM 9: HP RDIMM DDR4 16GB - Part Number=752369-081
		PROC 2 DIMM 1: HP RDIMM DDR4 16GB - Part Number=752369-081
		PROC 2 DIMM 4: HP RDIMM DDR4 16GB - Part Number=752369-081
	Adapters configuration:
		1-Synergy 3820C 10/20Gb CNA: Part Number=777430-B21 - Number of ports=4 - Position=NIC.Slot.3.1
	Array Controllers configuration:
		1-Smart Array P240nr Controller: Part Number=Not available - Logical Drives=0 - Position=Slot 0
		2-Smart Array P542D Controller: Part Number=Not available - Logical Drives=0 - Position=Slot 1

WIN-V9SBMGIUTGH [Serial number: MXQ828048H - iLO: 192.168.0.8]: 
	Model: Synergy 480 Gen10
	Total Memory: 128GB
	Memory configuration:
		PROC 1 DIMM 10: HPE DDR4 DRAM 16GB - Part Number=840756-091
		PROC 1 DIMM 3: HPE DDR4 DRAM 16GB - Part Number=840756-091
		PROC 1 DIMM 5: HPE DDR4 DRAM 16GB - Part Number=840756-091
		PROC 1 DIMM 8: HPE DDR4 DRAM 16GB - Part Number=840756-091
		PROC 2 DIMM 10: HPE DDR4 DRAM 16GB - Part Number=840756-091
		PROC 2 DIMM 3: HPE DDR4 DRAM 16GB - Part Number=840756-091
		PROC 2 DIMM 5: HPE DDR4 DRAM 16GB - Part Number=840756-091
		PROC 2 DIMM 8: HPE DDR4 DRAM 16GB - Part Number=840756-091
	Adapters configuration:
		1-Synergy 3820C 10/20Gb CNA: Part Number=782833-001 - Number of ports=4 - Position=NIC.Slot.3.1
	Array Controllers configuration:
		1-HPE Smart Array P416ie-m SR G10: Part Number=836275-001 - Logical Drives=3 [LD-1: Capacity=279GB Disks=1 Status=OK RAID=0 State=Enabled Encrypted=False] [LD-2: Capacity=279GB Disks=1 Status=OK RAID=0 State=Enabled Encrypted=False] [LD-3: Capacity=279GB Disks=2 Status=OK RAID=1 State=Enabled Encrypted=False] - Position=Slot 1

WIN-GMMTHDS7JEK [Serial number: MXQ828048J - iLO: 192.168.0.2]: 
	Model: Synergy 480 Gen10
	Total Memory: 128GB
	Memory configuration:
		PROC 1 DIMM 10: HPE DDR4 DRAM 16GB - Part Number=840756-091
		PROC 1 DIMM 3: HPE DDR4 DRAM 16GB - Part Number=840756-091
		PROC 1 DIMM 5: HPE DDR4 DRAM 16GB - Part Number=840756-091
		PROC 1 DIMM 8: HPE DDR4 DRAM 16GB - Part Number=840756-091
		PROC 2 DIMM 10: HPE DDR4 DRAM 16GB - Part Number=840756-091
		PROC 2 DIMM 3: HPE DDR4 DRAM 16GB - Part Number=840756-091
		PROC 2 DIMM 5: HPE DDR4 DRAM 16GB - Part Number=840756-091
		PROC 2 DIMM 8: HPE DDR4 DRAM 16GB - Part Number=840756-091
	Adapters configuration:
		1-Synergy 3820C 10/20Gb CNA: Part Number=782833-001 - Number of ports=4 - Position=NIC.Slot.3.1
	Array Controllers configuration:
		1-HPE Smart Array P416ie-m SR G10: Part Number=836275-001 - Logical Drives=2 [LD-1: Capacity=279GB Disks=2 Status=OK RAID=1 State=Enabled Encrypted=False] [LD-2: Capacity=559GB Disks=4 Status=OK RAID=10 State=Enabled Encrypted=False] - Position=Slot 1

 
<...>

-------------------------------------------------------------------------------------------------------

All information is collected using the iLO RedFish API. OneView is only used to collect the IPs of all iLOs managed by OneView.

Requirements:
- OneView administrator account is required. 
- HPE Oneview PowerShell library


Author: lionel.jullien@hpe.com
Date:   Nov 2020

--------------------------------------------------------------------------------------------------------

#################################################################################
#        (C) Copyright 2018 Hewlett Packard Enterprise Development LP           #
#################################################################################
#                                                                               #
# Permission is hereby granted, free of charge, to any person obtaining a copy  #
# of this software and associated documentation files (the "Software"), to deal #
# in the Software without restriction, including without limitation the rights  #
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell     #
# copies of the Software, and to permit persons to whom the Software is         #
# furnished to do so, subject to the following conditions:                      #
#                                                                               #
# The above copyright notice and this permission notice shall be included in    #
# all copies or substantial portions of the Software.                           #
#                                                                               #
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR    #
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,      #
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE   #
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER        #
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, #
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN     #
# THE SOFTWARE.                                                                 #
#                                                                               #
#################################################################################
#>

# OneView Credentials and IP
$username = "Administrator" 
$password = "P@ssw0rd" 
$IP = "192.168.1.110"

$file = "Server_HW_Report.txt"


Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
#Import-Module hpeoneview.530 

# Connection to the OneView / Synergy Composer
$secpasswd = ConvertTo-SecureString $password -AsPlainText -Force
$credentials = New-Object System.Management.Automation.PSCredential ($username, $secpasswd)
Connect-OVMgmt -Hostname $IP -Credential $credentials | Out-Null

# Adding this to avoid the error: "The underlying connection was closed: Could not establish trust relationship for the SSL/TLS secure channel."
# when using Self-Signed Certificates
add-type -TypeDefinition  @"
        using System.Net;
        using System.Security.Cryptography.X509Certificates;
        public class TrustAllCertsPolicy : ICertificatePolicy {
            public bool CheckValidationResult(
                ServicePoint srvPoint, X509Certificate certificate,
                WebRequest request, int certificateProblem) {
                return true;
            }
        }
"@
[System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy
  
# Capture iLO4 and iLO5 IP adresses managed by OneView
$servers = Get-OVServer
# $servers = Get-OVServer | ? name -eq "Frame1, bay 5"
#$servers
$iloIPs = $servers | where { $_.mpModel -eq "iLO4" -or "iLO5" } | % { $_.mpHostInfo.mpIpAddresses[1].address }

"Report generated on $(get-date)" | Out-File $file 

Foreach ($iloIP in $iloIPs) {
    
    #Capture of the SSO Session Key
    $ilosessionkey = ($servers | where { $_.mpHostInfo.mpIpAddresses[1].address -eq $iloIP } | Get-OVIloSso -IloRestSession)."X-Auth-Token"
    $iloModel = $servers | where { $_.mpHostInfo.mpIpAddresses[1].address -eq $iloIP } | % mpModel
   
    #Hardware info   
    $request = Invoke-webrequest -Method GET -Uri "https://$iloIP/redfish/v1/systems/1/" -Headers @{"X-Auth-Token" = $ilosessionkey } 

    if ($request -ne $Null) {
        $hwinfo = $request.content | Convertfrom-Json
        #Hostname
        $hostname = $hwinfo.HostName 
        if ($hostname -match "host is unnamed") { $hostname = "Host is unnamed [Serial number: $($hwinfo.SerialNumber) - iLO: $iloIP]" } else { $hostname = "$($hwinfo.HostName) [Serial number: $($hwinfo.SerialNumber) - iLO: $iloIP]" }
        
        #Model
        $model = $hwinfo.Model
        
        #Total memory
        if ($iloModel -eq "ILO4") { $memoryinGB = $hwinfo.Memory.TotalSystemMemoryGB } else { $memoryinGB = $hwinfo.MemorySummary.TotalSystemMemoryGiB }

        #Memory information
        $memoryinfo = (Invoke-webrequest -Method GET -Uri "https://$iloIP/redfish/v1/Systems/1/Memory/" -Headers @{"X-Auth-Token" = $ilosessionkey }).content | Convertfrom-Json 
    
        $memory_data = @{}
   
        foreach ( $dimm in $memoryinfo.Members.'@odata.id') {
        
            $dimm_data = @()    
            $memorydata = (Invoke-webrequest -Method GET -Uri "https://$iloIP$dimm" -Headers @{"X-Auth-Token" = $ilosessionkey }).content | Convertfrom-Json 

            $Manufacturer = ($memorydata.Manufacturer) -replace '\s', ''
            $PartNumber = $memorydata.PartNumber
        
            if ($iloModel -eq "iLO5" -and $memorydata.status.State -eq "Enabled") {
            
                $DIMMTechnology = $memorydata.MemoryDeviceType 
                $DIMMType = $memorydata.MemoryType 
                $SizeGB = $memorydata.CapacityMiB / 1024 
                $DIMMlocator = $memorydata.DeviceLocator

                $dimm_data = $Manufacturer + " " + $DIMMTechnology + " " + $DIMMType + " " + $SizeGB + "GB" + " - Part Number=" + $PartNumber
                $memory_data.Add($DIMMlocator, $dimm_data)
            }
            if ($iloModel -eq "iLO4") {

                $DIMMTechnology = $memorydata.DIMMTechnology
                $DIMMType = $memorydata.DIMMType
                $SizeGB = $memorydata.SizeMB / 1024
                $DIMMlocator = $memorydata.SocketLocator

                $dimm_data = $Manufacturer + " " + $DIMMTechnology + " " + $DIMMType + " " + $SizeGB + "GB" + " - Part Number=" + $PartNumber
                $memory_data.Add($DIMMlocator, $dimm_data)
            }
            
            

        }

        # PCI network adapters information
        if ($iloModel -eq "ILO4") { $adaptersuri = "https://$iloIP/redfish/v1/Systems/1/NetworkAdapters/" } else { $adaptersuri = "https://$iloIP/redfish/v1/Systems/1/BaseNetworkAdapters/" }
    
        $adapterinfo = (Invoke-webrequest -Method GET -Uri $adaptersuri -Headers @{"X-Auth-Token" = $ilosessionkey }).content | Convertfrom-Json 

        $adapters_data = @{}

        $adapterdataId = $Null

        foreach ($adapter in $adapterinfo.Members.'@odata.id') {
            
            $adapter_data = @()    
            $adapterdata = (Invoke-webrequest -Method GET -Uri "https://$iloIP$adapter" -Headers @{"X-Auth-Token" = $ilosessionkey }).content | Convertfrom-Json 
            
            #$adapterdataId = $adapterdata.Id
            $adapterdataId += 1

            $AdapterName = $adapterdataId.ToString() + "-" + $adapterdata.Name 
            $PartNumber = $adapterdata.PartNumber
            $StructuredName = $adapterdata.StructuredName
            $Numberofports = ($adapterdata.PhysicalPorts).Count

            $adapter_data = "Part Number=" + $PartNumber + " - Number of ports=" + $Numberofports + " - Position=" + $StructuredName
            $adapters_data.Add($AdapterName, $adapter_data)
        }

        # PCI ArrayControllers information
        $ArrayControllersuri = "/redfish/v1/Systems/1/SmartStorage/ArrayControllers/" 
    
        $ArrayControllersinfo = (Invoke-webrequest -Method GET -Uri "$iloIP$ArrayControllersuri" -Headers @{"X-Auth-Token" = $ilosessionkey }).content | Convertfrom-Json 

        $ArrayControllers_data = @{}
        $ArrayControllerdataId = $Null

        foreach ($ArrayController in $ArrayControllersinfo.Members.'@odata.id') {
            $logical_drives = $Null
            $ArrayController_data = @()    
            $ArrayControllerdata = (Invoke-webrequest -Method GET -Uri "https://$iloIP$ArrayController" -Headers @{"X-Auth-Token" = $ilosessionkey }).content | Convertfrom-Json 
            
            #$ArrayControllerdataId = $ArrayControllerdata.id
            $ArrayControllerdataId += 1 

            $ArrayControllerName = $ArrayControllerdataId.ToString() + "-" + $ArrayControllerdata.Model 
            
            if ($iloModel -eq "ILO4") { $PartNumber = "Not available" } else { $PartNumber = $ArrayControllerdata.ControllerPartNumber }
            
            $Logicaldrives_data = @{}
            $logicaldrivessuri = $ArrayController + "LogicalDrives/" 
            $logicaldrivesdata = (Invoke-webrequest -Method GET -Uri "https://$iloIP$logicaldrivessuri"  -Headers @{"X-Auth-Token" = $ilosessionkey }).content | Convertfrom-Json 
                        
            # Logical drive info
            $logicaldrives_nb = $logicaldrivesdata.'Members@odata.count'
            
            foreach ($logicaldrive in  $logicaldrivesdata.Members.'@odata.id') {
                
                $logicaldrivedata = (Invoke-webrequest -Method GET -Uri "https://$iloIP$logicaldrive"  -Headers @{"X-Auth-Token" = $ilosessionkey }).content | Convertfrom-Json 

                $logicaldrivecapacityGB = [math]::Round($logicaldrivedata.CapacityMiB / 1024)
                
                $logicaldriveid = $logicaldrivedata.Id
                                
                $uri = "https://$iloIP$logicaldrive" + "DataDrives/"
                $logicaldrive_nb_of_disk = ((Invoke-webrequest -Method GET -Uri $uri  -Headers @{"X-Auth-Token" = $ilosessionkey }).content | Convertfrom-Json ).'Members@odata.count'
                $logicaldrive_raid = $logicaldrivedata.raid
                $logicaldrive_status = $logicaldrivedata.Status.Health
                $logicaldrive_encrypted = $logicaldrivedata.LogicalDriveEncryption
                $logicaldrive_enabled = $logicaldrivedata.Status.state
                
                $logicaldriveinfo = "Capacity=" + $logicaldrivecapacityGB + "GB Disks=" + $logicaldrive_nb_of_disk + " Status=" + $logicaldrive_status + " RAID=" + $logicaldrive_raid + " State=" + $logicaldrive_enabled + " Encrypted=" + $logicaldrive_encrypted
                $Logicaldrives_data.Add($logicaldriveid, $logicaldriveinfo)

            }

            ForEach ($item in ($Logicaldrives_data.GetEnumerator() | Sort-Object -Property name)) {
      
                $logical_drives += " [LD-$($item.Name): $($item.Value)]" 
            } 

            $ArrayController_data = "Part Number=" + $PartNumber + " - Logical Drives=" + $logicaldrives_nb + $logical_drives + " - Position=" + $ArrayControllerdata.location
            $ArrayControllers_data.Add($ArrayControllerName, $ArrayController_data)


            
        }

        # Creation of the report

        "`n" + $hostname + ": `n`tModel: " + $model + "`n`tTotal Memory: " + $memoryinGB + "GB" + "`n`tMemory configuration:"  | Out-File $file -Append
    
        ForEach ($item in ($memory_data.GetEnumerator()) | Sort-Object -Property Name  ) {
      
            "`t`t$($item.Name): $($item.Value)"  | Out-File $file -Append
        } 

        "`tAdapters configuration:"  | Out-File $file -Append

        ForEach ($item in $adapters_data.GetEnumerator()) {
      
            "`t`t$($item.Name): $($item.Value)"  | Out-File $file -Append
        } 

        "`tArray Controllers configuration:"  | Out-File $file -Append

        ForEach ($item in ($ArrayControllers_data.GetEnumerator()) | Sort-Object -Property Name ) {
      
            "`t`t$($item.Name): $($item.Value)"  | Out-File $file -Append
        } 

    }
    Else {
        write-warning "iLO $iloIP cannot be contacted !"
        
    } 

}

write-host "Hardware report has been generated in $pwd\$file" -ForegroundColor Green

Disconnect-OVMgmt

Read-Host -Prompt "Operation done ! Hit return to close" 



