#!/bin/bash

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <version>"
    echo "Example: $0 0.5.2"
    exit 1
fi

VERSION=$1
FORMULA_FILE="Formula/picordm.rb"

echo "Updating picordm to version $VERSION..."

TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

echo "Downloading release files..."
curl -sLO "https://github.com/osdodo/picordm/releases/download/v${VERSION}/picordm-v${VERSION}-macos-aarch64.tar.gz"
curl -sLO "https://github.com/osdodo/picordm/releases/download/v${VERSION}/picordm-v${VERSION}-macos-x86_64.tar.gz"
curl -sLO "https://github.com/osdodo/picordm/releases/download/v${VERSION}/picordm-v${VERSION}-linux-arm64.tar.gz"
curl -sLO "https://github.com/osdodo/picordm/releases/download/v${VERSION}/picordm-v${VERSION}-linux-x86_64.tar.gz"

echo "Calculating SHA256 checksums..."
MACOS_AARCH64_SHA=$(shasum -a 256 "picordm-v${VERSION}-macos-aarch64.tar.gz" | awk '{print $1}')
MACOS_X86_64_SHA=$(shasum -a 256 "picordm-v${VERSION}-macos-x86_64.tar.gz" | awk '{print $1}')
LINUX_ARM64_SHA=$(shasum -a 256 "picordm-v${VERSION}-linux-arm64.tar.gz" | awk '{print $1}')
LINUX_X86_64_SHA=$(shasum -a 256 "picordm-v${VERSION}-linux-x86_64.tar.gz" | awk '{print $1}')

cd - > /dev/null
rm -rf "$TEMP_DIR"

echo ""
echo "SHA256 checksums:"
echo "  macOS aarch64: $MACOS_AARCH64_SHA"
echo "  macOS x86_64:  $MACOS_X86_64_SHA"
echo "  Linux arm64:   $LINUX_ARM64_SHA"
echo "  Linux x86_64:  $LINUX_X86_64_SHA"
echo ""

echo "Updating $FORMULA_FILE..."

sed -i '' "s/version \".*\"/version \"$VERSION\"/" "$FORMULA_FILE"

sed -i '' "/macos-aarch64.tar.gz/s|v[0-9.]*|v$VERSION|g" "$FORMULA_FILE"
sed -i '' "/macos-aarch64.tar.gz/,/sha256/s/sha256 \".*\"/sha256 \"$MACOS_AARCH64_SHA\"/" "$FORMULA_FILE"

sed -i '' "/macos-x86_64.tar.gz/s|v[0-9.]*|v$VERSION|g" "$FORMULA_FILE"
sed -i '' "/macos-x86_64.tar.gz/,/sha256/s/sha256 \".*\"/sha256 \"$MACOS_X86_64_SHA\"/" "$FORMULA_FILE"

sed -i '' "/linux-arm64.tar.gz/s|v[0-9.]*|v$VERSION|g" "$FORMULA_FILE"
sed -i '' "/linux-arm64.tar.gz/,/sha256/s/sha256 \".*\"/sha256 \"$LINUX_ARM64_SHA\"/" "$FORMULA_FILE"

sed -i '' "/linux-x86_64.tar.gz/s|v[0-9.]*|v$VERSION|g" "$FORMULA_FILE"
sed -i '' "/linux-x86_64.tar.gz/,/sha256/s/sha256 \".*\"/sha256 \"$LINUX_X86_64_SHA\"/" "$FORMULA_FILE"

echo "✅ Successfully updated $FORMULA_FILE to version $VERSION"
echo ""
echo "Next steps:"
echo "  git add $FORMULA_FILE"
echo "  git commit -m \"chore: bump version to $VERSION\""
