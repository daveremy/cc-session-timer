#!/bin/bash
# install.sh - Install cc-session-timer

set -e

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Installation directory
INSTALL_DIR="${HOME}/.local/bin"

echo "Installing cc-session-timer..."

# Create install directory if it doesn't exist
if [ ! -d "$INSTALL_DIR" ]; then
    echo "Creating $INSTALL_DIR..."
    mkdir -p "$INSTALL_DIR"
fi

# Download the script
echo "Downloading cc-session-timer..."
curl -sSL https://raw.githubusercontent.com/daveremy/cc-session-timer/main/cc-session-timer -o "${INSTALL_DIR}/cc-session-timer"

# Make it executable
chmod +x "${INSTALL_DIR}/cc-session-timer"

# Check if ~/.local/bin is in PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo -e "${RED}Warning: $INSTALL_DIR is not in your PATH${NC}"
    echo "Add this line to your ~/.bashrc or ~/.zshrc:"
    echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
fi

# Test the installation
if command -v cc-session-timer &> /dev/null; then
    echo -e "${GREEN}✓ cc-session-timer installed successfully!${NC}"
    echo "Try running: cc-session-timer verbose"
else
    echo -e "${GREEN}✓ cc-session-timer installed to $INSTALL_DIR${NC}"
    echo "Try running: ${INSTALL_DIR}/cc-session-timer verbose"
fi