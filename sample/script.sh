#!/bin/bash

source_dir="/Users/Vaidhee/Documents/Projects/test/sample"

destination_dir="/Users/Vaidhee/Documents/Projects/test/output"

echo "Copying the DLL files"
find "$source_dir" -type f -name "*.dll" -exec cp {} "$destination_dir" \;
echo "DLL files copy is completed"  

echo "Copying the EXE files"
find "$source_dir" -type f -name "*.exe" -exec cp {} "$destination_dir" \;
echo "EXE files copy is completed"

echo "Copying the MSI files"
# find "$source_dir" -type f \( -name "*.dll" -o -name "*.exe" -o -name "*.msi" \) -exec cp -u {} "$destination_dir" \;
find "$source_dir" -type f -name "*.msi" -exec cp -u {} "$destination_dir" \;
echo "MSI files copy is completed"