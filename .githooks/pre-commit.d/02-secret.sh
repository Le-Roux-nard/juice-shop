#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color

###########################################
# Scan de secrets avec gitleaks
###########################################
if command -v gitleaks >/dev/null 2>&1; then
    echo "→ Scan de secrets (gitleaks)..."
    gitleaks protect --staged --no-banner
else
    echo -e "${RED}⚠️  Gitleaks non installé (https://github.com/gitleaks/gitleaks).${NC}"
    echo "   Secret scanning ignoré."
fi