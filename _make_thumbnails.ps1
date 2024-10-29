# Create the "tn" directory if it doesn't exist
if (!(Test-Path -Path "tn")) {
    New-Item -ItemType Directory -Path "tn"
}

# Process each image file in the "images" directory
Get-ChildItem -Path "images\*" -Include *.jpg, *.png | ForEach-Object {
    $file = $_.FullName
    $thumbnailFile = "tn\images\" + $_.Name

    # Display file name
    Write-Output $file
    Write-Output $thumbnailFile

    # Check if the thumbnail already exists; if not, create it
    if (!(Test-Path -Path $thumbnailFile)) {
        & "magick" $file -thumbnail 160x160 $thumbnailFile
    }
}
