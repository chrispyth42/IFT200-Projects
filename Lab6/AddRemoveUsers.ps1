#Adding users via CSV file
$CSV = $args[0]

#Post a request to the user, along with the required fields
if (! $CSV){
	Write-Host "Please provide a CSV as an argument"
	Write-Host "Required Columns: Username,FistName,LastName,Description,Path,Password,Action (Add/Remove)"
	exit
}

#Importing the CSV
$AddRemoveCSV = Import-CSV "$CSV"

#Iterating through the CSV, and performing actions
foreach ($user in $AddRemoveCSV){
 	if ($user.Action -eq "Add"){
		New-ADUser -Name $user.Username -GivenName $user.FistName -Surname $user.LastName -Description $user.Description -Path $user.Path -AccountPassword (ConvertTo-SecureString $user.Password -AsPlainText -Force)
	}
	Elseif ($user.Action -eq "Remove"){
		Remove-ADUser -Identity $user.Username
	}
	Else {
		Write-Host "Invalid line at user:" $user.Username
	}
}
