# python-installer
batch file to quickly install python in fresh windows environment 
# Python Installer for Windows (`Python-installer.bat`)

This batch script automates the installation of Python 3.12.0 on Windows machines without requiring administrative privileges. It's particularly useful for sandbox environments, Windows virtual machines (VMs), and fresh Windows installations where Python isn't already installed.

## Table of Contents

- [Features](#features)
- [How It Works](#how-it-works)
- [Installation Instructions](#installation-instructions)
- [Usage](#usage)
- [Use Cases](#use-cases)
- [Notes](#notes)
- [License](#license)

## Features

- **Non-Admin Installation**: Installs Python in the user's local AppData directory without needing admin rights.
- **Automated Download**: Downloads the official Python installer automatically.
- **Progress Notification**: Includes a progress notifier utility to display download progress.
- **Path Configuration**: Adds Python to the user's PATH environment variable for easy access.
- **Version Verification**: Verifies the installed Python version after installation.
- **Compatibility**: Works on Windows 10 and later versions.

## How It Works

The script performs the following steps:

1. **Download ProgressNotifier Utility**: Downloads and executes a utility to display progress notifications during the installation.
2. **Check for Existing Python Installation**: Verifies if Python 3.12 is already installed in the user's local AppData directory.
3. **Download Python Installer**: If Python is not installed, downloads the official Python 3.12.0 installer from Python.org.
4. **Install Python**: Installs Python silently in the user's local AppData directory without admin rights.
5. **Configure Environment Variables**: Adds Python and its Scripts directory to the user's PATH for future sessions.
6. **Cleanup**: Terminates the ProgressNotifier process and cleans up temporary files.
7. **Verification**: Displays the installed Python version to confirm successful installation.

## Installation Instructions

1. **Download the Batch Script**:

   Save the provided batch script as `Python-installer.bat` on your Windows machine.

2. **Run the Script**:

   - Double-click `Python-installer.bat` to execute it.
   - Alternatively, open a Command Prompt and run:

     ```cmd
     cd path\to\script
     Python-installer.bat
     ```

3. **Follow On-Screen Prompts**:

   The script will display messages indicating the progress of the installation. Wait until it completes.

## Usage

After successful installation:

- **Access Python**:

  Open a new Command Prompt window and run:

  ```cmd
  python --version
  ```
You should see Python 3.12.0 displayed.

## Install Python Packages:

### Use pip to install packages:


Copy code
```cmd
pip install package-name
```
## Use Cases
### Sandbox Environments:

- Quickly set up Python in isolated environments without affecting the system-wide configuration.

### Windows Virtual Machines:

- Ideal for setting up Python in VMs where you might not have admin access or prefer not to alter the base image.

### Fresh Windows Installations:

- Simplifies the process of getting Python up and running on new systems.

## Notes
### No Admin Rights Required:

The script installs Python in the user's profile directory, avoiding the need for administrative privileges.

## Environment Variables:

The script uses SETX to modify the user's PATH environment variable for future sessions. You may need to open a new Command Prompt window to recognize the updated PATH.

## ProgressNotifier Utility:

The script downloads and runs a utility from cert.doggos.win to display progress notifications. Ensure you trust the source before running the script.

## Python Version:

The script installs Python 3.12.0. You can modify the script to install a different version by changing the download URL and related paths.

## Antivirus Warnings:

Some antivirus software may flag the script or the downloaded utilities. Use at your own discretion.

## License
This script is provided as-is, without any warranty. Use it at your own risk.

### How This Script is Useful

- **Sandbox Environments**: When working within a sandbox or restricted environment where administrative privileges are not available, this script allows you to install Python locally without affecting the system configuration.

- **Windows Virtual Machines (VMs)**: For testing or development purposes, you might need Python installed on a VM. This script simplifies the process by automating the installation without requiring admin rights.

- **Fresh Windows Installations**: Setting up a new Windows machine often involves installing various tools. This script provides a quick way to install Python and configure it for immediate use.

### Additional Information

- **Script Breakdown**:

  - **Downloading ProgressNotifier**: Uses PowerShell to download and execute a utility that shows download progress.
  - **Setting Execution Policy**: Temporarily sets the PowerShell execution policy to bypass restrictions for the script's execution.
  - **Checking Python Installation**: Verifies if Python is already installed to avoid redundant installations.
  - **Downloading Python Installer**: Downloads the official Python installer to a temporary directory.
  - **Silent Installation**: Installs Python silently without interrupting the user.
  - **Updating PATH Variable**: Updates the user's PATH environment variable so Python commands can be recognized in new Command Prompt windows.
  - **Cleanup**: Removes temporary files and terminates background processes related to the installation.

### Disclaimer

- **Security Considerations**:

  - **Source Verification**: The script downloads executables from external sources (`cert.doggos.win` and `python.org`). Ensure that you trust these sources before running the script.
  - **Execution Policy Changes**: Modifies the PowerShell execution policy, which could have security implications. The change is temporary and limited to the process scope.

- **Usage Rights**:

  - **Python License**: Python is open-source software. Refer to the Python Software Foundation License for details.
  - **Script License**: You are free to use and modify this script for personal or commercial use. No warranty is provided.
