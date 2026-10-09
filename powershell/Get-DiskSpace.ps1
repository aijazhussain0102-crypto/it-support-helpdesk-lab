Write-Host "=== STORAGE CAPACITY AUDIT ===" -ForegroundColor Cyan
Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | ForEach-Object {
    $freePercent = [math]::Round(($_.FreeSpace / $_.Size) * 100, 1)
    Write-Host "Volume $($_.DeviceID) Free Space: $([math]::Round($_.FreeSpace/1GB, 2)) GB ($freePercent%)"
    if ($freePercent -lt 20) {
        Write-Host "  [WARNING] Low storage space below 20% on $($_.DeviceID)!" -ForegroundColor Red
    } else {
        Write-Host "  [OK] Storage within healthy operating limits." -ForegroundColor Green
    }
}
