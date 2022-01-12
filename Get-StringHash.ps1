<#
.SYNOPSIS
  The "Get-StringHash" function takes a given string and hashes it with MD5 by default, or by the algorithm specified with the '-Algorithm' parameter.

.EXAMPLE
  PS C:\> StringHash 'blah'
  6f1ed002ab5595859014ebf0951522d9


  Here we run the function by using its built-in alias of 'StringHash'.  In return we get the MD5 hash of the string.  To change the hash algorithm use the '-Algorithm' parameter.
  
.NOTES
  Name:  Get-StringHash.ps1
  Author:  Modified by Travis Logue
  Version History:  1.2 | 2022-01-11 | Updated documentation
  Dependencies:  
  Notes:
  - Code retrieved from:  https://gallery.technet.microsoft.com/scriptcenter/Get-StringHash-aa843f71

  .
#>
function Get-StringHash {
  [CmdletBinding()]
  [Alias('StringHash')]
  param (
    [Parameter(Mandatory)]
    [string]
    $String,
    [Parameter()]
    [ValidateSet("MD5", "RIPEMD160", "SHA1", "SHA256", "SHA384", "SHA512")]
    [string]
    $Algorithm = "MD5"
  )
  
  begin {}
  
  process {
    $StringBuilder = New-Object -TypeName System.Text.StringBuilder
    [System.Security.Cryptography.HashAlgorithm]::Create($Algorithm).ComputeHash([System.Text.Encoding]::UTF8.GetBytes($String)) | % {
      [void]$StringBuilder.Append($_.ToString('x2'))
    }
    $StringBuilder.ToString()
  }
  
  end {}
}