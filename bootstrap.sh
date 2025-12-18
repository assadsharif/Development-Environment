#!/usr/bin/env bash
set -e

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Bootstrapping Development Environment"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Check Node.js
echo "✔ Checking Node.js..."
if ! command -v node &> /dev/null; then
    echo "❌ Node.js not found. Please install Node.js first."
    exit 1
fi
echo "  Node.js version: $(node --version)"
echo ""

# Check Python
echo "✔ Checking Python..."
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 not found. Please install Python 3 first."
    exit 1
fi
echo "  Python version: $(python3 --version)"
echo ""

# Set up Python virtual environment
echo "✔ Setting up Python virtual environment..."
if [ ! -d "venv" ]; then
    python3 -m venv venv
    echo "  Virtual environment created"
else
    echo "  Virtual environment already exists"
fi
source venv/bin/activate
echo "  Virtual environment activated"
echo ""

# Install dependencies
echo "✔ Running install script..."
./install.sh
echo ""

# BMAD setup
if [ -d "my-project/_bmad" ]; then
    echo "✔ BMAD framework detected..."
    if command -v npx &> /dev/null; then
        echo "  Installing BMAD Method..."
        npx bmad-method install || echo "  Note: BMAD install skipped (optional)"
    fi
    echo ""
fi

# Create .env template if it doesn't exist
if [ ! -f ".env" ]; then
    echo "✔ Creating .env template..."
    cat > .env << 'EOF'
# ----------------------------
# OpenAI API Key
# ----------------------------
OPENAI_API_KEY="your-openai-api-key-here"

# ----------------------------
# Qdrant Cloud
# ----------------------------
QDRANT_API_KEY="your-qdrant-api-key-here"
QDRANT_CLOUD_URL="your-qdrant-cloud-url-here"

# ----------------------------
# Neon.tech PostgreSQL
# ----------------------------
NEON_CONNECTION_STRING="your-neon-connection-string-here"

# ----------------------------
# JWT Secret Key
# ----------------------------
JWT_SECRET_KEY="your-jwt-secret-key-here"

# ----------------------------
# GitHub Personal Access Token
# ----------------------------
GITHUB_PAT="your-github-pat-here"
EOF
    echo "  .env file created. Please update with your credentials."
    echo ""
fi

# Docusaurus setup
if [ -d "my-docusaurus" ]; then
    echo "✔ Docusaurus project detected..."
    echo "  Run 'cd my-docusaurus && npm start' to start Docusaurus"
    echo ""
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  ✅ Bootstrap Complete!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Next steps:"
echo "  1. Update .env file with your API keys and credentials"
echo "  2. Run './check.sh' to verify your setup"
echo "  3. Start developing!"
echo ""
