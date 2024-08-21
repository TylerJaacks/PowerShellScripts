@{
    ModuleName = 'Remove-XboxCredentials'
    ModuleVersion = '1.0.0'
    Author = 'Tyler Jaacks'
    Description = 'A module to remove Xbox related credentials from the Credential Manager.'
    FunctionsToExport = @('Remove-XboxCredentials')
}
function Remove-XboxCredentials {
	# Retrieve all credentials
	$Creds = cmdkey /list

	# Find credentials starting with 'XblGrts|'
	$CredsToRemove = $Creds -Match "XblGrts\|.*"

	# Remove each matching credential
	foreach ($Cred in $CredsToRemove) {
		# Extract the exact credential name
		$CredName = $Cred -Replace ".*Target: ", ""

		# Remove the credential
		cmdkey /delete:$CredName
		
		Write-Output "Removed: $credName"
	}
}

# Export the function to be available to users of the module
Export-ModuleMember -Function Remove-XboxCredentials