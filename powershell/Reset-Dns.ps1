Write-Host "=== RESETTING DNS CLIENT CACHE & RE-REGISTERING RECORDS ===" -ForegroundColor Cyan
Clear-DnsClientCache
Register-DnsClient
nbtstat -R | Out-Null
Write-Host "DNS cache flushed and re-registered with Domain Controller (10.10.10.4)." -ForegroundColor Green
