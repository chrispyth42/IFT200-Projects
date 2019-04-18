#Modifying security group memberships via csv
$CSV = $args[0]

#Post a request to the user, along with the required fields
if (! $CSV){
	Write-Host "Please provide a CSV as an argument"
	Write-Host "Required Columns: GroupName,Username, Action (Add/Remove)"
	exit
}

#Importing the CSV
$MembershipCSV = Import-CSV "$CSV"

#Iterating through the CSV, and performing actions
#IF statements switching between ADD and REMOVE actions
foreach ($entry in $MembershipCSV){
	if ($entry.Action -eq "Add"){
 		Add-ADGroupMember -Identity $entry.Group -Members $entry.User
	}
	if ($entry.Action -eq "Remove"){
		Remove-ADGroupMember -Identity $entry.Group -Members $entry.User
	}
}
	
