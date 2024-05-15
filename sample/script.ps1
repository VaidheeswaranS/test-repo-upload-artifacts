$filePath = "C:\Program Files (x86)\MSBuild\14.0\Microsoft.Common.Targets\ImportAfter\test.targets.txt"
$oldContent = "line 2"
$newContent = "line changed"

$content = Get-Content -Path $filePath
$updatedContent = $content -replace [regex]::Escape($oldContent), $newContent

if ($content -ne $updatedContent) {
    $updatedContent | Set-Content -Path $filePath -Force
    Write-Host "Content replaced successfully."
} else {
    Write-Host "Old content not found in the file."
}
