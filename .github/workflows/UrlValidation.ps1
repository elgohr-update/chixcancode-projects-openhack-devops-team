Param(
    [string] [Parameter(Mandatory=$true)] $Uri,
    [boolean] [Parameter(Mandatory=$false)] $displayUri
    )

$R = Invoke-WebRequest -URI $Uri
$timestamp = Get-Date
$output = ""
if ($displayUri) {
  $output = $output = '{0} | {1} | {2}' -f($timestamp, $R.StatusCode, $Uri)
  if($R.SatusCode -ne '200'){
    exit 1
  }
} else {

  $output = '{0} | {1}' -f($timestamp, $R.StatusCode)
}
Write-Output $output
Start-Sleep -Seconds 1
