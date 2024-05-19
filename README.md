# Torrents
Scripts for managing torrents.
# Torrents

This repository contains scripts for managing torrents, extracting archives etc.

## get-torrentarchives.ps1

This script allows you to retrieve torrent archives from a specified source.

### Prerequisites

Before running this script, make sure you have the following prerequisites installed:

- PowerShell version 5.1 or later

### Usage

To use the `get-torrentarchives.ps1` script, follow these steps:

1. Clone this repository to your local machine.
2. Open a PowerShell terminal.
3. Navigate to the directory where the script is located.
4. Run the script using the following command:

    ```powershell
    ./get-torrentarchives.ps1 -Source <source> -Destination <destination>
    ```

    Replace `<source>` with the URL or path to the torrent source, and `<destination>` with the directory where you want to save the torrent archives.
5. Note, the default flag is dry run for now, this is an alpha release.

### Examples

Here are some examples of how to use the script:

- To retrieve torrent archives from a URL:

  ```powershell
  ./get-torrentarchives.ps1 -Source "https://example.com/torrents" -Destination "C:\TorrentArchives"
  ```

- To retrieve torrent archives from a local directory:

  ```powershell
  ./get-torrentarchives.ps1 -Source "C:\Torrents" -Destination "C:\TorrentArchives"
  ```

### License

This project is licensed under the GPL v3 License. See the [LICENSE](LICENSE) file for more information.

### Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

### Contact

If you have any questions or need further assistance, feel free to contact the project maintainer at [email@example.com](mailto:email@example.com).