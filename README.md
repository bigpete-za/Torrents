# Torrent-MGR
Scripts for managing torrents on Windows.

## Description
This repository contains scripts for managing torrents, extracting archives etc.

# Scripts
## get-torrentarchives.psm1

This module allows you to retrieve torrent archives from a specified source.

### Prerequisites

Before using this module, make sure you have the following prerequisites installed:

- PowerShell version 5.1 or later
- 7-Zip installed in the default location: C:\Program Files\7-Zip\7z.exe and added to path with like "set PATH=%PATH%;C:\Program Files\7-Zip\""

### Usage

To use the `get-torrentarchives.psm1` module, follow these steps:

1. Clone this repository to your local machine.
2. Open a PowerShell terminal.
3. Navigate to the directory where the module is located.
4. Import the module using the following command:

    ```powershell
    Import-Module ./get-torrentarchives.psm1
    ```
5. Append the module to your Posh profile.
    ````powershell

    Add-Content -Path $PROFILE -Value 'Import-Module get-torrentArchives'
    ````
6. Run the function using the following command:

    ```powershell
    Get-TorrentArchives -Source <source> -Destination <destination>
    ```

    Replace `<source>` with the URL or path to the torrent source, and `<destination>` with the directory where you want to save the torrent archives.

    This can be later called from a torrent client, with the following flags:
    ````
    get-torrentarchives -SourcePath "%F" -ExtractionDestination "%R" -dryrun
    ````
    
7. Note, the default flag is dry run for now, this is an alpha release.

### Examples

Here are some examples of how to use the function:

- To retrieve torrent archives from a local directory:

  ```powershell
  ./get-torrentarchives -Source "C:\Torrents" -Destination "C:\TorrentArchives"
  ```

### License

This project is licensed under the GPL v3 License. See the [LICENSE](LICENSE) file for more information.

### Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

### Contact

If you have any questions or need further assistance, feel free to contact the project maintainer at [email@example.com](mailto:email@example.com).