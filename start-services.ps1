# PowerShell script to start all microservices
$env:PATH += ";C:\Program Files\JetBrains\IntelliJ IDEA 2025.2.1\jbr\bin"

Write-Host "Starting Microservices..." -ForegroundColor Green
Write-Host "1. Starting Discovery Service (Eureka) on port 8761..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot\micro-service\discovery-service'; `$env:PATH += ';C:\Program Files\JetBrains\IntelliJ IDEA 2025.2.1\jbr\bin'; .\mvnw.cmd spring-boot:run" -WindowStyle Normal

Start-Sleep -Seconds 10

Write-Host "2. Starting Config Service on port 9999..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot\micro-service\config-service'; `$env:PATH += ';C:\Program Files\JetBrains\IntelliJ IDEA 2025.2.1\jbr\bin'; .\mvnw.cmd spring-boot:run" -WindowStyle Normal

Start-Sleep -Seconds 10

Write-Host "3. Starting Gateway Service on port 8888..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot\micro-service\gateway-service'; `$env:PATH += ';C:\Program Files\JetBrains\IntelliJ IDEA 2025.2.1\jbr\bin'; .\mvnw.cmd spring-boot:run" -WindowStyle Normal

Start-Sleep -Seconds 10

Write-Host "4. Starting Customer Service on port 8081..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot\micro-service\customer-service'; `$env:PATH += ';C:\Program Files\JetBrains\IntelliJ IDEA 2025.2.1\jbr\bin'; .\mvnw.cmd spring-boot:run" -WindowStyle Normal

Start-Sleep -Seconds 5

Write-Host "5. Starting Inventory Service on port 8082..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot\micro-service\inventory-service'; `$env:PATH += ';C:\Program Files\JetBrains\IntelliJ IDEA 2025.2.1\jbr\bin'; .\mvnw.cmd spring-boot:run" -WindowStyle Normal

Start-Sleep -Seconds 5

Write-Host "6. Starting Billing Service on port 8083..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot\micro-service\billing-service'; `$env:PATH += ';C:\Program Files\JetBrains\IntelliJ IDEA 2025.2.1\jbr\bin'; .\mvnw.cmd spring-boot:run" -WindowStyle Normal

Write-Host "`nAll services are starting in separate windows." -ForegroundColor Green
Write-Host "Please wait for them to fully start (about 1-2 minutes)." -ForegroundColor Green
Write-Host "`nAccess points:" -ForegroundColor Cyan
Write-Host "  - Eureka Dashboard: http://localhost:8761" -ForegroundColor White
Write-Host "  - Gateway: http://localhost:8888" -ForegroundColor White
Write-Host "  - Customer API: http://localhost:8888/customer-service/api/customers" -ForegroundColor White
Write-Host "  - Inventory API: http://localhost:8888/inventory-service/api/products" -ForegroundColor White
Write-Host "  - Billing API: http://localhost:8888/billing-service/api/bills" -ForegroundColor White

