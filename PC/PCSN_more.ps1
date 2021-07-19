
[string[]]$PCs  = Get-Content -Path .\PClist.txt 
$LogFile = ".\monitors.txt"

cls

foreach ($i in $PCs) {
Get-BIOSDetails $i
}



function Get-BIOSDetails {            
param($Computer)            

$output = "" | select ComputerName,  SerialNumber            
$obj = Get-WMIObject -Class Win32_BIOS -ComputerName $Computer             
$output.ComputerName = $Computer.ToUpper()  
$output.SerialNumber = $obj.SerialNumber            

$output            

}

