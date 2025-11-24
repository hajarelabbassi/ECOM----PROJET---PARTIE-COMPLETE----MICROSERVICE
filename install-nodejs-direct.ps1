# PowerShell script to download and install Node.js directly
Write-Host "Downloading Node.js LTS installer..." -ForegroundColor Green

# Download Node.js LTS Windows x64 installer
$nodeUrl = "https://nodejs.org/dist/v24.11.1/node-v24.11.1-x64.msi"
$installerPath = "$env:TEMP\nodejs-installer.msi"

try {
    Write-Host "Downloading from: $nodeUrl" -ForegroundColor Yellow
    Invoke-WebRequest -Uri $nodeUrl -OutFile $installerPath -UseBasicParsing
    
    Write-Host "Download complete!" -ForegroundColor Green
    Write-Host "`nStarting installation..." -ForegroundColor Yellow
    Write-Host "A UAC prompt will appear - please click 'Yes' to allow installation." -ForegroundColor Cyan
    
    # Run the installer
    Start-Process msiexec.exe -ArgumentList "/i `"$installerPath`" /quiet /norestart" -Wait -Verb RunAs
    
    Write-Host "`nInstallation complete!" -ForegroundColor Green
    Write-Host "`nIMPORTANT: Please close and reopen PowerShell for PATH changes to take effect." -ForegroundColor Yellow
    Write-Host "Then run: npm install -g @angular/cli" -ForegroundColor Cyan
    
    # Clean up
    Remove-Item $installerPath -ErrorAction SilentlyContinue
} catch {
    Write-Host "`nError downloading or installing Node.js:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    Write-Host "`nPlease download Node.js manually from: https://nodejs.org/" -ForegroundColor Yellow
}

