
function Decode {
    If ($args[0] -is [System.Array]) {
        [System.Text.Encoding]::ASCII.GetString($args[0])
    }
    Else {
        "Not Found"
    }
}


cls
echo "Name, Model, Serial"



$Monitors = Get-WmiObject WmiMonitorID -Namespace root\wmi -ComputerName localhost 


    $Name = Decode $Monitor.UserFriendlyName -notmatch 0
    $Serial = Decode $Monitor.SerialNumberID -notmatch 0   

	$Manufacturer = $i
    echo "$Manufacturer, $Name, $Serial"