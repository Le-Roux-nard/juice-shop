#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color

###########################################
# Linter
###########################################

STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep -E '\.(js|jsx|ts|tsx)$')

if [ -z "$STAGED_FILES" ]; then
  exit 0
fi

if command -v npx >/dev/null 2>&1; then
    echo "→ Formatage du code avec Prettier..."
    npx prettier --write .
else
    echo -e "${RED}⚠️  npx non trouvé. Installe Node.js/PNPM/Yarn.${NC}"
fi
