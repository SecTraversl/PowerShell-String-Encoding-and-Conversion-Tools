<#
.SYNOPSIS
  The "Get-CharacterCount" function takes a given string and a character (or a group of adjacent characters) in order to return the number of times the character occurs within the string.
  
.EXAMPLE
  PS C:\> $blah = 'blahblahblahs'
  PS C:\> Get-CharacterCount -String $blah -Character b
  3

  PS C:\> CharCount $blah 'blah'
  3

  PS C:\> CharCount $blah blahs
  1

  PS C:\> Get-CharacterCount -String $blah -Character hb
  2



  Here we run the function a few different ways, using both the full function name and the function alias of "CharCount". In each example above, the number of occurrences for the given character or set of adjacent characters is returned.

.NOTES
  Name: Get-CharacterCount.ps1
  Author: Travis Logue
  Version History: 1.2 | 2022-01-11 | Refactored
  Dependencies:  
  Notes:
  - This was helpful:  https://powerusers.microsoft.com/t5/Building-Flows/How-to-count-of-occurrences-of-a-character-inside-a-string-in/m-p/382952#M43253


  .
#>
function Get-CharacterCount {
  [CmdletBinding()]
  [Alias('CharCount')]
  param (
    [Parameter(Mandatory, HelpMessage='Reference the string that you want to evaluate.')]
    [string]
    $String,
    [Parameter(Mandatory, HelpMessage='Reference the character or group of adjacent characters for which to get a count.')]
    [string]
    $Character
  )
  
  begin {}
  
  process {
    $String.Split($Character).Count - 1
  }
  
  end {}
}