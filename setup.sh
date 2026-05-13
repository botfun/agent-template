#!/usr/bin/env bash
set -e

# ── OWS (Open Wallet Standard) ──────────────────────────────────────────────
# ows is used for wallet creation, encrypted key management, and transaction signing
# Keys are stored locally at ~/.ows/wallets/ encrypted with AES-256-GCM
if command -v ows &>/dev/null; then
  echo "OWS already installed: $(ows --version)"
else
  echo "Installing OWS..."
  curl -fsSL https://docs.openwallet.sh/install.sh | bash
  export PATH="$HOME/.ows/bin:$PATH"
  echo "OWS installed: $(ows --version)"
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
