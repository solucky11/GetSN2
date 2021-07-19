function Decode {
    If ($args[0] -is [System.Array]) {
        [System.Text.Encoding]::ASCII.GetString($args[0])
    }
    Else {
        "Not Found"
    }
}

[string[]]$PCs  = Get-Content -Path .\PClist.txt 


cls

echo "Name, Model, Serial"

foreach ($i in $PCs) {

$Monitors = Get-WmiObject WmiMonitorID -Namespace root\wmi -ComputerName $i



ForEach ($Monitor in $Monitors) {  




    $Name = Decode $Monitor.UserFriendlyName -notmatch 0
    $Serial = Decode $Monitor.SerialNumberID -notmatch 0
 

	$Manufacturer = $i
    echo "$Manufacturer, $Name, $Serial"
   

   
}

}


