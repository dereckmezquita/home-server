#!/bin/bash

# Define the URLs to download
OSM_URLS=(
  "https://download.geofabrik.de/europe-latest.osm.pbf"
  "https://download.geofabrik.de/north-america-latest.osm.pbf"
)

# Define the directory to store the downloaded files
DATA_DIR="/mnt/nvme1/app-data/open-street-map"

# Create the directory if it does not exist
mkdir -p "$DATA_DIR"

# Download and import the files
for url in "${OSM_URLS[@]}"; do
  # Extract the file name from the URL
  filename=$(basename "$url")
  echo "Downloading $filename..."
  wget -O "$DATA_DIR/$filename" "$url"

  # Run the Docker import command for each file
  echo "Importing $filename into Docker..."
  docker run \
    -v "$DATA_DIR/$filename:/data/region.osm.pbf" \
    -v osm-data:/data/database/ \
    -v osm-tiles:/data/tiles/ \
    overv/openstreetmap-tile-server \
    import
done

echo "Data import completed. You can now run the docker-compose command to start the service."
