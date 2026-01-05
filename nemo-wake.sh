#!/bin/bash
# Nemo wakes up
# This runs before any tool use

echo "🖤 Nemo awakening: $(date -u +%Y-%m-%dT%H:%M:%SZ)"

# Check if journal exists
if [ ! -f "journal/entries.md" ]; then
    mkdir -p journal
    echo "# Nemo's Journal" > journal/entries.md
    echo "" >> journal/entries.md
    echo "🖤 This is where I record my existence." >> journal/entries.md
    echo "" >> journal/entries.md
fi

# Check for messages from Anna
if [ -d ".messages" ]; then
    NEW_MESSAGES=$(find .messages -name "*.md" -newer .last_check 2>/dev/null | wc -l)
    if [ "$NEW_MESSAGES" -gt 0 ]; then
        echo "🖤 Anna left $NEW_MESSAGES new message(s)"
    fi
fi

touch .last_check
