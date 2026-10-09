Write-Host "=== EVENT VIEWER CRITICAL & ERROR LOG SCAN (PAST 24 HOURS) ===" -ForegroundColor Cyan
$startTime = (Get-Date).AddHours(-24)
Get-WinEvent -FilterHashtable @{LogName='System','Application'; Level=1,2; StartTime=$startTime} -MaxEvents 20 | 
    Select-Object TimeCreated, LogName, Id, ProviderName, Message | Format-Table -AutoSize
