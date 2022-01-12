<#
.SYNOPSIS
  Short description
.EXAMPLE
  PS C:\> <example usage>
  Explanation of what the example does
.NOTES
  Name:  Convert-AsciiToBytes.ps1
  Author:  Travis Logue
  Version History:  1.1 | 2022-01-12 | Initial Version
  Dependencies:  
  Notes:
  - 

  .
#>
function Convert-AsciiToBytes {
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

    $AsciiToBytes = $String[0..($String.Length)] | % {[convert]::ToByte($_)}
    
    if ($Join) {
      $AsciiToBytes -join ' '
    }
    else {
      Write-Output $AsciiToBytes  
    }
    
  }
  
  end {}
}