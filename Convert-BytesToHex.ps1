<#
.SYNOPSIS
  The "Convert-BytesToHex" function takes a byte object or an array of byte objects and converts each byte to its corresponding hexadecimal string representation.

.EXAMPLE
  PS C:\> $string = 'blah blah'
  PS C:\> $ByteArray = Convert-AsciiToBytes $string
  PS C:\> $ByteArray | Get-Member | Select-Object -Property TypeName

  TypeName
  --------
  System.Byte
  System.Byte
  System.Byte
  System.Byte
  System.Byte
  System.Byte
  System.Byte
  System.Byte
  System.Byte
  System.Byte
  System.Byte
  System.Byte
  System.Byte
  System.Byte
  System.Byte
  System.Byte
  System.Byte
  System.Byte
  System.Byte
  System.Byte
  System.Byte


  PS C:\> Convert-BytesToHex $ByteArray
  62-6C-61-68-20-62-6C-61-68



  Here we have a string of 'blah blah' initialized into the variable $string.  We run the "Convert-AsciiToBytes" function against the string object and in return each character of the string object is turned into a 'byte object' (which we confirm with the "Get-Member" cmdlet).  We then run the "Convert-BytesToHex" function which converts each byte in the byte array into its hexadecimal string form (each hex byte being delimited by a hyphen '-').

.NOTES
  Name: Convert-BytesToHex.ps1
  Author: Travis Logue
  Version History: 1.3 | 2022-01-12 | Updated documentation
  Dependencies:
  Notes:
    

  .
#>
function Convert-BytesToHex {
  [CmdletBinding()]
  param (
    [Parameter(HelpMessage = 'Reference the System Byte Array you want to convert to a Hexadecimal string representation.')]
    [System.Byte[]]
    $Bytes
  )
  
  begin {}
  
  process {
    $HexString = [BitConverter]::ToString($Bytes)
    Write-Output $HexString
  }
  
  end {}
}








