Write-Host "=== NORTHSTAR SOLUTIONS - NETWORK DIAGNOSTIC TEST ===" -ForegroundColor Cyan
$gw = (Get-NetIPConfiguration | Where-Object { $_.IPv4DefaultGateway } | Select-Object -First 1).IPv4DefaultGateway.NextHop
$dns = (Get-DnsClientServerAddress -AddressFamily IPv4 | Where-Object { $_.ServerAddresses } | Select-Object -First 1).ServerAddresses[0]
Write-Host "1. Loopback (127.0.0.1)      : $(if (Test-Connection 127.0.0.1 -Count 1 -Quiet) {'[ PASS ]'} else {'[ FAIL ]'})"
Write-Host "2. Default Gateway ($gw)  : $(if (Test-Connection $gw -Count 1 -Quiet) {'[ PASS ]'} else {'[ FAIL ]'})"
Write-Host "3. Primary DNS ($dns)     : $(if (Test-Connection $dns -Count 1 -Quiet) {'[ PASS ]'} else {'[ FAIL ]'})"
Write-Host "4. Domain Controller (10.10.10.4): $(if (Test-Connection 10.10.10.4 -Count 1 -Quiet) {'[ PASS ]'} else {'[ FAIL ]'})"
Write-Host "5. Internet WAN (8.8.8.8)   : $(if (Test-Connection 8.8.8.8 -Count 1 -Quiet) {'[ PASS ]'} else {'[ FAIL ]'})"
Write-Host "6. Domain Resolution (northstar.local) : $(try { if ([System.Net.Dns]::GetHostAddresses('northstar.local')) {'[ PASS ]'} } catch {'[ FAIL ]'})"
Write-Host "7. Web DNS (google.com)     : $(try { if ([System.Net.Dns]::GetHostAddresses('google.com')) {'[ PASS ]'} } catch {'[ FAIL ]'})"
