#!/bin/bash

# Path to the download list
url_list="$HOME/Projects/home-server/kiwix/download.txt"

# Directory to save the downloaded files
download_dir="/media/nvme0/app-data/kiwix/zim"

# Create the directory if it doesn't exist
mkdir -p "$download_dir"

# Use xargs to download files in parallel with wget
cat "$url_list" | xargs -n 1 -P 4 -I {} wget -c -P "$download_dir" {}

# Use rsync to ensure resumability and progress tracking
while IFS= read -r url; do
    filename=$(basename "$url")
    rsync --progress -a --partial --no-motd "$download_dir/$filename" "$download_dir"
done < "$url_list"
