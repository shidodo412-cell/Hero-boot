#!/bin/sh

# Gradle Wrapper bootstrap script for Hero Boot.
# This script downloads Gradle 8.9 and runs the requested task.
# GitHub Actions uses its own Gradle setup, so the wrapper is optional there.

APP_HOME=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
DIST_URL="https://services.gradle.org/distributions/gradle-8.9-bin.zip"
DIST_DIR="${GRADLE_USER_HOME:-$HOME/.gradle}/wrapper/dists/gradle-8.9-bin"

if command -v gradle >/dev/null 2>&1; then
  exec gradle "$@"
fi

if command -v curl >/dev/null 2>&1; then
  DOWNLOADER="curl -L --fail --silent --show-error"
elif command -v wget >/dev/null 2>&1; then
  DOWNLOADER="wget -q -O -"
else
  echo "Gradle is not installed and curl/wget is unavailable."
  exit 1
fi

mkdir -p "$DIST_DIR"
TMP_ZIP="$DIST_DIR/gradle-8.9-bin.zip"
TMP_DIR="$DIST_DIR/gradle-8.9"

if [ ! -x "$TMP_DIR/bin/gradle" ]; then
  echo "Downloading Gradle 8.9..."
  if command -v curl >/dev/null 2>&1; then
    curl -L --fail --silent --show-error "$DIST_URL" -o "$TMP_ZIP"
  else
    wget -q "$DIST_URL" -O "$TMP_ZIP"
  fi
  rm -rf "$TMP_DIR"
  mkdir -p "$DIST_DIR/extract"
  unzip -q "$TMP_ZIP" -d "$DIST_DIR/extract" || {
    echo "unzip is required to bootstrap the wrapper."
    exit 1
  }
  mv "$DIST_DIR/extract/gradle-8.9" "$TMP_DIR"
  rm -rf "$DIST_DIR/extract" "$TMP_ZIP"
fi

exec "$TMP_DIR/bin/gradle" "$@"
