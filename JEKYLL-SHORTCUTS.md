# Jekyll Development Shortcuts

This directory contains project-specific shortcuts for Jekyll development.

## 🚀 Quick Commands

### Main Rebuild Command (Your Requested 1-Shot)
```bash
./jekyll-rebuild.sh
```
**OR with aliases:**
```bash
rebuild
```

This command does exactly what you requested:
1. ✅ Stops Jekyll: `kill $(pgrep -f jekyll)`
2. ✅ Clears all caches: `rm -rf .jekyll-cache _site`  
3. ✅ Full rebuild: `bundle exec jekyll serve`

## 📋 All Available Shortcuts

### Load Aliases First
```bash
# Option 1: Manual loading
source ./setup-aliases.sh

# Option 2: If you have direnv installed
direnv allow
```

### Available Commands
```bash
rebuild   # Full cache clear and restart (your 1-shot command)
jstart    # Quick start Jekyll server
jstop     # Stop Jekyll server
jclear    # Clear Jekyll cache only
jbuild    # Build site only (no serve)
jprod     # Production build
gac "msg" # Git add, commit with message
gap       # Git add, commit, and push
```

## 🛠️ Setup Options

### Option 1: Manual (Simple)
```bash
# Every time you enter this directory, run:
source ./setup-aliases.sh
```

### Option 2: Automatic with direnv (Advanced)
```bash
# Install direnv first
brew install direnv

# Add to your ~/.zshrc
echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc

# Restart shell, then in this directory:
direnv allow
```

## 🎯 Usage Examples

```bash
# Your main use case - full rebuild
rebuild

# Quick restart without clearing cache  
jstop && jstart

# Clear cache and build for production
jclear && jprod

# Quick git workflow
gac "Fixed author image brightness" && git push
```
