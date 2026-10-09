# IT Support, Systems Administration & Azure Automation Lab

[[https://img.shields.io/badge/Platform-Microsoft%20Azure-blue.svg]](https://azure.microsoft.com/)
[[https://img.shields.io/badge/Server-Windows%20Server%202022-0078D6.svg]](https://www.microsoft.com/windows-server)
[[https://img.shields.io/badge/Client-Windows%2011%20Enterprise-00a4ef.svg]](https://www.microsoft.com/windows)
[[https://img.shields.io/badge/Identity-Active%20Directory%20DS-red.svg]]()
[[https://img.shields.io/badge/Automation-PowerShell%207%20%2F%205.1-5391FE.svg]](https://docs.microsoft.com/powershell/)

A complete production-grade hands-on IT infrastructure, help desk incident response, and systems administration portfolio project built and automated in Microsoft Azure.

---

## 1. Project Objective & Company Profile
Simulates the real-world responsibilities of an **IT Support Specialist**, **Help Desk Analyst (Tier 1/2)**, and **Junior Systems Administrator**.

- **Organization:** NorthStar Solutions (~30 Employees)
- **Departments:** IT Support, Human Resources, Finance, Sales, Operations
- **Domain Root:** \
orthstar.local\
- **Cloud Fabric:** Microsoft Azure Virtual Network (\net-northstar\), NSG Least Privilege, Windows Server 2022, Windows 11

---

## 2. Infrastructure Architecture

\\\
+---------------------------------------------------------------------------------------------------+
|                                      MICROSOFT AZURE TENANT                                       |
|                                Resource Group: rg-northstar-it                                    |
|                                    Region: Canada Central                                         |
+---------------------------------------------------------------------------------------------------+
                                                  |
                     +----------------------------+----------------------------+
                     |                                                         |
+------------------------------------------+             +------------------------------------------+
|  Virtual Network: vnet-northstar         |             |  Network Security Group (NSG)            |
|  Address Space: 10.10.0.0/16             |             |  nsg-northstar-servers                   |
|  Subnet: subnet-servers (10.10.10.0/24)  |             |  - Inbound RDP restricted to Admin IP    |
|  Default Gateway: 10.10.10.1             |             |  - Intra-subnet full communication       |
+------------------------------------------+             +------------------------------------------+
                     |
         +-----------+-----------------------+-----------------------+
         |                                   |                       |
+-----------------------+   +-----------------------+   +-----------------------+
| Virtual Machine 01    |   | Virtual Machine 02    |   | Virtual Machine 03    |
| NS-DC01               |   | NS-FS01               |   | NS-PC01               |
| Windows Server 2022   |   | Windows Server 2022   |   | Windows 11 Enterprise |
| IP: 10.10.10.4 (Static)|  | IP: 10.10.10.5 (Static)|  | IP: 10.10.10.6 (DHCP) |
| Roles:                |   | Roles:                |   | Roles:                |
| - Domain Controller   |   | - File & Storage Svcs |   | - Workstation Endpoint|
| - DNS Server (Root)   |   | - SMB Network Shares  |   | - Domain Joined       |
| - Active Directory DS |   | - AGDLP Permissions   |   | - Client Diagnostics  |
| Domain:               |   | Domain:               |   | Domain:               |
| northstar.local       |   | northstar.local       |   | northstar.local       |
+-----------------------+   +-----------------------+   +-----------------------+
\\\

---

## 3. PowerShell Automation Suite (\powershell/\)
- \Get-SystemInfo.ps1\: Hardware inventory, OS build, CPU/RAM utilization, IP discovery.
- \Get-NetworkInfo.ps1\: Adapter speed, MAC address, gateway, DNS resolvers.
- \Test-NetworkConnectivity.ps1\: Automated 6-point reachability testing (Loopback, Gateway, DNS, DC, WAN IP, Web FQDN).
- \Get-ADUserReport.ps1\: Audits Active Directory users and exports account status to CSV.
- \New-ADLabUser.ps1\: Automates user onboarding, OU placement, and security group nesting.
- \Get-DiskSpace.ps1\: Proactive capacity monitor with low storage alerts (< 20%).
- \Get-EventErrors.ps1\: Extracts Critical and Error logs from Event Viewer (past 24 hours).
- \Reset-Dns.ps1\: Clears client resolver cache, purges NetBIOS, and re-registers DNS.

---

## 4. Help Desk Incident Response Matrix (\	ickets/\)

| Ticket ID | Category | Affected User | Issue Summary | Root Cause & Resolution |
| :--- | :--- | :--- | :--- | :--- |
| [INC-001](tickets/INC-001.md) | Network | Sarah Ahmed (HR) | No Internet Access | Invalid static gateway configured; restored DHCP and renewed lease. |
| [INC-002](tickets/INC-002.md) | Identity | John Smith (Finance) | Account Locked Out | Expired password caused 5 bad attempts; unlocked and rotated credentials. |
| [INC-003](tickets/INC-003.md) | DNS | David Brown (Sales) | Resolves 8.8.8.8 but not internal domain | Adapter DNS pointed to public resolver; repointed to 10.10.10.4. |
| [INC-004](tickets/INC-004.md) | Permissions | David Brown (Sales) | Access Denied on Finance share | Working as designed; enforced AGDLP least-privilege boundary. |
| [INC-005](tickets/INC-005.md) | Peripherals | Operations Team | Print Spooler hung | Corrupted print spool file crashed service; purged cache and restarted spooler. |
| [INC-006](tickets/INC-006.md) | Performance | Mike Wilson (IT) | 100% CPU / System Freeze | Low disk space froze Windows Update; freed 12 GB and finished updates. |
| [INC-007](tickets/INC-007.md) | Identity/Tier 2 | Sarah Ahmed (HR) | Recurring lockout every 15 mins | Stale credentials cached in Windows Credential Manager; cleared stale entry. |
| [INC-008](tickets/INC-008.md) | Administration | David Brown (Sales) | Software blocked by UAC | Standard users lack admin rights; deployed via silent administrative installer. |
| [INC-009](tickets/INC-009.md) | Group Policy | Workstation NS-PC01 | Baseline GPO not applying | Workstation in default Computers container; moved to Workstations OU. |
| [INC-010](tickets/INC-010.md) | OS/Profiles | John Smith (Finance) | Temporary Profile loaded | Registry .bak key created after dirty logoff; corrected ProfileList pointer. |

---

## 5. Technical Interview Q&A Summary

- **Active Directory:** Centralized directory service providing authentication (Kerberos) and authorization across domain objects.
- **DNS vs DHCP:** DHCP automatically assigns IP addresses via the DORA process; DNS resolves human-readable names to IP addresses.
- **GPO Precedence:** LSDOU (Local &rarr; Site &rarr; Domain &rarr; Organizational Unit).
- **Share vs NTFS Permissions:** Share permissions govern SMB access; NTFS governs both local and network access. When combined over the network, **the most restrictive permission wins**.
