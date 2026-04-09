$RealPF = [System.Environment]::GetEnvironmentVariable("ProgramW6432")
if (-not $RealPF) { $RealPF = $env:ProgramFiles }

$ChromePath = Join-Path $RealPF "Google\Chrome\Application"
$ChromeExe = Join-Path $ChromePath "chrome.exe"

# PRE-CONDITION (State Check)
if (Test-Path $ChromeExe) {
    Write-Output "Found chrome-binary '$ChromeExe'"
}
elseif (-not (Test-Path $ChromeExe)) {
    # Salt will see this string in the 'comment' or 'stdout' field
    Write-Output "State: Already Absent"
    exit 100
}

# EXECUTION
$VDir = Get-ChildItem -Path $ChromePath | Where-Object { $_.Name -match '^\d' } | Select-Object -First 1
if ($VDir) {
    $VerPath = Join-Path -Path $ChromePath -ChildPath $VDir.Name
    $Setup = Join-Path -Path $VerPath -ChildPath "Installer\setup.exe"
    
    if ( Test-Path $Setup ) {
        Write-Output "Found uninstaller (setup utility) at '$Setup'"
        Write-Output "Uninstalling version $( $VDir.Name )..."
        $Proc = Start-Process "$Setup" -ArgumentList '--uninstall --multi-install --chrome --system-level --force-uninstall' -Wait -PassThru
        $Proc.WaitForExit()
        
        # FINAL VERIFICATION
        if ( -not ( Test-Path $ChromeExe ) ) {
            Write-Output "State: Success"
            exit 0
        } else {
            Write-Error "State: Failed to remove binary"
            exit 1
        }
    }
}

exit 100
