Write-Host "=== NORTHSTAR SOLUTIONS - SYSTEM INFO AUDIT ===" -ForegroundColor Cyan
Write-Host "Computer Name    : $env:COMPUTERNAME"
Write-Host "Operating System : $((Get-CimInstance Win32_OperatingSystem).Caption)"
Write-Host "CPU Name         : $((Get-CimInstance Win32_Processor).Name)"
Write-Host "Total Memory (GB): $([math]::Round((Get-CimInstance Win32_OperatingSystem).TotalVisibleMemorySize / 1MB, 2))"
Write-Host "Free Memory (GB) : $([math]::Round((Get-CimInstance Win32_OperatingSystem).FreePhysicalMemory / 1MB, 2))"
Write-Host "Logged-in User   : $env:USERNAME"
Write-Host "IPv4 Address     : $((Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -notmatch 'Loopback' }).IPAddress -join ', ')"
