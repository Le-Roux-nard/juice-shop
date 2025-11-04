#!/bin/bash
# =========================================
# SCA avant push
# =========================================

RED='\033[0;31m'
NC='\033[0m'


# NodeJS
if [ -f "package.json" ]; then
    echo "→ Vérification des vulnérabilités npm..."
    if command -v npm >/dev/null 2>&1; then
        npm audit --audit-level=high
    else
        echo -e "${RED}⚠️  npm non installé.${NC}"
    fi
fi

# Python
if [ -f "requirements.txt" ]; then
    if command -v pip-audit >/dev/null 2>&1; then
        echo "→ Audit Python avec pip-audit..."
        pip-audit -r requirements.txt
    else
        echo -e "${RED}⚠️  pip-audit non installé (pip install pip-audit).${NC}"
    fi
fi