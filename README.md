# Agent Installer

## Overview
The Agent Installer is a Swift utility script designed to automate the installation process of the Wazuh agent on macOS systems. It determines the architecture of the system and installs the appropriate Wazuh agent package accordingly. The script is capable of installing either the x86_64 or arm64 version of the Wazuh agent package.

## Features
- Automatically detects the architecture of the system.
- Installs the appropriate Wazuh agent package based on the system architecture.
- Utilizes `sysctl` command to retrieve CPU brand string for architecture determination.
- Downloads and installs the Wazuh agent package from the specified URL.
- Cleans up temporary files after installation.

## How to Use
1. Clone the repository to your local machine:

    ```bash
    git clone https://github.com/mranv/agentCheck.git
    ```

2. Navigate to the cloned directory:

    ```bash
    cd agentCheck
    ```

3. Execute the main script:

    ```bash
    swift main.swift
    ```

    This will determine the architecture of your system, download the appropriate Wazuh agent package, and install it.

## Dependencies
- This script requires `curl` and `installer` to be installed on the system.

## Compatibility
- The Wazuh Agent Installer is compatible with macOS systems.

## Known Issues
- None reported at this time.

## Contribution
- Contributions and feedback are welcome! If you encounter any issues or have suggestions for improvements, please feel free to open an issue or create a pull request on the [GitHub repository](https://github.com/yourusername/wazuh-agent-installer).

## License
- This project is licensed under the [MIT License](LICENSE).

