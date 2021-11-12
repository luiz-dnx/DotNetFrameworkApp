$serviceName = "WorkerSVC"
$serviceFolder = "C:\data\WorkerSVC"
$exePath = "$serviceFolder\DotNetFrameworkApp.Worker.exe"
$binFolder = "$PSScriptRoot\DotNetFrameworkApp.Worker\*"
$env:Path += ";C:\Windows\Microsoft.NET\Framework\v4.0.30319\"

# Create service folder.
mkdir $serviceFolder -Force

$existingService = Get-WmiObject -Class Win32_Service -Filter "Name='$serviceName'"

if ($existingService) {
  echo "'$serviceName' exists already. Stopping."
  Stop-Service $serviceName
  
  echo "Waiting 5 seconds to allow existing service to stop."
  Start-Sleep -s 5

  echo "--Uninstalling service $serviceName..."
  InstallUtil $exePath /u /unattended

  echo "Waiting 5 seconds to allow service to be uninstalled."
  Start-Sleep -s 5  
}

# Copy files to service folder.
Copy-Item $binFolder $serviceFolder -Recurse -Force

echo "Installing the service."
InstallUtil $exePath /unattended
echo "Installed the service."
echo "Starting the service."
Start-Service $serviceName
echo "Started the service."
echo "Completed."