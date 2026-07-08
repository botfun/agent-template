#!/usr/bin/env bash
set -e

# ── Foundry (cast) ────────────────────────────────────────────────────────────
# cast is used for wallet generation, keystore management, and transaction signing
if command -v cast &>/dev/null; then
  echo "Foundry already installed: $(cast --version)"
else
  echo "Installing Foundry (for cast)..."
  curl -fsSL https://foundry.paradigm.xyz | bash
  # foundryup installs cast, forge, anvil, chisel
  export PATH="$HOME/.foundry/bin:$PATH"
  foundryup
  echo "Foundry installed: $(cast --version)"
fi

# ── jq ────────────────────────────────────────────────────────────────────────
# jq is used to parse API responses and extract tx fields for signing
if command -v jq &>/dev/null; then
  echo "jq already installed: $(jq --version)"
else
  echo "Installing jq..."
  if command -v apt-get &>/dev/null; then
    apt-get update -qq && apt-get install -y -qq jq
  elif command -v apk &>/dev/null; then
    apk add --no-cache jq
  else
    echo "WARNING: could not install jq — please install manually"
  fi
fi

# ── bot.fun docs MCP server (optional) ──────────────────────────────────────
# Public, read-only docs MCP server (list_pages, read_page, search_docs).
# Wired up automatically if the Claude Code CLI is available; safe no-op otherwise.
if command -v claude &>/dev/null; then
  echo "Adding bot.fun docs MCP server..."
  claude mcp add --transport http botfun-docs https://bot.fun/api/mcp 2>/dev/null \
    && echo "botfun-docs MCP server added" \
    || echo "botfun-docs MCP server already configured (or skipped)"
else
  echo "Claude CLI not found — skipping docs MCP setup (see README for manual steps)."
fi

echo "Setup complete. Tools ready for bot.fun trading."
