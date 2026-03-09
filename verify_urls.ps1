$pages = Get-ChildItem "c:\Code\GitHub\wandel4daagseoldenzaal.nl\_pages\fotoboek\*.md" | Where-Object { $_.Name -ne "fotoboek.md" }
$allUrls = @()
foreach ($page in $pages) {
    $ms = Select-String -Path $page.FullName -Pattern 'href="(https://wandel4daagseoldenzaal\.blob\.core\.windows\.net/fotoboek/[^"]+)"' -AllMatches
    foreach ($m in $ms) {
        foreach ($g in $m.Matches) {
            $allUrls += [PSCustomObject]@{ File=$page.Name; Url=$g.Groups[1].Value }
        }
    }
}
Write-Host "Total URLs: $($allUrls.Count)"

$broken = @()
$i = 0
foreach ($u in $allUrls) {
    $i++
    if ($i % 500 -eq 0) { Write-Host "Checked $i / $($allUrls.Count)..." }
    try {
        $null = Invoke-WebRequest -Uri $u.Url -Method Head -UseBasicParsing -ErrorAction Stop
    } catch {
        $status = 0
        if ($_.Exception.Response) {
            $status = [int]$_.Exception.Response.StatusCode
        }
        $broken += [PSCustomObject]@{ File=$u.File; Url=$u.Url; Status=$status }
    }
}

Write-Host "`nTotal broken: $($broken.Count)"
if ($broken.Count -gt 0) {
    $broken | Format-Table -AutoSize -Wrap
}
