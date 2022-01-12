<#
.SYNOPSIS
  The "Remove-CharactersPerInterval" function will remove each character of a string per the given interval.  The default interval is two, meaning that every other character will be removed unless otherwise specified with the '-Interval' parameter.

.EXAMPLE
  PS C:\> Remove-CharactersPerInterval  'b l a h b l a h' 

  blahblah



  Here we run the function against a given string and in return we get a new string where every other character has been removed (the default interval for removal is 2, but this can be changed with the '-Interval' parameter).

.NOTES
  Name:  .ps1
  Author:  Travis Logue
  Version History:  1.2 | 2022-01-11 | Updated documentation
  Dependencies:  
  Notes:
  - 

  .
#>
function Remove-CharactersPerInterval {
  [CmdletBinding()]
  param (
    [Parameter(HelpMessage='Reference the string you want to remove characters from. The first Character is always kept.')]
    [string]
    $String,
    [Parameter(HelpMessage='Enter the interval to skip. The default value is "2".')]
    [int]
    $Interval = 2
  )
  
  begin {}
  
  process {
    $i = 0
    $FinalWord = ''  
    while ($i -le $String.Length) {
      $FinalWord += $String[$i]
      $i += $Interval
    }
    Write-Output $FinalWord
  }
  
  end {}
}