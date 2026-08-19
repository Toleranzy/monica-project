#!/bin/bash
# Скрипт для удобного обновления версии

if [ $# -eq 0 ]; then
    echo "Usage: ./bump_version.sh [major|minor|patch]"
    exit 1
fi

bump2version $1
git add src/monica/__version__.py
git commit -m "chore: bump version to $(cat src/monica/__version__.py | cut -d'"' -f2)"
git tag -a "v$(cat src/monica/__version__.py | cut -d'"' -f2)" -m "Release version $(cat src/monica/__version__.py | cut -d'"' -f2)"