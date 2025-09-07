#!/bin/bash

# Jekyll Rebuild Script - Full cache clear and restart
# Usage: ./jekyll-rebuild.sh

echo "🛑 Stopping Jekyll..."
# Stop Jekyll gracefully
if pgrep -f jekyll > /dev/null; then
    kill $(pgrep -f jekyll) 2>/dev/null
    sleep 2
    echo "✅ Jekyll stopped"
else
    echo "ℹ️  No Jekyll process running"
fi

echo "🧹 Clearing all caches..."
# Clear Jekyll caches and build files
rm -rf .jekyll-cache _site
echo "✅ Caches cleared"

echo "🚀 Starting full rebuild..."
# Full rebuild without incremental
bundle exec jekyll serve --host 0.0.0.0 --livereload

echo "📱 Server should be available at:"
echo "   - http://localhost:4000"
echo "   - http://127.0.0.1:4000"
