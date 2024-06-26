<#
get-torrentarchives.psm1
Version: 0.0.2
Author: Peter Soule
Date: 19-05-2024
Source: https://github.com/bigpete-za/torrent-mgr/
#>

# Define a function named get-torrentArchives
function get-torrentArchives {
    <#
    .SYNOPSIS
    Script to auto extract archives from torrents.
    .DESCRIPTION
    This script extracts archives from torrents using 7-Zip. 
    It takes a source path containing .rar or .zip files, extracts them to a specified destination, and logs the actions taken.
    .PARAMETER SourcePath
    SourcePath: The path to the directory containing the .rar or .zip files to extract.
    .PARAMETER ExtractionDestination
    ExtractionDestination: The path to the directory where the extracted files will be saved.
    .PARAMETER DryRun
    DryRun: A switch parameter that, when present, will cause the script to log the actions it would take without actually performing them.
    .EXAMPLE
    get-torrentArchives -SourcePath "C:\Downloads" -ExtractionDestination "C:\ExtractedFiles"
    .INPUTS
    SourcePath: The path to the directory containing the .rar or .zip files to extract.
    .OUTPUTS
    ExtractionDestination: The path to the directory where the extracted files will be saved.
    #>
    [CmdletBinding()]
    param (
        # SourcePath is a mandatory parameter. It must be a valid directory path.
        [Parameter(Mandatory=$true)]
        [ValidateScript({Test-Path $_ -PathType 'Container'})]
        [string]$SourcePath,

        # ExtractionDestination is a mandatory parameter. It's the path where files will be extracted.
        [Parameter(Mandatory=$true)]
        [string]$ExtractionDestination,

        # DryRun is an optional switch. Defaults to false; the function will only log the actions it would take without actually performing them.
        [Parameter(Mandatory=$false)]
        [switch]$DryRun = $false
    )
    # Get absolute path of source
    $SourcePath = Resolve-Path $SourcePath
    $archives = Get-ChildItem -Path $SourcePath -Recurse -Include "*.rar", "*.zip" -File
    $extension = [IO.Path]::GetExtension($archives)
    # Get absolute path of dest
    $ExtractionDestination = Resolve-Path $ExtractionDestination

    # Start a try block to catch any errors that occur during the execution of the script
    try {
        # Define the path of the log file
        $LogPath = Join-Path -Path $ExtractionDestination -ChildPath 'extract.log'
        # Get the current date and time
        $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

        # Define a log message
        $LogMessage = "[$Timestamp] Extracting archives from $SourcePath"

        # Add the log message to the log file
        Add-Content -Path $LogPath -Value $LogMessage

        # If the extension is .rar
    if ($extension -eq ".rar") {
        # Define a command to extract the .rar files
        $Command = { & '7z' x "`"$archives`"" -aoa -o"`"$ExtractionDestination`"" }

        # If DryRun is true, log the command without executing it
        if ($DryRun) {
            Write-Output "Would run: $Command"
        } else {
            # Otherwise, execute the command
            Invoke-Command -ScriptBlock $Command
        }
    } 
    # If the extension is .zip
    elseif ($extension -eq ".zip"){
        # Define a command to extract the .zip files
        $Command = { & '7z' x "`"$archives`"" -aoa -o"`"$ExtractionDestination`"" }

        # If DryRun is true, log the command without executing it
        if ($DryRun) {
            Write-Output "Would run: $Command"
        } else {
            # Otherwise, execute the command
            Invoke-Command -ScriptBlock $Command
        }
    }
    else {
            # If the extension is not .rar or .zip, log an error message
            $ErrorMessage = "Unsupported file extension: $extension"

            # Log the error message for debugging
            Write-Debug $ErrorMessage

            # Add the error message to the log file
            Add-Content -Path $LogPath -Value $ErrorMessage
        }
    }
    # If any errors occur during the execution of the script
    catch {
        # Define an error message
        $ErrorMessage = "Couldn't extract $SourcePath. Error: $_"

        # Log the error message for debugging
        Write-Debug $ErrorMessage

        # Add the error message to the log file
        Add-Content -Path $LogPath -Value $ErrorMessage
    }
}

# Export the get-torrentArchives function from the module
Export-ModuleMember -Function get-torrentArchives