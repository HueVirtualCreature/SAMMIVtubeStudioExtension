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
$newVersion = "v$major.$minor.$patch.$build"

# Update version.txt with the new version number
$newVersion | Set-Content -Path version.txt

# Create a subdirectory called 'builds' if it doesn't exist
if (-not (Test-Path -Path builds)) {
	New-Item -Path builds -ItemType Directory
}

$newFile = "builds\SAMMIVtubeStudioExtension.$newVersion.sef"

if (Test-Path -Path $newFile) {
    Write-Host "The copied file $newFile already exists. Exiting the script."
    exit
}

# Create a copy of SAMMIVtubeStudioExtension.sef with the updated version in builds
Copy-Item -Path SAMMIVtubeStudioExtension.sef -Destination $newFile -Force

# Read the json from the example_deck.json file
$exampleDeckJson = Get-Content -Path example_deck.json

# Replace the example deck token in the copied file
(Get-Content -Path $newFile) | ForEach-Object {$_ -replace '{"exampleDeckData":"\$!ExampleDeckData!\$"}', $exampleDeckJson} | Set-Content -Path $newFile

# Replace the token in the copied file
(Get-Content -Path $newFile) | ForEach-Object {$_ -replace '\$!BUILDNUMBER!\$', $newVersion} | Set-Content -Path $newFile