<#
.SYNOPSIS
  The "Convert-HexToAscii" function takes a Hexadecimal string (or an array of them) and converts it into its corresponding Ascii value (if there is one). 

.EXAMPLE
  PS C:\> $Hex | select -f 15
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
  73
  73
  31
  20
  20
  PS C:\> Convert-HexToAscii -HexString $Hex | select -f 15
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
  s
  s
  1


  PS C:\> Convert-HexToAscii -HexString $Hex -Join | select -f 15
  PostalAccess1  UberL33tP@ssw0rd
  Supervisor  B@tchM@nw1lnvrG3tth1s!
  Administrator  !Kr@5hNbuRN?
  PostalAccess2  Buah!HA?ha!HAAAA!?!
  PS C:\> Convert-HexToAscii -HexString $Hex -Join
  PostalAccess1  UberL33tP@ssw0rd
  Supervisor  B@tchM@nw1lnvrG3tth1s!
  Administrator  !Kr@5hNbuRN?
  PostalAccess2  Buah!HA?ha!HAAAA!?!



  Here we have an array of hex byte strings in the $Hex variable.  In the first example, we use the "Convert-HexToAscii" function to convert each hex byte string into its corresponding ASCII value.  In the second example, we do the same conversion, but we specify the '-Join' switch parameter which joins the characters into a single string object (as opposed to an array of string objects which are one character long, without using the '-Join' parameter).

.EXAMPLE
  PS C:\> $HexBytesWithHexNotation | select -f 15
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
  0x73
  0x73
  0x31
  0x20
  0x20
  PS C:\> Convert-HexToAscii -HexString $HexBytesWithHexNotation -RemoveHexNotation | select -f 15
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
  s
  s
  1


  PS C:\> Convert-HexToAscii -HexString $HexBytesWithHexNotation -RemoveHexNotation -Join
  PostalAccess1  UberL33tP@ssw0rd
  Supervisor  B@tchM@nw1lnvrG3tth1s!
  Administrator  !Kr@5hNbuRN?
  PostalAccess2  Buah!HA?ha!HAAAA!?!



  Here we have an array of hex byte strings in the $HexBytesWithHexNotation variable, as we did in the previous example, but these all have "hex notation" prepended to each hex byte.  First, we use the "Convert-HexToAscii" function along with the '-RemoveHexNotation' switch parameter (which will "trim" off the leading '0x' characters) and we select the first 15 converted objects.  Second, we use the function with both the '-RemoveHexNotation' and '-Join' switch parameters and the whole array of Hex strings is converted and joined together as a single string object.

.NOTES
  Name:  Convert-HexToAscii.ps1
  Author:  Travis Logue
  Version History:  1.1 | 2022-01-07 | Initial Version
  Dependencies:  
  Notes:
  - We got the basic idea of the function below from here:  https://devblogs.microsoft.com/scripting/convert-hexadecimal-to-ascii-using-powershell/


  .
#>
function Convert-HexToAscii {
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
      $HexToInt = $array | % { [char][convert]::ToInt16( $_.TrimStart('0x'), 16) }
    }
    else {
      $HexToInt = $array | % { [char][convert]::ToInt16($_, 16) }
    }

    if ($Join) {
      $HexToInt -join ''
    }
    else {
      Write-Output $HexToInt
    }

  }
}