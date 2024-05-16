$filePath = "C:\Program Files (x86)\MSBuild\14.0\Microsoft.Common.Targets\ImportAfter\Sage200.Signing.targets"
$oldContent = "<KeyFilePath>[ReplaceFileShareLocation]\Key\Sage200v2013PrivateKey.snk</KeyFilePath>"
$newContent = "C:\Dev\Key\Sage200v2013PrivateKey.snk</KeyFilePath"

$content = Get-Content -Path $filePath
$updatedContent = $content -replace [regex]::Escape($oldContent), $newContent

if ($content -ne $updatedContent) {
    $updatedContent | Set-Content -Path $filePath -Force
    Write-Host "Content replaced successfully."
} else {
    Write-Host "Old content not found in the file."
}
