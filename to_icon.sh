#!/bin/bash

# Create the output directory if it doesn't exist
mkdir -p output

# Iterate over the input files
for input in Oxygen-Icons.org-Oxygen-Status-weather-*.png; do
    # Remove the prefix and suffix from the filename
    filename=$(basename "$input" .256.png)
    filename=${filename#Oxygen-Icons.org-Oxygen-Status-weather-}

    # Build the output filename
    output="output/${filename}-black-24.bmp"

    # Composite the input image over a black background and save it as temp.png
    magick "$input" -background black -flatten temp.png

    # Resize temp.png to 140x140 pixels and convert it to BMP
    magick temp.png -resize 140x140 "$output"
done

# Remove the temporary image
rm temp.png
