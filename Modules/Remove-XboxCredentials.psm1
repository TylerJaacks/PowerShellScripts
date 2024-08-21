$PSMRoot = "D:\Documents\Projects\PowerShell\PowerShellScripts\Modules"

# TODO: Figure out how to replace this with something else.
Import-Module -DisableNameChecking "$PSMRoot\Manage-StoredCredentials"

@{
    ModuleName = 'Remove-XboxCredentials'
    ModuleVersion = '1.0.0'
    Author = 'Tyler Jaacks'
    Description = 'A module to remove Xbox related credentials from the Credential Manager.'
    FunctionsToExport = @('Remove-XboxCredentials')
}
function Remove-XboxCredentials {
    $credentials = Manage-StoredCredentials -ShoCred -All

    foreach ($cred in $credentials |Where { $_.Target -like "*Xbl*" } ) {
        Manage-StoredCredentials -DelCred -Target $cred.Target -CredType GENERIC
    }

    foreach ($cred in $credentials |Where { $_.Target -like "*MCL*" } ) {
        Manage-StoredCredentials -DelCred -Target $cred.Target -CredType GENERIC
    }
}

# Export the function to be available to users of the module
Export-ModuleMember -Function Remove-XboxCredentials