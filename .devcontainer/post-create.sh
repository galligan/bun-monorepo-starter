#!/bin/bash

# Post-creation setup script for devcontainer
# This script runs after the container is created but before the first use

set -e

echo "🚀 Setting up development environment..."

# Ensure we're in the right directory
cd /workspace

# Install dependencies if package.json exists
if [ -f "package.json" ]; then
    echo "📦 Installing dependencies with Bun..."
    bun install
    echo "✅ Dependencies installed successfully"
else
    echo "⚠️  No package.json found, skipping dependency installation"
fi

# Set up git hooks if lefthook is available
if command -v lefthook &> /dev/null && [ -f "lefthook.yml" ]; then
    echo "🪝 Setting up Git hooks with Lefthook..."
    lefthook install
    echo "✅ Git hooks installed successfully"
fi

# Verify all tools are working
echo "🔧 Verifying development tools..."

# Check Bun
if bun --version > /dev/null 2>&1; then
    echo "✅ Bun: $(bun --version)"
else
    echo "❌ Bun not working properly"
fi

# Check Node.js
if node --version > /dev/null 2>&1; then
    echo "✅ Node.js: $(node --version)"
else
    echo "❌ Node.js not working properly"
fi

# Check TypeScript
if npx tsc --version > /dev/null 2>&1; then
    echo "✅ TypeScript: $(npx tsc --version)"
else
    echo "❌ TypeScript not working properly"
fi

# Check Biome (via Ultracite)
if bun x ultracite@latest --version > /dev/null 2>&1; then
    echo "✅ Ultracite/Biome available"
else
    echo "❌ Ultracite/Biome not working properly"
fi

# Check Prettier
if npx prettier --version > /dev/null 2>&1; then
    echo "✅ Prettier: $(npx prettier --version)"
else
    echo "❌ Prettier not working properly"
fi

# Check MarkdownLint
if npx markdownlint-cli2 --version > /dev/null 2>&1; then
    echo "✅ MarkdownLint: $(npx markdownlint-cli2 --version)"
else
    echo "❌ MarkdownLint not working properly"
fi

# Check Stylelint
if npx stylelint --version > /dev/null 2>&1; then
    echo "✅ Stylelint: $(npx stylelint --version)"
else
    echo "❌ Stylelint not working properly"
fi

# Set up shell aliases for convenience
echo "🔧 Setting up convenient aliases..."
cat >> ~/.bashrc << 'EOF'

# Development aliases
alias dev='bun run dev'
alias build='bun run build'
alias test='bun run test'
alias lint='bun run lint'
alias format='bun run lint:fix'
alias typecheck='bun run typecheck'

# Common commands
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'

EOF

echo "✅ Development environment setup complete!"
echo ""
echo "🎉 Your devcontainer is ready for development!"
echo ""
echo "Quick commands:"
echo "  bun run dev      - Start development servers"
echo "  bun run build    - Build all packages"
echo "  bun run lint     - Run all linters"
echo "  bun run test     - Run tests"
echo ""
echo "Happy coding! 🚀"