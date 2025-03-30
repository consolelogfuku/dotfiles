# rootにファイルを移す
cp -rn .config/ ../
cp -n .tmux.conf ../
cp -n .zshrc ../


# 各種setupのスクリプトを実行
BREW_SETUP_PATH=$(find . -name 'brew-setup.sh')
chmod 744 ${BREW_SETUP_PATH}
echo "🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀brew-setup.shを実行🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀"
${BREW_SETUP_PATH}


GIT_SETUP_PATH=$(find . -name 'git-setup.sh')
chmod 744 ${GIT_SETUP_PATH}
echo "🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀git-setup.shを実行🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀"
${GIT_SETUP_PATH}

NVIM_SETUP_PATH=$(find . -name 'nvim-setup.sh')
chmod 744 ${NVIM_SETUP_PATH}
echo "🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀nvim-setup.shを実行🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀"
${NVIM_SETUP_PATH}

# macの設定、英語のキー押しっぱでも連続入力を受け付ける(要PC再起動)
defaults write -g ApplePressAndHoldEnabled -bool false

