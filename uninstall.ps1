# Script de désinstallation RMA Assurance
# Exécutez ce script en tant qu'administrateur si nécessaire

Write-Host "=== Désinstallation de RMA Assurance ===" -ForegroundColor Cyan
Write-Host ""

# Chemins possibles où l'application peut être installée
$possiblePaths = @(
    "$env:LOCALAPPDATA\Programs\rma-assurance",
    "$env:ProgramFiles\RMA Assurance",
    "$env:ProgramFiles(x86)\RMA Assurance",
    "$env:APPDATA\RMA Assurance",
    "$env:LOCALAPPDATA\RMA Assurance"
)

# Chemins pour les raccourcis
$shortcutPaths = @(
    "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\RMA Assurance",
    "$env:PUBLIC\Desktop\RMA Assurance.lnk",
    "$env:USERPROFILE\Desktop\RMA Assurance.lnk"
)

$found = $false

# Supprimer les dossiers d'installation
Write-Host "Recherche et suppression des dossiers d'installation..." -ForegroundColor Yellow
foreach ($path in $possiblePaths) {
    if (Test-Path $path) {
        Write-Host "  Trouvé: $path" -ForegroundColor Green
        try {
            Remove-Item -Path $path -Recurse -Force -ErrorAction Stop
            Write-Host "  ✓ Supprimé: $path" -ForegroundColor Green
            $found = $true
        } catch {
            Write-Host "  ✗ Erreur lors de la suppression de $path : $_" -ForegroundColor Red
            Write-Host "  Essayez de supprimer manuellement ce dossier." -ForegroundColor Yellow
        }
    }
}

# Supprimer les raccourcis
Write-Host ""
Write-Host "Suppression des raccourcis..." -ForegroundColor Yellow
foreach ($shortcut in $shortcutPaths) {
    if (Test-Path $shortcut) {
        Write-Host "  Trouvé: $shortcut" -ForegroundColor Green
        try {
            Remove-Item -Path $shortcut -Recurse -Force -ErrorAction Stop
            Write-Host "  ✓ Supprimé: $shortcut" -ForegroundColor Green
            $found = $true
        } catch {
            Write-Host "  ✗ Erreur lors de la suppression de $shortcut : $_" -ForegroundColor Red
        }
    }
}

# Nettoyer le registre Windows (si l'application y est enregistrée)
Write-Host ""
Write-Host "Nettoyage du registre Windows..." -ForegroundColor Yellow
$registryPaths = @(
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*"
)

foreach ($regPath in $registryPaths) {
    try {
        $apps = Get-ItemProperty -Path $regPath -ErrorAction SilentlyContinue | Where-Object {
            $_.DisplayName -like "*RMA*" -or $_.DisplayName -like "*rma-assurance*"
        }
        
        foreach ($app in $apps) {
            if ($app.PSPath) {
                Write-Host "  Trouvé dans le registre: $($app.DisplayName)" -ForegroundColor Green
                try {
                    Remove-Item -Path $app.PSPath -Recurse -Force -ErrorAction Stop
                    Write-Host "  ✓ Entrée du registre supprimée" -ForegroundColor Green
                    $found = $true
                } catch {
                    Write-Host "  ✗ Erreur lors de la suppression du registre: $_" -ForegroundColor Red
                }
            }
        }
    } catch {
        # Ignorer les erreurs de registre
    }
}

Write-Host ""
if ($found) {
    Write-Host "=== Désinstallation terminée ===" -ForegroundColor Green
    Write-Host "L'application RMA Assurance a été supprimée." -ForegroundColor Green
} else {
    Write-Host "=== Aucune installation trouvée ===" -ForegroundColor Yellow
    Write-Host "L'application ne semble pas être installée dans les emplacements standards." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Si vous avez utilisé la version portable (win-unpacked), supprimez simplement le dossier:" -ForegroundColor Cyan
    Write-Host "  release\win-unpacked\" -ForegroundColor White
}

Write-Host ""
Write-Host "Appuyez sur une touche pour fermer..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

