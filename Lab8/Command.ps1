#References
#https://blogs.technet.microsoft.com/askds/2010/02/04/inventorying-computers-with-ad-powershell/
#https://social.technet.microsoft.com/wiki/contents/articles/12056.active-directory-get-adcomputer-default-and-extended-properties.aspx

#This command gets the specified properties for all computers in the domain, selects those results, then exports them as a UTF8 Encoded CSV file
Get-ADComputer -Filter * -SearchBase "DC=cthompson,DC=local" -Properties Name, OperatingSystemVersion, Enabled, Created, Modified, DistinguishedName | Select-Object Name,Enabled,Created,Modified,OperatingSystemVersion,DistinguishedName | Export-CSV allPCs.csv -NoTypeInformation -Encoding UTF8