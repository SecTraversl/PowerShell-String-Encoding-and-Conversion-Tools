<#
.SYNOPSIS
  The "Convert-IntegerToAscii" function takes an integer (int16) or an array of integers and converts the integer to its corresponding ASCII character (if there is one). 

.EXAMPLE
  PS C:\> $string = @"
  >> PostalAccess1  UberL33tP@ssw0rd
  >> Supervisor  B@tchM@nw1lnvrG3tth1s!
  >> Administrator  !Kr@5hNbuRN?
  >> PostalAccess2  Buah!HA?ha!HAAAA!?!
  >> "@

  PS C:\> $AsciiToInt = Convert-AsciiToInteger -String $string
  PS C:\> $AsciiToInt | select -f 10
  80
  111
  115
  116
  97
  108
  65
  99
  99
  101

  PS C:\> Convert-IntegerToAscii -Integer $AsciiToInt -Join
  PostalAccess1  UberL33tP@ssw0rd
  Supervisor  B@tchM@nw1lnvrG3tth1s!
  Administrator  !Kr@5hNbuRN?
  PostalAccess2  Buah!HA?ha!HAAAA!?!

  PS C:\> Convert-IntegerToAscii -Integer $AsciiToInt  | select -f 10
  P
  o
  s
  t
  a
  l
  A
  c
  c
  e



  Here we first create a single multi-line string object, then transform each of the characters in the string to an integer with "Convert-AsciiToInteger" and save that to a variable called $AsciiToInt.  We then, in the first example, use the "Convert-IntegerToAscii" function along with the '-Join' switch parameter to convert each of those integers back to an ASCII character, and have the array of converted characters joined together into a single string object (which is what the -Join switch parameter specifies).  In the second example we omit the "-Join" switch parameter and select the first 10 string objects (where each string object is a single character).

.NOTES
  Name:  Convert-IntegerToAscii.ps1
  Author:  Travis Logue
  Version History:  1.1 | 2022-01-07 | Initial Version
  Dependencies:  
  Notes:
  - We got the basic idea of the function below from here:  https://devblogs.microsoft.com/scripting/convert-hexadecimal-to-ascii-using-powershell/


  .
#>
function Convert-IntegerToAscii {
  [CmdletBinding()]
  param (
    [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
    [int16[]]
    $Integer,
    [Parameter()]
    [switch]
    $Join
  )
  
  begin {}
  
  process {
    $array += @($Integer)
  }
  
  end {
    if ($Join) {
      ( $array | % {[char][convert]::ToInt16($_)} ) -join ''
    }
    else {
      ( $array | % {[char][convert]::ToInt16($_)} )
    }
  }
}