#!/usr/bin/env bash
set -e

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Installing Development Environment"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Install Node.js dependencies
if [ -f "package.json" ]; then
    echo "✔ Installing Node.js dependencies..."
    npm install
    echo ""
fi

# Install Python dependencies
if [ -f "requirements.txt" ]; then
    echo "✔ Installing Python dependencies..."
    if [ -d "venv" ]; then
        source venv/bin/activate
    fi
    pip install -r requirements.txt
    echo ""
fi

# Install Docusaurus dependencies
if [ -d "my-docusaurus" ]; then
    echo "✔ Installing Docusaurus dependencies..."
    cd my-docusaurus
    npm install
    cd ..
    echo ""
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  ✅ Installation Complete!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Next steps:"
echo "  1. Run './bootstrap.sh' to set up your environment"
echo "  2. Run './check.sh' to verify your setup"
echo ""
