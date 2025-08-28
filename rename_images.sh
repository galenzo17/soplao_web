#!/bin/bash

# Script to rename WhatsApp images to more descriptive names
# This script will be deleted after use

cd "$(dirname "$0")/public/images"

echo "Renaming images to more descriptive names..."

# Rename images based on their content/equipment type
if [ -f "WhatsApp Image 2025-08-04 at 12.11.14 AM.jpeg" ]; then
    mv "WhatsApp Image 2025-08-04 at 12.11.14 AM.jpeg" "karcher-steam-cleaner.jpg"
    echo "Renamed steam cleaner image"
fi

if [ -f "WhatsApp Image 2025-08-04 at 12.18.30 AM(1).jpeg" ]; then
    mv "WhatsApp Image 2025-08-04 at 12.18.30 AM(1).jpeg" "industrial-vacuum-cleaner.jpg"
    echo "Renamed vacuum cleaner image"
fi

if [ -f "WhatsApp Image 2025-08-04 at 12.17.10 AM.jpeg" ]; then
    mv "WhatsApp Image 2025-08-04 at 12.17.10 AM.jpeg" "professional-floor-polisher.jpg"
    echo "Renamed floor polisher image"
fi

if [ -f "WhatsApp Image 2025-08-03 at 11.31.37 PM.jpeg" ]; then
    mv "WhatsApp Image 2025-08-03 at 11.31.37 PM.jpeg" "advanced-filtration-system.jpg"
    echo "Renamed filtration system image"
fi

if [ -f "WhatsApp Image 2025-08-03 at 11.23.23 PM.jpeg" ]; then
    mv "WhatsApp Image 2025-08-03 at 11.23.23 PM.jpeg" "steam-mop-floor-cleaner.jpg"
    echo "Renamed steam mop image"
fi

if [ -f "WhatsApp Image 2025-08-04 at 12.18.30 AM(5).jpeg" ]; then
    mv "WhatsApp Image 2025-08-04 at 12.18.30 AM(5).jpeg" "specialized-cleaning-tools.jpg"
    echo "Renamed specialized tools image"
fi

echo "Image renaming completed!"
echo "Images renamed:"
echo "- karcher-steam-cleaner.jpg"
echo "- industrial-vacuum-cleaner.jpg" 
echo "- professional-floor-polisher.jpg"
echo "- advanced-filtration-system.jpg"
echo "- steam-mop-floor-cleaner.jpg"
echo "- specialized-cleaning-tools.jpg"