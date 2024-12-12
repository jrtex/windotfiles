
param(
  [String] $config = "$env:USERPROFILE\.config\komorebi\komorebi.work.json",
  [String] $place = "",
  [Switch] $Kill,
  [Switch] $Restart,
  [Switch] $bar 
)


switch ($place) {
  work {
    $config = "$env:USERPROFILE\.config\komorebi\komorebi.work.json"
  } office {
    $config = "$env:USERPROFILE\.config\komorebi\komorebi.office.json"
  } home {
    $config = "$env:USERPROFILE\.config\komorebi\komorebi.home.json"
  } laptop {
    $config = "$env:USERPROFILE\.config\komorebi\komorebi.laptop.json"
  } default {
    $config = "$env:USERPROFILE\.config\komorebi\komorebi.json"
  } 
}

$Command = "komorebic start -c $config --whkd"
if ( $bar ) { $Command += " --bar";}


if( $Kill -or $Restart){
  Invoke-Expression -Command "komorebic stop"
}

if( -not $Kill) {
  Invoke-Expression -Command $Command
}
