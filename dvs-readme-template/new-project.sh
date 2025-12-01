#!/bin/bash

# DVS Project Scaffolding Script
# Usage: ./new-project.sh <domain> <project-name>
# Example: ./new-project.sh legal contract-clause-flagger

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: ./new-project.sh <domain> <project-name>"
    echo "Example: ./new-project.sh legal contract-clause-flagger"
    exit 1
fi

DOMAIN=$1
PROJECT_NAME=$2
REPO_NAME="dvs-${DOMAIN}-${PROJECT_NAME}"

echo "Creating new DVS project: $REPO_NAME"

# Create project directory
mkdir -p "$REPO_NAME"
cd "$REPO_NAME"

# Copy template files (assumes template is in parent directory)
cp ../dvs-readme-template/README.md .
cp ../dvs-readme-template/.gitignore .
cp ../dvs-readme-template/.env.example .
cp ../dvs-readme-template/requirements.txt .
cp ../dvs-readme-template/main.py .
mkdir -p src data tests results
cp ../dvs-readme-template/src/__init__.py src/

# Initialize git
git init

# Update README with project name placeholder
sed -i '' "s/\[Project Name\]/${REPO_NAME}/g" README.md 2>/dev/null || sed -i "s/\[Project Name\]/${REPO_NAME}/g" README.md
sed -i '' "s/\[DOMAIN\]/${DOMAIN}/g" README.md 2>/dev/null || sed -i "s/\[DOMAIN\]/${DOMAIN}/g" README.md

echo ""
echo "✅ Project created: $REPO_NAME"
echo ""
echo "Next steps:"
echo "  1. cd $REPO_NAME"
echo "  2. Edit README.md - fill in Problem Statement and Design Decisions"
echo "  3. Create GitHub repo and push"
echo ""
