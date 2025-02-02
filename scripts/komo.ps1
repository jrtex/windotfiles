
param(
  [String] $configfile = "$env:USERPROFILE\.config\komorebi\komorebi.work.json",
  [String] $config = "",
  [Switch] $Kill,
  [Switch] $Restart,
  [Switch] $bar 
)


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
    $configfile = "$env:USERPROFILE\.config\komorebi\komorebi.json"
  } 
}

$Command = "komorebic start -c $configfile --whkd"
if ( $bar ) { $Command += " --bar";}


if( $Kill -or $Restart){
  Invoke-Expression -Command "komorebic stop"
}

if( -not $Kill) {
  Invoke-Expression -Command $Command
}
