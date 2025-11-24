# PowerShell script to install Node.js and Angular CLI
Write-Host "Installing Node.js..." -ForegroundColor Green

# Install Node.js using winget
winget install OpenJS.NodeJS --silent --accept-package-agreements --accept-source-agreements

Write-Host "Waiting for installation to complete..." -ForegroundColor Yellow
Start-Sleep -Seconds 30

# Refresh PATH
Write-Host "Refreshing environment variables..." -ForegroundColor Yellow
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Check Node.js installation
Write-Host "`nChecking Node.js installation..." -ForegroundColor Green
try {
    $nodeVersion = node --version
    Write-Host "Node.js installed: $nodeVersion" -ForegroundColor Green
    
    $npmVersion = npm --version
    Write-Host "npm installed: $npmVersion" -ForegroundColor Green
    
    # Install Angular CLI globally
    Write-Host "`nInstalling Angular CLI globally..." -ForegroundColor Green
    npm install -g @angular/cli
    
    Write-Host "`nChecking Angular CLI installation..." -ForegroundColor Green
    $ngVersion = ng version
    Write-Host "Angular CLI installed successfully!" -ForegroundColor Green
    Write-Host "`nInstallation complete!" -ForegroundColor Green
    Write-Host "You may need to restart your terminal for PATH changes to take full effect." -ForegroundColor Yellow
} catch {
    Write-Host "Error: Node.js may not be in PATH yet. Please restart your terminal and run:" -ForegroundColor Red
    Write-Host "  npm install -g @angular/cli" -ForegroundColor Yellow
}

