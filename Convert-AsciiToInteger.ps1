<#
.SYNOPSIS
  The "Convert-AsciiToInteger" function takes a single string object and converts each character to a 2-byte integer (Int16).

.EXAMPLE
  PS C:\> $string = @"
  >> PostalAccess1  UberL33tP@ssw0rd
  >> Supervisor  B@tchM@nw1lnvrG3tth1s!
  >> Administrator  !Kr@5hNbuRN?
  >> PostalAccess2  Buah!HA?ha!HAAAA!?!
  >> "@

  PS C:\> Convert-AsciiToInteger -String $string -Join
  80 111 115 116 97 108 65 99 99 101 115 115 49 32 32 85 98 101 114 76 51 51 116 80 64 115 115 119 48 114 100 10 83 117 112 101 114 118
  105 115 111 114 32 32 66 64 116 99 104 77 64 110 119 49 108 110 118 114 71 51 116 116 104 49 115 33 10 65 100 109 105 110 105 115 116
  114 97 116 111 114 32 32 33 75 114 64 53 104 78 98 117 82 78 63 10 80 111 115 116 97 108 65 99 99 101 115 115 50 32 32 66 117 97 104 3
  3 72 65 63 104 97 33 72 65 65 65 65 33 63 33

  PS C:\> Convert-AsciiToInteger -String $string | select -f 10
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



  Here we run the function by referencing a single string object that we placed into the $string variable.  In the first example, we use the '-Join' switch parameter which joins the output with a single space character (' ').  In the second example, we omit the '-Join' parameter and display the first 10 integers.

.NOTES
  Name:  Convert-AsciiToInteger.ps1
  Author:  Travis Logue
  Version History:  1.1 | 2022-01-06 | Initial Version
  Dependencies:  
  Notes:
  - We got the basic idea of the function below from here:  https://devblogs.microsoft.com/scripting/convert-hexadecimal-to-ascii-using-powershell/

  .
#>
function Convert-AsciiToInteger {
  [CmdletBinding()]
  param (
    [Parameter()]
    [string]
    $String, 
    [Parameter()]
    [switch]
    $Join
  )
  
  begin {}
  
  process {
    $Results = $String[0..($String.Length)] | % {[convert]::ToInt16($_)}
    if ($Join) {
      $Results -join ' '
    }
    else {
      Write-Output $Results
    }
  }
  
  end {}
}