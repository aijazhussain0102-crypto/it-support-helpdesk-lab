param([string]$FirstName, [string]$LastName, [string]$Department)
Import-Module ActiveDirectory -ErrorAction Stop
$username = ($FirstName.Substring(0,1) + $LastName).ToLower()
$domainDN = (Get-ADDomain).DistinguishedName
$targetOU = "OU=$Department,OU=Users,OU=NorthStar,$domainDN"
$secPass = ConvertTo-SecureString "TempP@ss2026!" -AsPlainText -Force
New-ADUser -Name "$FirstName $LastName" -GivenName $FirstName -Surname $LastName -SamAccountName $username -UserPrincipalName "$username@northstar.local" -Department $Department -Path $targetOU -AccountPassword $secPass -Enabled $true -ChangePasswordAtLogon $true
Add-ADGroupMember -Identity "GG-$Department" -Members $username
Write-Host "Successfully onboarded user $username into $targetOU and added to GG-$Department" -ForegroundColor Green
