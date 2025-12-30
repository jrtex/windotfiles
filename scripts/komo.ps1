
param(
  [String] $configfile = "$env:USERPROFILE\.config\komorebi\komorebi.work.json",
  [String] $config = "",
  [Switch] $Kill,
  [Switch] $Restart,
  [Switch] $bar,
  [Switch] $masir
)

if ( $config = "") { $config = "tie" }

switch ($config) {
  work {
    $configfile = "$env:USERPROFILE\.config\komorebi\komorebi.work.json"
  } office {
    $configfile = "$env:USERPROFILE\.config\komorebi\komorebi.office.json"
  } home {
    $configfile = "$env:USERPROFILE\.config\komorebi\komorebi.home.json"
  } tie {
    $configfile = "$env:USERPROFILE\.config\komorebi\komorebi.tie.json"
  } laptop {
    $configfile = "$env:USERPROFILE\.config\komorebi\komorebi.laptop.json"
  } default {
    $bar = $true
    $masir = $true
    $configfile = "$env:USERPROFILE\.config\komorebi\komorebi.tie.json"
  } 
}

$Command = "komorebic start -c $configfile --whkd"
if ( $bar ) { $Command += " --bar";}
if ( $masir ) { $Command += " --masir";}


if( $Kill -or $Restart){
  Invoke-Expression -Command "Stop-Process -Name komorebi-bar"
  Invoke-Expression -Command "Stop-Process -Name masir"
  Invoke-Expression -Command "Stop-Process -Name whkd"
  Invoke-Expression -Command "komorebic stop"
}

if( -not $Kill) {
  Invoke-Expression -Command $Command
}
