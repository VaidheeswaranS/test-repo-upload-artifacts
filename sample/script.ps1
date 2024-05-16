# Create the necessady folder if not present
$folderPath = "C:\dev\Key"

# Check if the folder exists
if (-not (Test-Path -Path $folderPath)) {
    # Create the folder
    New-Item -Path $folderPath -ItemType Directory
    Write-Output "Folder 'Key' created at C:\dev"
} else {
    Write-Output "Folder 'Key' already exists at C:\dev"
}

# Make changes to the file mentioning the sage 200 private key path
$filePath = "C:\Program Files (x86)\MSBuild\14.0\Microsoft.Common.Targets\ImportAfter\Sage200.Signing.targets"
$oldContent = "<KeyFilePath>[ReplaceFileShareLocation]\Key\Sage200v2013PrivateKey.snk</KeyFilePath>"
$newContent = "<KeyFilePath>C:\Dev\Key\Sage200v2013PrivateKey.snk</KeyFilePath"

$content = Get-Content -Path $filePath
$updatedContent = $content -replace [regex]::Escape($oldContent), $newContent

if ($content -ne $updatedContent) {
    $updatedContent | Set-Content -Path $filePath -Force
    Write-Host "Content replaced successfully."
} else {
    Write-Host "Old content not found in the file."
}
