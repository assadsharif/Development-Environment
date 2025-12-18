#!/usr/bin/env bash

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Environment Check"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Check required tools
echo "Checking required tools..."
echo ""

# Node.js
if command -v node &> /dev/null; then
    echo "✅ Node.js: $(node --version)"
else
    echo "❌ Node.js: Not installed"
fi

# npm
if command -v npm &> /dev/null; then
    echo "✅ npm: $(npm --version)"
else
    echo "❌ npm: Not installed"
fi

# Python
if command -v python3 &> /dev/null; then
    echo "✅ Python: $(python3 --version)"
else
    echo "❌ Python: Not installed"
fi

# Git
if command -v git &> /dev/null; then
    echo "✅ Git: $(git --version)"
else
    echo "❌ Git: Not installed"
fi

# GitHub CLI
if command -v gh &> /dev/null; then
    echo "✅ GitHub CLI: $(gh --version | head -n 1)"
else
    echo "⚠️  GitHub CLI: Not installed (optional)"
fi

echo ""
echo "Checking environment variables..."
echo ""

# Source .env if it exists
if [ -f ".env" ]; then
    # Read .env and export variables
    while IFS= read -r line || [ -n "$line" ]; do
        line=$(echo "$line" | tr -d '\r')
        if [[ -n "$line" && ! "$line" =~ ^# ]]; then
            export "$line"
        fi
    done < .env
fi

# Check environment variables
if [ -n "$OPENAI_API_KEY" ] && [ "$OPENAI_API_KEY" != "your-openai-api-key-here" ]; then
    echo "✅ OPENAI_API_KEY: Set"
else
    echo "⚠️  OPENAI_API_KEY: Not set or using default value"
fi

if [ -n "$QDRANT_API_KEY" ] && [ "$QDRANT_API_KEY" != "your-qdrant-api-key-here" ]; then
    echo "✅ QDRANT_API_KEY: Set"
else
    echo "⚠️  QDRANT_API_KEY: Not set or using default value"
fi

if [ -n "$NEON_CONNECTION_STRING" ] && [ "$NEON_CONNECTION_STRING" != "your-neon-connection-string-here" ]; then
    echo "✅ NEON_CONNECTION_STRING: Set"
else
    echo "⚠️  NEON_CONNECTION_STRING: Not set or using default value"
fi

if [ -n "$GITHUB_PAT" ] && [ "$GITHUB_PAT" != "your-github-pat-here" ]; then
    echo "✅ GITHUB_PAT: Set"
else
    echo "⚠️  GITHUB_PAT: Not set or using default value"
fi

echo ""
echo "Checking project structure..."
echo ""

# Check directories
if [ -d "venv" ]; then
    echo "✅ Python virtual environment: Found"
else
    echo "⚠️  Python virtual environment: Not found (run ./bootstrap.sh)"
fi

if [ -d "node_modules" ]; then
    echo "✅ Node modules: Installed"
else
    echo "⚠️  Node modules: Not installed (run ./install.sh)"
fi

if [ -d "my-docusaurus" ]; then
    echo "✅ Docusaurus project: Found"
else
    echo "⚠️  Docusaurus project: Not found"
fi

if [ -d "my-project/_bmad" ]; then
    echo "✅ BMAD framework: Found"
else
    echo "⚠️  BMAD framework: Not found"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Check Complete!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Summary
WARNINGS=$(grep -c "⚠️\|❌" <<< "$(./check.sh 2>&1)" || true)
if [ "$WARNINGS" -gt 0 ]; then
    echo "⚠️  Some items need attention. Review the output above."
else
    echo "✅ Everything looks good!"
fi
echo ""
