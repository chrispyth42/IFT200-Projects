#Getting contents of license key variable
$LM_LICENSE 	 = (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment").LM_LICENSE_FILE

#If it doesn't contain "27000@test.university.com", append it onto the end with a preceeding comma
if ( ! ($LM_LICENSE -like "*27000@test.university.com*")){
	if ($LM_LICENSE -eq $null){
		Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" -Name LM_LICENSE_FILE  -Value ($LM_LICENSE + "27000@test.university.com")
	} else {
		Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" -Name LM_LICENSE_FILE  -Value ($LM_LICENSE + ",27000@test.university.com")
	}
}
