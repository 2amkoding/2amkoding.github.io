#!/bin/bash
# Load Jekyll project aliases
# Usage: source ./setup-aliases.sh

# Check if we're in the right directory
if [[ ! -f "Gemfile" ]] || [[ ! -f "_config.yml" ]]; then
    echo "❌ This doesn't appear to be a Jekyll project directory"
    return 1 2>/dev/null || exit 1
fi

# Load aliases from .aliases file
if [[ -f ".aliases" ]]; then
    source .aliases
    echo "✅ Jekyll project aliases loaded!"
else
    echo "❌ .aliases file not found"
    return 1 2>/dev/null || exit 1
fi
