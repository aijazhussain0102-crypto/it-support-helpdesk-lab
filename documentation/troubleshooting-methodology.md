# Active Directory AGDLP Access Control Model

## Structure
- **Accounts (A):** Users (\jsmith\, \sahmed\, \dbrown\, \mwilson\)
- **Global Groups (G):** Departmental role groups (\GG-Finance\, \GG-HR\, \GG-Sales\, \GG-IT\)
- **Domain Local / Resource Groups (DL):** Resource permission groups (\GG-Finance-Share\, \GG-HR-Share\)
- **Permissions (P):** NTFS & SMB permissions on \\\NS-FS01\Shares\
"@ | Out-File -FilePath "C:\Users\aijaz\it-support-helpdesk-lab\active-directory\users-and-groups.md" -Encoding utf8

# 3. documentation/troubleshooting-methodology.md
@"
# NorthStar Solutions 8-Step Troubleshooting Methodology

1. **Identify the Problem:** Interview the user, establish timeline, determine scope.
2. **Reproduce the Problem:** Replicate error, verify symptoms.
3. **Gather Information:** Run non-destructive diagnostics (\ipconfig\, \
slookup\, event logs).
4. **Formulate Hypothesis:** Determine most probable root cause using OSI layer model.
5. **Test the Hypothesis:** Execute a controlled, reversible test.
6. **Implement Solution:** Apply remediation change.
7. **Verify Functionality:** Have user confirm original task and verify secondary services.
8. **Document Everything:** Record symptom, root cause, resolution, verification, and prevention.
