<#
.SYNOPSIS
  The "Add-LineNumberToStringArray" function takes an array of string objects and prepends the 'count' number of that object.  This is particularly helpful when you have a log and you want to prepend the line number to each line in the message.

.EXAMPLE
  PS C:\> $hashtable = @{
  >>   LogName = 'Security'
  >>   ID = 4688
  >>   StartTime = (Get-Date).AddHours(-1)
  >>   EndTime = Get-Date
  >> }
  PS C:\> $Log = Get-fordawin -FilterHashtable $hashtable | Select-Object -First 1
  PS C:\> $Log | Measure-Object | Select-Object Count

  Count
  -----
      1


  PS C:\> $Message = $Log.Message.Split("`n")
  PS C:\> $Message | Measure-Object | Select-Object Count

  Count
  -----
    30


  PS C:\> Add-LineNumberToStringArray -String $Message | Select-Object -First 5
  1:      A new process has been created.
  2:
  3:      Creator Subject:
  4:              Security ID:            S-1-5-21-104866274-201234818-8745921783-34276
  5:              Account Name:           Jannus.Fugal
  PS C:\>
  PS C:\>
  PS C:\> $Message | AddLineNumber | Select-Object -First 5
  1:      A new process has been created.
  2:
  3:      Creator Subject:
  4:              Security ID:            S-1-5-21-104866274-201234818-8745921783-34276
  5:              Account Name:           Jannus.Fugal



  Here we demonstrate the process of retrieving an single event log that we are interested in and how we would go about separating the single multi-line string object by line (so that the $Message variable actually contains an array of string objects, each of which is a line from the event log message).  In the first example, we use the "Add-LineNumberToStringArray" function, reference the '$Message' variable, and select the first 5 objects.  In the second example we use the built-in alias of 'AddLineNumber' for the "Add-LineNumberToStringArray" function, along with the pipeline to achieve the same results as the first example.

.NOTES
  Name:  Add-LineNumberToStringArray.ps1
  Author:  Travis Logue
  Version History:  1.2 | 2022-01-09 | Added "UseZeroOffset"
  Dependencies:  
  Notes:
  - 

  .
#>
function Add-LineNumberToStringArray {
  [CmdletBinding()]
  [Alias('AddLineNumber')]
  param (
    [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
    [string[]]
    $String,
    [Parameter()]
    [switch]
    $UseZeroOffset
  )
  
  begin {}
  
  process {
    $array += @($String)
  }
  
  end {
    
    if ($UseZeroOffset) {
      $LineCount = ($array | Measure-Object).Count
      0..($LineCount - 1) | % {"$_" + ":`t" + $array[$_]}      
    }
    else {
      $LineCount = ($array | Measure-Object).Count
      1..$LineCount | % {"$_" + ":`t" + $array[$_ - 1]}      
    }

  }
}