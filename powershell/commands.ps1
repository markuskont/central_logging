# Download nxlog .msi file
Invoke-WebRequest "http://downloads.sourceforge.net/project/nxlog-ce/nxlog-ce-2.8.1248.msi?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fnxlog-ce%2Ffiles%2F&ts=1432210232&use_mirror=cznic" -OutFile nxlog.msi

# Install nxlog .msi file
Start-Process ".\nxlog.msi" /qn -Wait

$confdir='C:\Program Files (x86)\nxlog\conf'

cd $confdir

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

# Maybe this will work

$certdir = 'C:\Program Files (x86)\nxlog\cert'

$uri="CHANGEME"

$user='CHANGEME'
$pwd='CHANGEME'

$wc = new-object System.Net.WebClient
$credCache = new-object System.Net.CredentialCache
$creds = new-object System.Net.NetworkCredential($user,$pwd)

$source = ($uri + '/' + $keyfile)
$destination =($certdir + '\' + $keyfile)
$credCache.Add($source, "Basic", $creds)
$wc.Credentials = $credCache
$wc.DownloadFile($source, $destination)

$source = ($uri + '/' + $certfile)
$destination =($certdir + '\' + $certfile)
$credCache.Add($source, "Basic", $creds)
$wc.Credentials = $credCache
$wc.DownloadFile($source, $destination)

$source = ($uri + '/' + $ccfile)
$destination =($certdir + '\' + $cafile)
$credCache.Add($source, "Basic", $creds)
$wc.Credentials = $credCache
$wc.DownloadFile($source, $destination)
