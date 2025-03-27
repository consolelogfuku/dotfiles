#!/bin/bash

# 現在のスクリプトのディレクトリを基準に
BREW_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "🔧 Homebrew 初期設定を開始します..."

# Homebrew がインストールされているか確認
if ! command -v brew >/dev/null 2>&1; then
  echo "🧪 Homebrewが見つかりません。インストールします..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ Homebrew はすでにインストールされています。"
fi

# タップの復元
if [ -f "$BREW_DIR/brew-taps.txt" ]; then
  echo "📦 brew taps を復元中..."
  xargs brew tap < "$BREW_DIR/brew-taps.txt"
else
  echo "⚠️ brew-taps.txt が見つかりません"
fi

# 通常パッケージの復元
if [ -f "$BREW_DIR/brew-packages.txt" ]; then
  echo "📦 brew install パッケージを復元中..."
  xargs brew install < "$BREW_DIR/brew-packages.txt"
else
  echo "⚠️ brew-packages.txt が見つかりません"
fi

# Cask パッケージの復元
if [ -f "$BREW_DIR/brew-casks.txt" ]; then
  echo "🍺 brew install --cask パッケージを復元中..."
  xargs brew install --cask < "$BREW_DIR/brew-casks.txt"
else
  echo "⚠️ brew-casks.txt が見つかりません"
fi

echo "🎉 Homebrew 初期設定完了！"

