@{
    ModuleName = 'Remove-EmptyFolders'
    ModuleVersion = '1.0.0'
    Author = 'Tyler Jaacks'
    Description = 'A module to delete empty folders recursively.'
    FunctionsToExport = @('Remove-EmptyFolders')
}
function Remove-EmptyFolders {
    param (
        [string]$Path = (Get-Location)
    )

    if (-not (Test-Path -Path $Path)) {
        Write-Error "The path '$Path' does not exist."
        return
    }

    # Recursively get all folders
    $folders = Get-ChildItem -Path $Path -Directory -Recurse

    # Sort folders by depth to delete the deepest folders first
    $folders = $folders | Sort-Object { $_.FullName.Split('\').Count }

    foreach ($folder in $folders) {
        # Check if the folder is empty
        if (-not (Get-ChildItem -Path $folder.FullName -Recurse -ErrorAction SilentlyContinue)) {
            try {
                Remove-Item -Path $folder.FullName -Force
                Write-Output "Deleted empty folder: $($folder.FullName)"
            } catch {
                Write-Error "Failed to delete folder: $($folder.FullName). Error: $_"
            }
        }
    }
}

# Export the function to be available to users of the module
Export-ModuleMember -Function Remove-EmptyFolders