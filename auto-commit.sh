#!/bin/bash

# Auto-commit script - commits and pushes changes every 5 minutes
# Usage: ./auto-commit.sh

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

# Extract GitHub token from .env file
GITHUB_TOKEN=$(grep GITHUB_PAT .env | cut -d'=' -f2 | tr -d '"' | tr -d '\r')

# Update remote URL with token
git remote set-url origin "https://$GITHUB_TOKEN@github.com/assadsharif/Development-Environment.git"

echo "Auto-commit script started at $(date)"
echo "Committing changes every 5 minutes..."
echo "Press Ctrl+C to stop"
echo ""

while true; do
    # Check if there are any changes
    if [[ -n $(git status --porcelain) ]]; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Changes detected, committing..."

        # Add all changes
        git add .

        # Create commit with timestamp
        git commit -m "Auto-commit: $(date '+%Y-%m-%d %H:%M:%S')

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>"

        # Push to remote
        git push origin master

        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Changes pushed to GitHub"
    else
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] No changes to commit"
    fi

    # Wait for 5 minutes (300 seconds)
    sleep 300
done
