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

echo "Setup complete. Tools ready for bot.fun trading."
