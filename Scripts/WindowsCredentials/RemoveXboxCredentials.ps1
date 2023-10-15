Import-Module -Name Manage-StoredCredentials

$credentials = Manage-StoredCredentials -ShoCred -All

foreach ($cred in $credentials |Where { $_.Target -like "*Xbl*" } ) {
    Manage-StoredCredentials -DelCred -Target $cred.Target -CredType GENERIC
}