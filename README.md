
# Backup Script

## Description
This script provides a simple method to backup a specified directory using various compression algorithms and secure it through encryption.

## Features
- Backup a specified directory.
- Choose from multiple compression algorithms.
- Encrypt the backup file.
- Error logging.
- Command-line argument support for easy usage.

## Usage
Run the script using the following syntax:

```
bash backup.sh -d <directory> -c <compression> -o <output>
```

- `-d`: Specify the directory you want to backup.
- `-c`: Choose the compression algorithm (`none`, `gzip`, `bzip`). Default is `none`.
- `-o`: Define the output file name for the backup.

### Functions

#### `show_help`
Displays the help information for the script. It outlines how to use the script and the available options.

#### `backup`
Performs the backup operation. It takes the directory to backup, applies the specified compression, and encrypts the output using `openssl`.

### Encryption
The script uses `openssl` to encrypt the backup file with AES-256-CBC encryption.

### Error Handling
All errors encountered during the execution of the script are redirected to an `error.log` file.

## Help
Use `-h` or `--help` to display help information.

## Example
To backup a directory named `documents` using `gzip` compression and save it as `backup.gz`, run:

```
bash backup.sh -d documents -c gzip -o backup.gz
```
