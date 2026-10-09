Import-Module ActiveDirectory -ErrorAction SilentlyContinue
Write-Host "=== ACTIVE DIRECTORY USER AUDIT ===" -ForegroundColor Cyan
Get-ADUser -Filter * -Properties DisplayName, Department, Enabled, LastLogonDate, PasswordLastSet | 
    Select-Object SamAccountName, DisplayName, Department, Enabled, LastLogonDate | 
    Export-Csv -Path ".\ADUserReport.csv" -NoTypeInformation
Write-Host "Exported Active Directory user report to ADUserReport.csv" -ForegroundColor Green
