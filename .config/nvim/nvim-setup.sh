#!/bin/bash

# Vim-Plug をダウンロード
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo "✅ Vim-Plug インストール完了"

# プラグインをインストール（headlessで）
echo "🔄 プラグインをインストール中..."
nvim --headless +PlugInstall +qall

echo "🎉 Neovim の初期セットアップ完了！"
