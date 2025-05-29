#!/bin/bash

# Copyright (c) 2025 FRMNSYH

# This script is provided "as is," without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose, and non-infringement. In no event shall the authors or copyright holders be liable for any claim, damages, or other liability, whether in an action of contract, tort, or otherwise, arising from, out of, or in connection with the software or the use or other dealings in the software.

# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.


# Function to display usage information
display_usage() {
    echo "Usage: $0"
    echo "This script calculates various cryptographic hashes (MD5, SHA1, SHA256, SHA384, SHA512, RIPEMD160, BLAKE2b) for a given file."
    echo "It will prompt you to enter the file path."
    echo ""
    echo "On Windows, this script requires a Bash environment like Git Bash or WSL (Windows Subsystem for Linux)."
    echo "Ensure that 'md5sum', 'sha1sum', 'sha256sum', 'sha384sum', 'sha512sum', 'b2sum' commands are available in your PATH, and 'openssl' is installed for RIPEMD160."
}

# Check if any arguments are provided (e.g., -h or --help)
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    display_usage
    exit 0
fi

echo "--- Interactive File Hash Calculator ---"
echo "This script works on Linux and via Git Bash/WSL on Windows."

# Loop to allow multiple file hash calculations until the user exits
while true; do
    echo -e "\n---------------------------------------------------"
    read -p "Enter the full path to the file (or type 'exit' to quit): " file_path

    # Check if the user wants to exit
    if [[ "$file_path" == "exit" ]]; then
        echo "Exiting hash calculator. Goodbye!"
        break
    fi

    # Check if the file exists and is a regular file
    if [[ ! -f "$file_path" ]]; then
        echo "Error: File not found or is not a regular file: '$file_path'"
        echo "Please ensure the path is correct and accessible."
        echo "On Windows, use forward slashes (e.g., C:/Users/YourName/document.txt)."
        continue # Ask for input again
    fi

    echo -e "\nCalculating hashes for: '$file_path'"
    echo "---------------------------------------------------"

    # Function to calculate and print hash using *sum commands
    calculate_sum_hash() {
        local algo_name="$1"
        local cmd="$2"
        local file="$3"

        if command -v "$cmd" &> /dev/null; then
            printf "%-10s %s\n" "$algo_name:" "$("$cmd" "$file" | awk '{print $1}')"
        else
            printf "%-10s '%s' command not found. Please install it or ensure it's in your PATH.\n" "$algo_name:" "$cmd"
        fi
    }

    # Function to calculate and print hash using openssl
    calculate_openssl_hash() {
        local algo_name="$1"
        local openssl_algo="$2"
        local file="$3"

        if command -v openssl &> /dev/null; then
            # openssl dgst output includes filename, so we parse it
            printf "%-10s %s\n" "$algo_name:" "$(openssl dgst "-$openssl_algo" "$file" | awk '{print $2}')"
        else
            printf "%-10s 'openssl' command not found. Please install it for %s hash.\n" "$algo_name:" "$algo_name"
        fi
    }

    calculate_sum_hash "MD5" "md5sum" "$file_path"
    calculate_sum_hash "SHA1" "sha1sum" "$file_path"
    calculate_sum_hash "SHA256" "sha256sum" "$file_path"
    calculate_sum_hash "SHA384" "sha384sum" "$file_path" # Added SHA384
    calculate_sum_hash "SHA512" "sha512sum" "$file_path"
    calculate_sum_hash "BLAKE2b" "b2sum" "$file_path"    # Added BLAKE2b

    calculate_openssl_hash "RIPEMD160" "ripemd160" "$file_path" # Added RIPEMD160

    echo "---------------------------------------------------"
done