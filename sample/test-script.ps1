$LocalTestDir="C:\var\test"
if (Test-Path $LocalTestDir -PathType Container) {
  Write-Host "$LocalTestDir exists"
}
else {
  New-Item $LocalTestDir -ItemType Directory
}
Set-Content "$LocalTestDir\test.txt" 'Hello World'
Get-Content "$LocalTestDir\test.txt"

[System.IO.Directory]::GetAccessControl("\\.\pipe\docker_engine") | Format-Table
