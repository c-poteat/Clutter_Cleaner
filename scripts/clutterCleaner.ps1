# Prompt which files to move from desktop .. Mac OS .. Need to check OS version
$fileversions = @($IsMacOS,$IsWindows)
foreach ($fileversion in $fileversions) {
    if ($IsMacOS) {
        $username = id -un
    } else {
        $username = $env:UserName
    }
}
# File paths
$firstpath = "/Users/$username/Desktop/"
$secondpath = "/Users/$username/Documents/"

# Array
$extensions = @()
$extension = Read-Host "Please enter files extensions to remove from desktop (or type 'done' to finish)"
while ($extension -ne "done") {
    $extensions += $extension
    $extension = Read-Host "Enter another file extension (or type 'done' to finish)"
}
# Adding . to input
for ($i=0; $i -lt $extensions.Length; $i++) {
    $extensions[$i] = "." + $extensions[$i]
}
Write-Host "You've entered the following extensions:" $extensions

# Moving desktop files based upon input
$desktopfiles = Get-ChildItem -Path $firstpath | Where-Object {$_.extension -in $extensions} | Move-Item -Destination $secondpath
$desktopfiles

# Checks for existing folders if not create them
if (-not (Test-Path -Path "/Users/nell/Documents/Docs")) {
    New-Item -Path $secondpath -Name "Docs" -ItemType "directory"
} else {
    Write-Output "`nDocs folder already exists"
}
if (-not (Test-Path -Path "/Users/nell/Documents/CompressedFiles")) {
    New-Item -Path $secondpath -Name "CompressedFiles" -ItemType "directory"
} else {
    Write-Output "`nCompressed Files folder already exists"
}
if (-not (Test-Path -Path "/Users/nell/Documents/DataFiles")) {
    New-Item -Path $secondpath -Name "DataFiles" -ItemType "directory"
} else {
    Write-Output "`nDataFiles folder already exists"
}
if (-not (Test-Path -Path "/Users/nell/Documents/ExecutableExtensions")) {
    New-Item -Path $secondpath -Name "ExecutableExtensions" -ItemType "directory"
} else {
    Write-Output "`nExecutableExtensions folder already exists"
}
if (-not (Test-Path -Path "/Users/nell/Documents/Images")) {
    New-Item -Path $secondpath -Name "Images" -ItemType "directory"
} else {
    Write-Output "`nImages folder already exists"
}
if (-not (Test-Path -Path "/Users/nell/Documents/Videos")) {
    New-Item -Path $secondpath -Name "Videos" -ItemType "directory"
} else {
    Write-Output "`nVideos folder already exists" 
}

# Move files with specific extensions based upon file type (example .png to pictures) to a specific folder
#TODO
$docextextensions = Get-ChildItem -Path /Users/nell/Documents/ -Recurse -Include "*.doc","*.docx", "*.html","*.html","*.ods","*.odt","*.pdf","*.ppt","*.pptx","*.rtf","*.txt","*.xls","*.xlsm","*.xlsx"
| Move-Item -Destination "/Users/nell/Documents/Docs" -ErrorAction SilentlyContinue
$docextextensions

$compressedfiles = Get-ChildItem -Path /Users/nell/Documents/ -Recurse -Include "*.7z","*.arj", "*.deb","*.pkg","*.rar","*.rpm","*.tar.gz","*.z","*.zip" 
| Move-Item -Destination "/Users/nell/Documents/CompressedFiles" -ErrorAction SilentlyContinue
$compressedfiles

$datafileextensions = Get-ChildItem -Path /Users/nell/Documents/ -Recurse -Include "*.csv","*.dat", "*.db","*.log","*.mdb","*.sav","*.sql","*.tar","*.xml" 
| Move-Item -Destination "/Users/nell/Documents/DataFiles" -ErrorAction SilentlyContinue
$datafileextensions

$executableextensions = Get-ChildItem -Path /Users/nell/Documents/ -Recurse -Include "*.apk","*.bat", "*.bin","*.cgi","*.com","*.exe","*.jar","*.msi","*.py" 
| Move-Item -Destination "/Users/nell/Documents/ExecutableExtensions" -ErrorAction SilentlyContinue
$executableextensions

$imageextensions = Get-ChildItem -Path /Users/nell/Documents/ -Recurse -Include "*.ai","*.bmp", "*.gif","*.ico","*.jpeg","*.jpg","*.png","*.ps","*.psd","*.svg","*.tiff","*.tif","*.webp"
| Move-Item -Destination "/Users/nell/Documents/Images" -ErrorAction SilentlyContinue
$imageextensions

$videoextensions = Get-ChildItem -Path /Users/nell/Documents/ -Recurse -Include "*.3g2","*.3gp", "*.avi","*.flv","*.h264","*.m4v","*.mkv","*.mov","*.mp4","*.mpg","*.mpeg","*.rm","*.swf","*.vob","*webm","*.wmv"
| Move-Item -Destination "/Users/nell/Documents/Videos" -ErrorAction SilentlyContinue
$videoextensions