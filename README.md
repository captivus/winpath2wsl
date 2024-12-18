# 🪟 ↔️ 🐧 Windows-WSL Path Tools

Make navigating between Windows and WSL paths a breeze! This toolkit provides convenient ways to convert and navigate Windows paths in your WSL environment.

## 🎯 Features

- 🔄 Convert Windows paths to WSL format automatically
- 📂 Quick directory navigation with `cdw` function
- 🛡️ Handles spaces and special characters in paths
- 📝 Automatically strips file extensions when needed
- 💪 Works with both quoted and unquoted paths

## 🚀 Installation

1. Clone this repository or download the scripts
2. Make the script executable:
```bash
chmod +x winpath2wsl.sh
```
3. Source the `cdw` function in your `.bashrc` or `.zshrc`:
```bash
source ~/path/to/cdw_function.sh
```

## 💡 Usage

### Command Line Script
```bash
./winpath2wsl.sh "C:\Users\YourName\Documents"
```

### As a Shell Function
```bash
cdw "C:\Users\YourName\Documents"
```

## 🔍 Examples

```bash
# Convert and navigate to a Windows path
cdw "C:\Program Files\Some App"

# Works with quoted paths containing spaces
cdw "D:\My Documents\Project Files"

# Automatically handles file paths by navigating to their directory
cdw "C:\Users\YourName\Documents\report.pdf"
```

## 🛠️ How It Works

The tools use Bash string manipulation to:
1. Strip any surrounding quotes
2. Convert backslashes to forward slashes
3. Transform Windows drive letters (e.g., `C:`) to WSL mount points (e.g., `/mnt/c`)
4. Handle file paths by extracting their parent directory

## 🤝 Contributing

Feel free to open issues or submit pull requests if you have suggestions for improvements!

## 📜 License

This project is open source and available under the MIT License.

---

Made with ❤️ for the WSL community
