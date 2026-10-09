Write-Host "=== NORTHSTAR SOLUTIONS - NETWORK CONFIGURATION ===" -ForegroundColor Cyan
Get-NetAdapter | Where-Object Status -eq "Up" | ForEach-Object {
    $ipConfig = Get-NetIPConfiguration -InterfaceAlias $_.Name -ErrorAction SilentlyContinue
    [PSCustomObject]@{
        AdapterName    = $_.Name
        MACAddress     = $_.MacAddress
        LinkSpeed      = $_.LinkSpeed
        IPv4Address    = ($ipConfig.IPv4Address.IPAddress -join ', ')
        DefaultGateway = $ipConfig.IPv4DefaultGateway.NextHop
        DNSServers     = ($ipConfig.DNSServer.ServerAddresses -join ', ')
    }
} | Format-List
