#!/bin/bash

# Script to convert Windows paths to WSL-compatible paths
# Works seamlessly for rsync and other tools
# Usage: ./winpath2wsl.sh <windows_path>

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

    echo "$wsl_path"  # Output the converted WSL path
}

# Check if the user provided an argument
if [ -z "$1" ]; then
    echo "Error: No Windows path provided."
    echo "Usage: $0 <windows_path>"
    exit 1
fi

# Call the function with the provided path and output the result
convert_path "$1"
