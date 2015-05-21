# Download nxlog .msi file
Invoke-WebRequest "http://downloads.sourceforge.net/project/n xlog-ce/nxlog-ce-2.8.1248.msi?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fnxlog-ce%2Ffiles%2F&ts=1432210232&use_mirror=c znic" -OutFile nxlog.msi

# Install nxlog .msi file
Start-Process ".\nxlog.msi" /qn -Wait

cd 'C:\Program Files (x86)\nxlog\conf'

# Download NXLog configuration file
Invoke-WebRequest "https://raw.githubusercontent.com/markuskont/central_logging/master/NXLog/nxlog.conf" -OutFile .\nxlog.tpl

$fqdn={[System.Net.Dns]::GetHostByName(($env:computerName)).HostName}

$fqdn=& $fqdn
$keyfile=($fqdn + ".key")
$certfile=($fqdn + ".cert")
$cafile="cacert.pem"

$server="CHANGEME"
$port="514"

Get-Content .\nxlog.tpl | ForEach-Object {$_ -Replace "__CAFILE__","$cafile" ` -Replace "__CERTFILE__","$certfile" ` -Replace "__KEYFILE__","$keyfile" ` -Replace "__SERVER__","$server" ` -Replace "__PORT__","$port"} | Out-File .\nxlog.conf
