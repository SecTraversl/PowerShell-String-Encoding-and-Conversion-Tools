<#
.SYNOPSIS
  The "Convert-IntegerToHex" function takes an integer (int16) or an array of integers and converts the integer to its corresponding Hexadecimal string representation (if there is one). 

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

  PS C:\> Convert-IntegerToHex -Integer $AsciiToInt -Join
  50 6f 73 74 61 6c 41 63 63 65 73 73 31 20 20 55 62 65 72 4c 33 33 74 50 40 73 73 77 30 72 64 0a 53 75 70 65 72 76 69 73 6f 72 20 20 42
  40 74 63 68 4d 40 6e 77 31 6c 6e 76 72 47 33 74 74 68 31 73 21 0a 41 64 6d 69 6e 69 73 74 72 61 74 6f 72 20 20 21 4b 72 40 35 68 4e 6
  2 75 52 4e 3f 0a 50 6f 73 74 61 6c 41 63 63 65 73 73 32 20 20 42 75 61 68 21 48 41 3f 68 61 21 48 41 41 41 41 21 3f 21

  PS C:\> Convert-IntegerToHex -Integer $AsciiToInt -Join -OutputWithHexNotation
  0x50 0x6f 0x73 0x74 0x61 0x6c 0x41 0x63 0x63 0x65 0x73 0x73 0x31 0x20 0x20 0x55 0x62 0x65 0x72 0x4c 0x33 0x33 0x74 0x50 0x40 0x73 0x73
  0x77 0x30 0x72 0x64 0x0a 0x53 0x75 0x70 0x65 0x72 0x76 0x69 0x73 0x6f 0x72 0x20 0x20 0x42 0x40 0x74 0x63 0x68 0x4d 0x40 0x6e 0x77 0x3
  1 0x6c 0x6e 0x76 0x72 0x47 0x33 0x74 0x74 0x68 0x31 0x73 0x21 0x0a 0x41 0x64 0x6d 0x69 0x6e 0x69 0x73 0x74 0x72 0x61 0x74 0x6f 0x72 0x
  20 0x20 0x21 0x4b 0x72 0x40 0x35 0x68 0x4e 0x62 0x75 0x52 0x4e 0x3f 0x0a 0x50 0x6f 0x73 0x74 0x61 0x6c 0x41 0x63 0x63 0x65 0x73 0x73 0
  x32 0x20 0x20 0x42 0x75 0x61 0x68 0x21 0x48 0x41 0x3f 0x68 0x61 0x21 0x48 0x41 0x41 0x41 0x41 0x21 0x3f 0x21

  PS C:\> Convert-IntegerToHex -Integer $AsciiToInt | select -f 10
  50
  6f
  73
  74
  61
  6c
  41
  63
  63
  65




  Here we first initialize the $string variable with a single multi-line string object.  We then convert each character in the string into its respective integer value with the "Convert-AsciiToInteger" function, and we assign those values to the $AsciiToInt variable.  Then in the first example, we use the "Convert-IntegerToHex" function to convert the integer values into their corresponding Hexadecimal string notation, and we use the '-Join' switch parameter to unite the output into a single string object (separating each Hex byte with a space).  In the second example, we do the same as we did in the first example, while adding the '-OutputWithHexNotation' switch parameter which prepends the '0x' Hex notation to each Hex byte.  In the final example, we omit both the '-Join' and '-OutputWithHexNotation' parameters and display the first 10 results.

.NOTES
  Name:  Convert-IntegerToHex.ps1
  Author:  Travis Logue
  Version History:  1.1 | 2022-01-07 | Initial Version
  Dependencies:  
  Notes:
  - We got the basic idea of the function below from here:  https://devblogs.microsoft.com/scripting/convert-hexadecimal-to-ascii-using-powershell/
  - Good idea for the .PadLeft(2, '0') was retrieved from here:  https://devblogs.microsoft.com/scripting/hey-scripting-guy-how-can-i-use-leading-zeroes-when-displaying-a-value-in-windows-powershell/

  .
#>
function Convert-IntegerToHex {
  [CmdletBinding()]
  param (
    [Parameter()]
    [int16[]]
    $Integer, 
    [Parameter()]
    [switch]
    $Join,
    [Parameter()]
    [switch]
    $OutputWithHexNotation
  )
  
  begin {}
  
  process {

    if ($OutputWithHexNotation) {
      $IntToHex = $Integer | % { '0x' + ( [convert]::ToString($_, 16).PadLeft(2, '0') ) } #  We needed to add the .PadLeft because we noticed without this, if hex had a leading '0' it was being dropped
    }
    else {
      $IntToHex = $Integer | % { [convert]::ToString($_, 16).PadLeft(2, '0') } #  We needed to add the .PadLeft because we noticed without this, if hex had a leading '0' it was being dropped
    }

    $Results = $IntToHex

    if ($Join) {
      $Results -join ' '
    }
    else {
      Write-Output $Results
    }

  }
  
  end {}
}