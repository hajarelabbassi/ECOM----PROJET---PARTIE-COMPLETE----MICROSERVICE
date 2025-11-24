# PowerShell script to install JDK 21
Write-Host "Installing JDK 21 using winget..." -ForegroundColor Green

# Install JDK 21 using winget
winget install EclipseAdoptium.Temurin.21.JDK --silent --accept-package-agreements --accept-source-agreements

Write-Host "Installation complete. Refreshing environment variables..." -ForegroundColor Green

# Refresh PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host "Checking Java installation..." -ForegroundColor Green
java -version

