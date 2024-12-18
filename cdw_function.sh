# ~/scripts/cdw_function.sh

# Enhanced cdw function: Change to the directory equivalent of a Windows path
cdw() {
    if [ -z "$1" ]; then
        echo "Usage: cdw <windows_path>"
        return 1
    fi

    # Capture the Windows path
    local win_path="$1"

    # Strip surrounding quotes, if any
    win_path="${win_path%\"}"
    win_path="${win_path#\"}"

    # Replace backslashes (\) with forward slashes (/)
    local wsl_path="${win_path//\\//}"

    # Extract the drive letter (e.g., 'C:') and convert it to lowercase
    local drive_letter=$(echo "${wsl_path:0:1}" | tr '[:upper:]' '[:lower:]')

    # Construct the WSL path
    wsl_path="/mnt/$drive_letter${wsl_path:2}"

    # If the path contains a file (e.g., ends with a .extension), strip it
    if [[ "$wsl_path" == */*.* ]]; then
        wsl_path=$(dirname "$wsl_path")
    fi

    # Change to the directory if it exists
    if [ -d "$wsl_path" ]; then
        cd "$wsl_path" || return 1
        echo "Changed directory to: $wsl_path"
    else
        echo "Error: Directory does not exist: $wsl_path"
        return 1
    fi
}

