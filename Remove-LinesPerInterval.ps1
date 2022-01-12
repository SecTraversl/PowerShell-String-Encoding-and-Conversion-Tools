<#
.SYNOPSIS
  The "Remove-LinesPerInterval" function takes a given array of string objects (preferably a mass of text such as a log where the contents have been split where each line is an individual string object) and will remove a line per the given interval.  The default interval is 2, thus removing every other line, but this can be changed with the '-Interval' parameter.

.EXAMPLE
  PS C:\> $test = @"                        
  >> Something on the first line
  >> 
  >> Some more words after an empty line
  >> 
  >> final and fifth line
  >> "@

  PS C:\> Remove-LinesPerInterval $test

  S
  PS C:\> Remove-LinesPerInterval $test.Split("`n")

  Something on the first line
  Some more words after an empty line
  final and fifth line



  Here we first initialize the "$test" variable by placing a single multi-line string object within it (using a here-string).  This function actually expects an array of string objects, so we end up splitting on a newline character, and demonstrate the default behavior of the function - which returns an array of string objects (each line is a separate string object) having removed every other object.

.NOTES
  Name:  Remove-LinesPerInterval.ps1
  Author:  Travis Logue
  Version History:  1.2 | 2022-01-11 | Updated documentation
  Dependencies:  
  Notes:
  - 

  .
#>
function Remove-LinesPerInterval {
  [CmdletBinding()]
  param (
    [Parameter(HelpMessage='Reference the Object you want to remove Lines from. The first Line is always kept.')]
    [psobject]
    $Array,
    [Parameter(HelpMessage='Enter the interval to skip. The default value is "2".')]
    [int]
    $Interval = 2
  )
  
  begin {}
  
  process {
    $i = 0
    $FinalArray = @()
    while ($i -le $Array.Count) {
      $FinalArray += $Array[$i]
      $i += $Interval
    }
    Write-Output $FinalArray
  }
  
  end {}
}