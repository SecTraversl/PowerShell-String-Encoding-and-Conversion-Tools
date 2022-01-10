<#
.SYNOPSIS
  The "Convert-HexToInteger" function takes a Hexadecimal string (or an array of them) and converts it into its corresponding integer (int16) value. 

.EXAMPLE
  PS C:\> $Hex | select -f 10
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

  PS C:\> Convert-HexToInteger -HexString $Hex | select -f 10
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

  PS C:\> Convert-HexToInteger -HexString $Hex | select -f 15 | Convert-IntegerToAscii -Join
  PostalAccess1



  Here we have an array of hex byte strings in the $Hex variable.  First, we use the "Convert-HexToInteger" function to convert each hex byte string into its corresponding integer (int16) value, and display the first 10.  Second, we do the same conversion, select the first 15, and pipe that into the "Convert-IntegerToAscii" function to view the corresponding ASCII characters.

.EXAMPLE
  PS C:\> $HexBytesWithHexNotation | select -f 10
  0x50
  0x6f
  0x73
  0x74
  0x61
  0x6c
  0x41
  0x63
  0x63
  0x65

  PS C:\> Convert-HexToInteger -HexString $HexBytesWithHexNotation -RemoveHexNotation | select -f 10
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

  PS C:\> Convert-HexToInteger -HexString $HexBytesWithHexNotation -RemoveHexNotation | select -f 15 | Convert-IntegerToAscii -Join
  PostalAccess1



  Here we have an array of hex byte strings in the $HexBytesWithHexNotation variable, as we did in the previous example, but these all have "hex notation" prepended to each hex byte.  We first use the "Convert-HexToInteger" function along with the '-RemoveHexNotation' switch parameter (which will "trim" off the leading '0x' characters) and the function converts each hex byte string into its corresponding integer (int16) value.  Second, we do the same conversion, select the first 15, and pipe that into the "Convert-IntegerToAscii" function to view the corresponding ASCII characters.

.NOTES
  Name:  Convert-HexToInteger.ps1
  Author:  Travis Logue
  Version History:  1.1 | 2022-01-07 | Initial Version
  Dependencies:  
  Notes:
  - We got the basic idea of the function below from here:  https://devblogs.microsoft.com/scripting/convert-hexadecimal-to-ascii-using-powershell/


  .
#>
function Convert-HexToInteger {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
    [string[]]
    $HexString,
    [Parameter()]
    [switch]
    $Join,
    [Parameter()]
    [switch]
    $RemoveHexNotation
  )
  
  begin {}
  
  process {

    $array = @( $HexString )

  }
  
  end {

    if ($RemoveHexNotationFromInput) {
      $HexToInt = $array | % { [convert]::ToInt16( $_.TrimStart('0x'), 16) }
    }
    else {
      $HexToInt = $array | % { [convert]::ToInt16($_, 16) }
    }

    if ($Join) {
      $HexToInt -join ' '
    }
    else {
      Write-Output $HexToInt
    }

  }
}