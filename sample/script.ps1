$command = {
                      param (
                          [string]$filePath,
                          [string]$oldLineContent,
                          [string]$newLineContent
                      )

                      Write-Output "Reading file: $filePath"
                      $lines = Get-Content -Path $filePath
              
                      Write-Output "Replacing content..."
                      $updatedLines = $lines -replace [regex]::Escape($oldLineContent), $newLineContent
              
                      Write-Output "Writing updated content to file..."
                      Set-Content -Path $filePath -Value $updatedLines
              
                      Write-Output "File update complete."
                  }

                  $filePath = "C:\\path\\to\\your\\file.txt"
                  $oldLineContent = "line 2"
                  $newLineContent = "line changed"

                  Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `$command -filePath '$filePath' -oldLineContent '$oldLineContent' -newLineContent '$newLineContent'" -Verb RunAs
