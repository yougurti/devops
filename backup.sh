#!/bin/bash

# Function to show help
show_help() {
    echo "Usage: $0 -d <directory> -c <compression> -o <output>"
    echo "  -d  Directory to backup"
    echo "  -c  Compression algorithm (none, gzip, bzip2)"
    echo "  -o  Output file name"
}

# Function to create backup
backup() {
    if [ "$compression" == "none" ]; then
        tar cf - "$directory" | openssl enc -aes-256-cbc -out "$output"
    else
        tar cf - "$directory" | $compression | openssl enc -aes-256-cbc -out "$output"
    fi
}

# Default compression
compression="none"

# Parse command line arguments
while getopts "hd:c:o:" opt; do
    case $opt in
        h)
            show_help
            exit 0
            ;;
        d) directory=$OPTARG ;;
        c) 
            case $OPTARG in
                none) compression="none" ;;
                gzip) compression="gzip" ;;
                bzip2) compression="bzip2" ;;
                *) echo "Invalid compression method"; exit 1 ;;
            esac
            ;;
        o) output=$OPTARG ;;
        \?) echo "Invalid option"; exit 1 ;;
    esac
done

# Check if required arguments are provided
if [ -z "$directory" ] || [ -z "$output" ]; then
    echo "Directory and output file name are required."
    show_help
    exit 1
fi

# Run backup and handle errors
backup 2>error.log
