#!/bin/bash

# Script to convert a Windows file path to its equivalent WSL path
# Handles surrounding quotes and spaces in paths
# Usage: ./winpath2wsl.sh "<windows_path>"

convert_path() {
    local win_path="$1"  # Capture the input Windows path

    # Strip surrounding quotes, if any
    win_path="${win_path%\"}"  # Remove trailing quote
    win_path="${win_path#\"}"  # Remove leading quote

    # Replace all backslashes (\) with forward slashes (/)
    local wsl_path="${win_path//\\//}"

    # Extract the drive letter (e.g., 'C:') and convert it to lowercase
    local drive_letter=$(echo "${wsl_path:0:1}" | tr '[:upper:]' '[:lower:]')

    # Construct the WSL path
    wsl_path="/mnt/$drive_letter${wsl_path:2}"

    # If the path contains a file (e.g., ends with a .extension), strip it
    if [[ "$wsl_path" == */*.* ]]; then
        wsl_path=$(dirname "$wsl_path")
    fi

    echo "$wsl_path"  # Output the converted WSL path
}

# Check if the user provided an argument (the Windows path)
if [ -z "$1" ]; then
    echo "Error: No Windows path provided."
    echo "Usage: $0 <windows_path>"
    exit 1
fi

# Call the function with the provided path
converted_path=$(convert_path "$1")

# Check if the directory exists in WSL
if [ -d "$converted_path" ]; then
    cd "$converted_path" || exit 1
    echo "Changed directory to: $converted_path"
else
    echo "Error: Directory does not exist: $converted_path"
    exit 1
fi

