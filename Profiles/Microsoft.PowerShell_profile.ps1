$PSMRoot = "D:\Documents\Projects\PowerShell\PowerShellScripts\Modules"

oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/powerlevel10k_modern.omp.json' | Invoke-Expression

Import-Module "$PSMRoot\Remove-EmptyFolders.psm1"
Import-Module "$PSMRoot\Remove-XboxCredentials.psm1"