$serviceName = "CarefoSVC"
$serviceFolder = "C:\data\carefoSVC"
$exePath = Join-Path $serviceFolder "\Carefo.QueueProcessor.Service.exe"
$binFolder = "$PSScriptRoot\..\Carefo.QueueProcessor.Service\*"
$env:Path += ";C:\Windows\Microsoft.NET\Framework\v4.0.30319\"

Start-Process "$PSScriptRoot\..\Required3rdParty\LLBLGenPro-v42-Full-setup.exe" /S -NoNewWindow -Wait -PassThru
Copy-Item "$PSScriptRoot\..\Required3rdParty\LLBLGen Pro v4.2" "C:\Program Files (x86)\Solutions Design\" -Recurse -Force

# Create service folder.
echo "mkdir $serviceFolder -Force"
mkdir $serviceFolder -Force
echo $exePath

$existingService = Get-WmiObject -Class Win32_Service -Filter "Name='$serviceName'"

if ($existingService) {
  "'$serviceName' exists already. Stopping."
  Stop-Service $serviceName
  "Waiting 5 seconds to allow existing service to stop."
  Start-Sleep -s 5

  echo "--Uninstalling service $serviceName..."
  # Stop-Service -Name $ServiceName
  InstallUtil $exePath /u /unattended
  "Waiting 5 seconds to allow service to be uninstalled."
  Start-Sleep -s 5  
}

$existingService = Get-WmiObject -Class Win32_Service -Filter "Name='$serviceName'"

if ($existingService) {
  "'$serviceName' exists already. Stopping."
  Stop-Service $serviceName
  "Waiting 5 seconds to allow existing service to stop."
  Start-Sleep -s 5

  $existingService.Delete()
  "Waiting 5 seconds to allow service to be uninstalled."
  Start-Sleep -s 5  
}

echo PSScriptRoot
# Copy files to service folder.
echo "Copy-Item $binFolder $serviceFolder -Recurse -Force"
Copy-Item $binFolder $serviceFolder -Recurse -Force

"Installing the service."
New-Service -BinaryPathName $exePath -Name $serviceName -DisplayName $serviceName -StartupType Automatic -Description "Runs automated Carefo routines"
"Installed the service."
"Starting the service."
Start-Service $serviceName
"Started the service."
"Completed."