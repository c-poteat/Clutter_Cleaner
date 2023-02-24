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

# Moving files
$files = Get-ChildItem -Path $firstpath | Where-Object {$_.extension -in $extensions} | Move-Item -Destination $secondpath
$files

# Move files with specific extensions based upon file type (example .png to pictures) to a specific folder
#TODO

