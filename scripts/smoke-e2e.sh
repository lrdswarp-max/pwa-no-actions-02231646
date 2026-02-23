#!/usr/bin/env sh
set -eu

BASE_URL="${1:-http://127.0.0.1:3000}"

echo "Checking $BASE_URL/"
HOME_HTML="$(curl -fsSL "$BASE_URL/")"
echo "$HOME_HTML" | rg -q "PWA Termux Starter"

echo "Checking $BASE_URL/auth"
AUTH_HTML="$(curl -fsSL "$BASE_URL/auth")"
echo "$AUTH_HTML" | rg -q ">Auth<"
echo "$AUTH_HTML" | rg -q "Send magic link"

echo "Smoke check passed."
