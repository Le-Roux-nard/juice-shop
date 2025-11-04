#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color

###########################################
# Linter
###########################################

if [ -f "package.json" ]; then
    if command -v npx >/dev/null 2>&1; then
        echo "→ Formatage du code avec Prettier..."
        npx prettier --write .
        echo "→ Lint du code avec ESLint..."
        npx eslint . --fix
    else
                echo -e "${RED}⚠️  npx non trouvé. Installe Node.js/PNPM/Yarn.${NC}"
    fi
fi

# Exemple Python
if [ -f "pyproject.toml" ] || [ -f "requirements.txt" ]; then
    if command -v black >/dev/null 2>&1; then
        echo "→ Formatage Python avec Black..."
        black .
    fi
    if command -v ruff >/dev/null 2>&1; then
        echo "→ Lint Python avec Ruff..."
        ruff check . --fix
    fi
fi