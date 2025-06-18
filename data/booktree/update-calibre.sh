#!/bin/sh

# Define directories
SOURCE_DIR="/data/completed"  # Change this to your source directory
CACHE_DIR="/config/ebook-cache/"      # Change this to your cache directory
LIBRARY_DIR="/data/calibre/ingest"       # Change this to your library directory

# Check for required directories
if [ ! -d "$SOURCE_DIR" ] || [ ! -d "$CACHE_DIR" ] || [ ! -d "$LIBRARY_DIR" ]; then
    echo "One or more directories do not exist."
    exit 1
fi

# Loop through the specified file types recursively
find "$SOURCE_DIR" -type f $ -name "*.epub" -o -name "*.mobi" -o -name "*.pdf" $ | while read -r file; do
    # Compute the MD5 hash of the file
    hash=$(md5 "$file" | awk '{print $1}')

    # Check if the hash already exists in the cache
    if [ -e "$CACHE_DIR/$hash" ]; then
        echo "Hash $hash already exists for file $file. Skipping."
    else
        # Copy the file to the library directory
        cp "$file" "$LIBRARY_DIR/"
        echo "Copied $file to $LIBRARY_DIR."

        # Create a new file in the cache with the hash
        touch "$CACHE_DIR/$hash"
        echo "Created cache entry for hash $hash."
    fi
done