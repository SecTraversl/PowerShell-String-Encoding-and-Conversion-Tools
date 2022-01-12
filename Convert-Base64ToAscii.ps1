<#
.SYNOPSIS
  The "Convert-Base64ToAscii" takes a given Base64 encoded string and converts it to an ASCII string.

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
  Name: Convert-Base64ToAscii.ps1
  Author: Travis Logue
  Version History: 1.3 | 2022-01-11 | Updated documentation
  Dependencies:
  Notes:
  - This was helpful:
    https://stackoverflow.com/questions/18726418/decoding-base64-with-powershell?rq=1

  - Good discussion on conversions of UTF-8, ASCII, Base64, and UTF-16/Unicode:
    https://stackoverflow.com/questions/15414678/how-to-decode-a-base64-string

  - A different forum used the example here. However, the Unicode didn't add spaces for my solution, so instead I used Unicode.GetString in the function
    Example:
      [System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($data))
    

  .
#>
function Convert-Base64ToAscii {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory = $true)]
    [string]
    $String
  )
  
  begin {}
  
  process {
    [System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($String))
  }
  
  end {}
}