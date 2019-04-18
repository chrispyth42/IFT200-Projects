#Adding security groups via CSV file
$CSV = $args[0]

#Post a request to the user, along with the required fields
if (! $CSV){
	Write-Host "Please provide a CSV as an argument"
	Write-Host "Required Columns: Name, Description, OUPath, Scope (DomainLocal/Global/Universal), Category (Distribution/Security)"
	exit
}

#Importing the CSV
$GroupCSV = Import-CSV "$CSV"

#Iterating through the CSV, and performing actions
#Checking the input fields to make sure that arguments are correct
foreach ($group in $GroupCSV){
 	if ( ($group.Scope -eq "DomainLocal") -or ($group.Scope -eq "Global") -or ($group.Scope -eq "Unversal") ){
		if ($group.Category -eq "Security" -or $group.Category -eq "Distribution"){
			New-ADGroup -Name $group.Name -Description $group.Description -path $group.OUPath -GroupScope $group.Scope -GroupCategory $group.Category
		}
	}
}
	
