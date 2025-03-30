#!/bin/bash

git config --global user.name "fukumasa sugawa"
git config --global user.email "fuku1223sugawa@gmail.com"
git config --global alias.glogone "!git log --pretty=format:'%h %s %an'"
echo "✅ Git ユーザー設定が完了しました！"
echo "👤 ユーザー:"
git config --global user.name

echo "📧 アドレス:"
git config --global user.email

echo "🔗 エイリアス:"
git config --global alias.glogone
