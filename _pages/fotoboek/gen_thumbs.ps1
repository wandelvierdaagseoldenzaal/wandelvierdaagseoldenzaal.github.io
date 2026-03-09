$ErrorActionPreference = 'Stop'

$oneDriveBase = 'C:\Users\koenz\OneDrive\Wandel4Daagse Oldenzaal\Fotoboek'
$thumbnailBase = 'c:\Code\GitHub\wandel4daagseoldenzaal.nl\assets\photobook'

# All 186 video files: broken path => actual local filename
$videos = @(
    @{ Rel='2012/20120525_202005'; Ext='mp4' },
    @{ Rel='2023/dinsdag/VID_20230530_173512'; Ext='mp4' },
    @{ Rel='2023/dinsdag/VID_20230530_185148'; Ext='mp4' },
    @{ Rel='2023/dinsdag/VID_20230530_185216205'; Ext='mp4' },
    @{ Rel='2023/dinsdag/VID_20230530_185605'; Ext='mp4' },
    @{ Rel='2023/dinsdag/VID_20230530_190427'; Ext='mp4' },
    @{ Rel='2023/dinsdag/VID_20230530_193331'; Ext='mp4' },
    @{ Rel='2023/donderdag/Dagcompilatie'; Ext='mp4' },
    @{ Rel='2023/donderdag/VID_20230601_175655'; Ext='mp4' },
    @{ Rel='2023/donderdag/VID_20230601_175721'; Ext='mp4' },
    @{ Rel='2023/donderdag/VID_20230601_180650251'; Ext='mp4' },
    @{ Rel='2023/donderdag/VID_20230601_180742'; Ext='mp4' },
    @{ Rel='2023/donderdag/VID_20230601_181733'; Ext='mp4' },
    @{ Rel='2023/donderdag/VID_20230601_182104'; Ext='mp4' },
    @{ Rel='2023/donderdag/VID_20230601_182354'; Ext='mp4' },
    @{ Rel='2023/donderdag/VID_20230601_182517'; Ext='mp4' },
    @{ Rel='2023/donderdag/VID_20230601_182820'; Ext='mp4' },
    @{ Rel='2023/donderdag/VID_20230601_184327'; Ext='mp4' },
    @{ Rel='2023/donderdag/VID_20230601_184557'; Ext='mp4' },
    @{ Rel='2023/donderdag/VID_20230601_193026'; Ext='mp4' },
    @{ Rel='2023/donderdag/VID_20230601_193033'; Ext='mp4' },
    @{ Rel='2023/donderdag/VID_20230601_193118'; Ext='mp4' },
    @{ Rel='2023/donderdag/VID_20230601_193548'; Ext='mp4' },
    @{ Rel='2023/donderdag/VID_20230601_193753'; Ext='mp4' },
    @{ Rel='2023/donderdag/VID_20230601_193915'; Ext='mp4' },
    @{ Rel='2023/donderdag/VID_20230601_200932'; Ext='mp4' },
    @{ Rel='2023/donderdag/VID_20230601_201222'; Ext='mp4' },
    @{ Rel='2023/donderdag/VID_20230601_201532'; Ext='mp4' },
    @{ Rel='2023/vrijdag/Dagcompilatie'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_171751'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_171851'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_172142'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_175502'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_175823'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_175846'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_175911'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_175936'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_175944'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_175954'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_181535'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_181720'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_181759'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_181819'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_181851'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_181904'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_181952'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_182357'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_183159'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_183825'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_190505'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_190654'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_191147'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_191303'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_193508'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_194422'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_194623'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_194648'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_194935'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_195218'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_195746'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_200300'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_200930'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_201240'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_201312'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_201440'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_201528'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_201622'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_201708'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_201924'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_201952'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_202057'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_202118'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_202136'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_202537'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_202758'; Ext='mp4' },
    @{ Rel='2023/vrijdag/VID_20230602_202903'; Ext='mp4' },
    @{ Rel='2023/woensdag/Dagcompilatie'; Ext='mp4' },
    @{ Rel='2023/woensdag/VID_20230531_171510'; Ext='mp4' },
    @{ Rel='2023/woensdag/VID_20230531_172110'; Ext='mp4' },
    @{ Rel='2023/woensdag/VID_20230531_191549'; Ext='mp4' },
    @{ Rel='2023/woensdag/VID_20230531_191609'; Ext='mp4' },
    @{ Rel='2023/woensdag/VID_20230531_191620'; Ext='mp4' },
    @{ Rel='2023/woensdag/VID_20230531_191930'; Ext='mp4' },
    @{ Rel='2023/woensdag/VID_20230531_192054'; Ext='mp4' },
    @{ Rel='2023/woensdag/VID_20230531_192152'; Ext='mp4' },
    @{ Rel='2023/woensdag/VID_20230531_192236'; Ext='mp4' },
    @{ Rel='2023/woensdag/VID_20230531_192312'; Ext='mp4' },
    @{ Rel='2023/woensdag/VID_20230531_192325'; Ext='mp4' },
    @{ Rel='2023/woensdag/VID_20230531_192528'; Ext='mp4' },
    @{ Rel='2023/woensdag/VID_20230531_193529'; Ext='mp4' },
    @{ Rel='2023/woensdag/VID_20230531_193605'; Ext='mp4' },
    @{ Rel='2023/woensdag/VID_20230531_194058'; Ext='mp4' },
    @{ Rel='2023/woensdag/VID_20230531_194444054'; Ext='mp4' },
    @{ Rel='2023/woensdag/VID_20230531_195430194'; Ext='mp4' },
    @{ Rel='2023/woensdag/VID_20230531_195521'; Ext='mp4' },
    @{ Rel='2023/woensdag/VID_20230531_195610'; Ext='mp4' },
    @{ Rel='2023/woensdag/VID_20230531_200031'; Ext='mp4' },
    @{ Rel='2023/woensdag/VID_20230531_200253'; Ext='mp4' },
    @{ Rel='2023/woensdag/VID_20230531_200414346'; Ext='mp4' },
    @{ Rel='2023/woensdag/VID_20230531_201508'; Ext='mp4' },
    @{ Rel='2023/woensdag/VID_20230531_202112'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_174313'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_174438066'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_174513038'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_181300'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_181334'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_185401'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_185531'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_190245'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_190719898'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_191440'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_191554'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_191707'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_191831855'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_191848'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_191911'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_192245'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_192327'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_192428'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_192453'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_192530'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_192736'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_192812'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_192902'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_193036'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_193135'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_193617'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_193833'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_194310'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_194337462'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_194626'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_195028'; Ext='mp4' },
    @{ Rel='2024/dinsdag/VID_20240521_195503'; Ext='mp4' },
    @{ Rel='2024/donderdag/VID_20240523_175820'; Ext='mp4' },
    @{ Rel='2024/donderdag/VID_20240523_180755'; Ext='mp4' },
    @{ Rel='2024/donderdag/VID_20240523_184428'; Ext='mp4' },
    @{ Rel='2024/donderdag/VID_20240523_184528'; Ext='mp4' },
    @{ Rel='2024/donderdag/VID_20240523_192612'; Ext='mp4' },
    @{ Rel='2024/vrijdag/VID_20240524_175335644'; Ext='mp4' },
    @{ Rel='2024/vrijdag/VID_20240524_180455'; Ext='mp4' },
    @{ Rel='2024/vrijdag/VID_20240524_181205'; Ext='mp4' },
    @{ Rel='2024/vrijdag/VID_20240524_182035'; Ext='mp4' },
    @{ Rel='2024/vrijdag/VID_20240524_183941'; Ext='mp4' },
    @{ Rel='2024/vrijdag/VID_20240524_184136'; Ext='mp4' },
    @{ Rel='2024/vrijdag/VID_20240524_184403'; Ext='mp4' },
    @{ Rel='2024/vrijdag/VID_20240524_184548'; Ext='mp4' },
    @{ Rel='2024/vrijdag/VID_20240524_184730'; Ext='mp4' },
    @{ Rel='2024/vrijdag/VID_20240524_185039'; Ext='mp4' },
    @{ Rel='2024/vrijdag/VID_20240524_185144'; Ext='mp4' },
    @{ Rel='2024/woensdag/VID_20240522_184839'; Ext='mp4' },
    @{ Rel='2024/woensdag/VID_20240522_192944'; Ext='mp4' },
    @{ Rel='2024/woensdag/VID_20240522_195742'; Ext='mp4' },
    @{ Rel='2025/dinsdag/VID_20250610_184954'; Ext='mp4' },
    @{ Rel='2025/dinsdag/VID_20250610_192705'; Ext='mp4' },
    @{ Rel='2025/dinsdag/VID_20250610_193608'; Ext='mp4' },
    @{ Rel='2025/donderdag/VID_20250612_184150'; Ext='mp4' },
    @{ Rel='2025/vrijdag/DSCF1968'; Ext='MOV' },
    @{ Rel='2025/vrijdag/DSCF1976'; Ext='MOV' },
    @{ Rel='2025/vrijdag/DSCF1977'; Ext='MOV' },
    @{ Rel='2025/vrijdag/DSCF1978'; Ext='MOV' },
    @{ Rel='2025/vrijdag/DSCF1979'; Ext='MOV' },
    @{ Rel='2025/vrijdag/DSCF1981'; Ext='MOV' },
    @{ Rel='2025/vrijdag/DSCF1982'; Ext='MOV' },
    @{ Rel='2025/vrijdag/DSCF1983'; Ext='MOV' },
    @{ Rel='2025/vrijdag/DSCF1984'; Ext='MOV' },
    @{ Rel='2025/vrijdag/DSCF1985'; Ext='MOV' },
    @{ Rel='2025/vrijdag/DSCF1988'; Ext='MOV' },
    @{ Rel='2025/vrijdag/DSCF1995'; Ext='MOV' },
    @{ Rel='2025/vrijdag/DSCF1996'; Ext='MOV' },
    @{ Rel='2025/vrijdag/DSCF1997'; Ext='MOV' },
    @{ Rel='2025/vrijdag/DSCF1999'; Ext='MOV' },
    @{ Rel='2025/vrijdag/DSCF2004'; Ext='MOV' },
    @{ Rel='2025/vrijdag/DSCF2018'; Ext='MOV' },
    @{ Rel='2025/vrijdag/DSCF2019'; Ext='MOV' },
    @{ Rel='2025/vrijdag/DSCF2020'; Ext='MOV' },
    @{ Rel='2025/vrijdag/DSCF2021'; Ext='MOV' },
    @{ Rel='2025/vrijdag/DSCF2022'; Ext='MOV' },
    @{ Rel='2025/vrijdag/DSCF2037'; Ext='MOV' },
    @{ Rel='2025/vrijdag/DSCF2046'; Ext='MOV' },
    @{ Rel='2025/vrijdag/VID_20250613_184434'; Ext='mp4' },
    @{ Rel='2025/vrijdag/VID_20250613_201420'; Ext='mp4' },
    @{ Rel='2025/vrijdag/VID_20250613_201818'; Ext='mp4' },
    @{ Rel='2025/vrijdag/VID_20250613_201855'; Ext='mp4' },
    @{ Rel='2025/vrijdag/VID_20250613_202058'; Ext='mp4' },
    @{ Rel='2025/vrijdag/VID_20250613_202146'; Ext='mp4' },
    @{ Rel='2025/vrijdag/VID_20250613_202326'; Ext='mp4' }
)

$ffmpeg = 'C:\Users\koenz\AppData\Local\Microsoft\WinGet\Packages\Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe\ffmpeg-8.0.1-full_build\bin\ffmpeg.exe'

$success = 0
$fail = 0
$total = $videos.Count

foreach ($v in $videos) {
    $rel = $v.Rel -replace '/', '\'
    $ext = $v.Ext
    $videoPath = Join-Path $oneDriveBase "$rel.$ext"
    $thumbPath = Join-Path $thumbnailBase "$rel.jpg"
    
    # Create directory if needed
    $thumbDir = Split-Path $thumbPath -Parent
    if (-not (Test-Path $thumbDir)) {
        New-Item -ItemType Directory -Path $thumbDir -Force | Out-Null
    }
    
    # Skip if thumbnail already exists
    if (Test-Path $thumbPath) {
        Write-Host "[SKIP] $($v.Rel).jpg (already exists)"
        $success++
        continue
    }
    
    if (-not (Test-Path $videoPath)) {
        Write-Host "[MISS] $videoPath not found"
        $fail++
        continue
    }
    
    # Generate thumbnail: grab frame at 1 second, scale to 300px width
    try {
        $proc = Start-Process -FilePath $ffmpeg -ArgumentList "-i `"$videoPath`" -ss 00:00:01 -vframes 1 -vf scale=300:-1 -q:v 2 `"$thumbPath`" -y" -NoNewWindow -Wait -PassThru -RedirectStandardError "NUL"
        if ($proc.ExitCode -eq 0 -and (Test-Path $thumbPath)) {
            $success++
            Write-Host "[OK] $($v.Rel).jpg"
        } else {
            # Try frame at 0 seconds for very short videos
            $proc2 = Start-Process -FilePath $ffmpeg -ArgumentList "-i `"$videoPath`" -ss 00:00:00 -vframes 1 -vf scale=300:-1 -q:v 2 `"$thumbPath`" -y" -NoNewWindow -Wait -PassThru -RedirectStandardError "NUL"
            if ($proc2.ExitCode -eq 0 -and (Test-Path $thumbPath)) {
                $success++
                Write-Host "[OK] $($v.Rel).jpg (frame 0)"
            } else {
                $fail++
                Write-Host "[FAIL] $($v.Rel)"
            }
        }
    } catch {
        $fail++
        Write-Host "[ERR] $($v.Rel): $_"
    }
}

Write-Host ""
Write-Host "Done: $success success, $fail failed out of $total"
