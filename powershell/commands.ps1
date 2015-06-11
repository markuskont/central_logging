# Download nxlog .msi file
# PS! Link might be broken, please verify
Invoke-WebRequest "http://downloads.sourceforge.net/project/nxlog-ce/nxlog-ce-2.8.1248.msi?r=&ts=1433337759&use_mirror=cznic" -OutFile nxlog.msi

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
$conffile="nxlog.conf"

$server="CHANGEME"
$port="CHANGEME"


# Maybe this will work

$certdir = 'C:\Program Files (x86)\nxlog\cert'

$uri="CHANGEME"

$user='CHANGEME'
$pwd='CHANGEME'

# Disable SSL certificate verification
# Bad practice, but I trust the source

[System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }

$wc = new-object System.Net.WebClient
$credCache = new-object System.Net.CredentialCache
$creds = new-object System.Net.NetworkCredential($user,$pwd)

$source = ($uri + '/' + $conffile)
$destination =($confdir + '\' + $conffile)
$credCache.Add($source, "Basic", $creds)
$wc.Credentials = $credCache
$wc.DownloadFile($source, $destination)

# This command corrupts the configuration file, making it unparsable fro nxlog
# File remains to be human readable though
mv .\nxlog.conf .\nxlog.tpl
Get-Content .\nxlog.tpl | ForEach-Object {$_ -Replace "__CAFILE__","$cafile" ` -Replace "__CERTFILE__","$certfile" ` -Replace "__KEYFILE__","$keyfile" ` -Replace "__SERVER__","$server" ` -Replace "__PORT__","$port"} | Out-File .\nxlog.conf

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

$source = ($uri + '/' + $cafile)
$destination =($certdir + '\' + $cafile)
$credCache.Add($source, "Basic", $creds)
$wc.Credentials = $credCache
$wc.DownloadFile($source, $destination)
