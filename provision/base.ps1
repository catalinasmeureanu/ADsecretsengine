param(
    $timezone = 'W. Europe Standard Time'
)

#Set timezone
& $env:windir\system32\tzutil /s $timezone
