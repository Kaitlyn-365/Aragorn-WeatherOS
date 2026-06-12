#!/bin/bash

echo "Embedding world.jpg texture into weather-os.html..."

# Run the Python script in the current directory
python3 embed_texture.py

# Check if the confirmation file exists in the current directory
if [ -f "embed_done.txt" ]; then
    echo "Success! Opening weather-os.html..."
    
    # Opens the HTML file in your Chromebook's browser
    xdg-open weather-os.html
else
    echo "Something went wrong. Check embed_texture.py"
    echo "Press Enter to continue..."
    read -r
fi

