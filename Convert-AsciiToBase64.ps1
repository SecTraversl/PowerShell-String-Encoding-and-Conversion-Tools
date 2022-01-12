<#
.SYNOPSIS
  The "Convert-AsciiToBase64" function takes a single string object and converts it to a Base64 encoded string.

.EXAMPLE
  PS C:\> $test
  blah blah
  PS C:\> Convert-AsciiToBase64 $test
  YmxhaCBibGFo
  PS C:\>
  PS C:\> Convert-Base64ToAscii 'YmxhaCBibGFo'
  blah blah



  Here we demonstrate how we can take a single string object of 'blah blah' and convert it to Base64 with the "Convert-AsciiToBase64" function, and then convert it back with the "Convert-Base64ToAscii" function.

.NOTES
  Name:  Convert-AsciiToBase64.ps1
  Author:  Travis Logue
  Version History:  1.1 | 2022-01-06 | Initial Version
  Dependencies:  
  Notes:
  - This was helpful:  https://devblogs.microsoft.com/scripting/convert-hexadecimal-to-ascii-using-powershell/


  .
#>
function Convert-AsciiToBase64 {
  [CmdletBinding()]
  param (
    [Parameter()]
    [string]
    $String
  )
  
  begin {}
  
  process {
    $AsciiToInt = $String[0..($String.Length)] | % {[convert]::ToInt16($_)}
    $IntToBase64 = [convert]::ToBase64String($AsciiToInt)

    Write-Output $IntToBase64

  }
  
  end {}
}