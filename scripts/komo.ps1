
param(
  [String] $config = "C:\Users\jordanTexier\.config\komorebi\komorebi.work.json",
  [String] $place = "",
  [Switch] $Kill,
  [Switch] $Restart,
  [Switch] $bar 
)


switch ($place) {
  work {
    $config = "C:\Users\jordanTexier\.config\komorebi\komorebi.work.json"
  } office {
    $config = "C:\Users\jordanTexier\.config\komorebi\komorebi.office.json"
  } home {
    $config = "C:\Users\jordanTexier\.config\komorebi\komorebi.home.json"
  } default {
    $config = "C:\Users\jordanTexier\.config\komorebi\komorebi.json"
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
