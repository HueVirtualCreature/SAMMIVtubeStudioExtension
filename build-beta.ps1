# Read the current version from version.txt
$currentVersion = Get-Content -Path version.txt

# Extract the version components
$major = [int]$currentVersion.Substring(1, 1)
$minor = [int]$currentVersion.Substring(3, 1)
$patch = [int]$currentVersion.Substring(5, 1)
$build = [int]$currentVersion.Substring(7)

# Increment the build number
$build++

# Construct the new version number
$newVersion = "v$major.$minor.$patch.$build.beta"

# Create a subdirectory called 'builds' if it doesn't exist
if (-not (Test-Path -Path builds)) {
	New-Item -Path builds -ItemType Directory
}

$newFile = "builds\SAMMIVtubeStudioExtension.$newVersion.sef"

# Create a copy of SAMMIVtubeStudioExtension.sef with the updated version in builds
Copy-Item -Path SAMMIVtubeStudioExtension.sef -Destination $newFile -Force

# Replace the token in the copied file
(Get-Content -Path $newFile) | ForEach-Object {$_ -replace '\$!BUILDNUMBER!\$', $newVersion} | Set-Content -Path $newFile

# Do not replace the exmaple deck
(Get-Content -Path $newFile) | ForEach-Object {$_ -replace '{"exampleDeckData":"\$!ExampleDeckData!\$"}', ''} | Set-Content -Path $newFile