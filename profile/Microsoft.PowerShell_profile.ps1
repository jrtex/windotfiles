$env:Path += "$env:USERPROFILE\Scripts;"

$_ZO_DATA_DIR = "$env:USERPROFILE\AppData\Local\"


Set-Alias -Name vim -Value nvim

function ListDir {
  [alias('ls')]
  param(
    [string] $Path
  )
  eza.exe -lab --group-directories-first --icons $Path
}

function ListDirGit {
  [alias('lg')]
  param(
    [string] $Path
  )
  eza.exe -lab --group-directories-first --git --icons $Path
}

oh-my-posh init pwsh --config "$env:USERPROFILE/.config/oh-my-posh/themes/M365Princess_gruvbox2.omp.json" | Invoke-Expression

Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })
