# Interactive File Hash Calculator

---

## 🚀 Overview

This Bash script provides an interactive way to calculate various cryptographic hashes (MD5, SHA1, SHA256, and SHA512) for any specified file. It's designed to be user-friendly, prompting you for the file path and then displaying all calculated hashes in a clear, organized format. This can be super handy for verifying file integrity or checking for tampering.

---

## ✨ Features

* **Interactive Input:** Easily provide the file path when prompted.
* **Multiple Hash Algorithms:** Calculates MD5, SHA1, SHA256, and SHA512 hashes.
* **Cross-Platform Compatibility:** Works seamlessly on Linux and within Bash environments on Windows (like Git Bash or WSL).
* **Error Handling:** Gracefully handles non-existent files or incorrect paths.
* **User-Friendly Output:** Displays hashes clearly for quick verification.

---

## 🛠️ Prerequisites

To run this script, you'll need:

* **Bash:** A Unix-like shell (standard on Linux, available via Git Bash or WSL on Windows).
* **Core Utilities:** The `md5sum`, `sha1sum`, `sha256sum`, and `sha512sum` commands. These are typically part of `coreutils` on Linux and are included with Git Bash and WSL.

---

## 🖥️ How to Use

Follow these simple steps to get started:

1.  **Save the Script:**
    Save the script content (e.g., from the `hash_calculator.sh` file) into a file named `hash_calculator.sh` in your desired directory.

2.  **Make it Executable:**
    Open your terminal (or Git Bash/WSL terminal on Windows) and run:
    ```bash
    chmod +x hash_calculator.sh
    ```

3.  **Run the Script:**
    Execute the script from your terminal:
    ```bash
    ./hash_calculator.sh
    ```

4.  **Enter File Path:**
    The script will prompt you to "Enter the full path to the file".
    * **Linux:** Provide the standard Linux path (e.g., `/home/user/documents/my_file.zip`).
    * **Windows (Git Bash/WSL):** Use forward slashes (e.g., `C:/Users/YourName/Documents/my_file.zip` or `/mnt/c/Users/YourName/Documents/my_file.zip` for WSL).
    * Type `exit` to quit the script at any time.

---

## 🌐 Compatibility Notes for Windows Users

This Bash script requires a Bash environment to run on Windows. You have two excellent options:

### Option 1: Git Bash (Recommended for most)

* **Install Git for Windows:** This package includes Git Bash, a powerful command-line environment that provides a Unix-like shell and essential utilities (including the `*sum` commands needed by this script). You can download it from [git-scm.com](https://git-scm.com/download/win).
* Once installed, launch "Git Bash" from your Start Menu and follow the "How to Use" steps above.

### Option 2: Windows Subsystem for Linux (WSL)

* **Install WSL:** If you prefer a full Linux environment within Windows, follow Microsoft's official guide to install WSL and your preferred Linux distribution (e.g., Ubuntu).
* Open your WSL terminal, navigate to your files (Windows drives are usually mounted under `/mnt/`), and follow the "How to Use" steps.

---

## 📄 License

```text
Copyright (c) 2025 [Your Name or Entity Name]

This script is provided "as is," without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose, and non-infringement. In no event shall the authors or copyright holders be liable for any claim, damages, or other liability, whether in an action of contract, tort, or otherwise, arising from, out of, or in connection with the software or the use or other dealings in the software.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
