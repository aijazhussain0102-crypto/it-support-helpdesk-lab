# Azure Infrastructure Architecture — NorthStar Solutions

## Topology
- **Tenant Location:** Canada Central (East US secondary)
- **Resource Group:** \g-northstar-it\
- **Virtual Network:** \net-northstar\ (\10.10.0.0/16\)
- **Subnet:** \subnet-servers\ (\10.10.10.0/24\)
- **Network Security Group:** \
sg-northstar-servers\ (RDP locked down to admin IP)

## Virtual Machine Inventory
1. **NS-DC01:** Windows Server 2022 Datacenter (\10.10.10.4\ Static) — Domain Controller, DNS, Group Policy.
2. **NS-FS01:** Windows Server 2022 Datacenter (\10.10.10.5\ Static) — File Server, SMB Shares, AGDLP ACLs.
3. **NS-PC01:** Windows 11 Enterprise/Pro (\10.10.10.6\ DHCP) — Help Desk Workstation, Domain Joined.
