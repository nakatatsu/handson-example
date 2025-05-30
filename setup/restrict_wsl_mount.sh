#!/usr/bin/env bash

#
# WSLを利用している場合に、Ubuntuから閲覧できるファイルを制限するためのスクリプト
#
# - WSLを利用していない場合は実施不要です。
# - 一度だけ実行してください。
# - 実行後はWSLを再起動してください。
# 

set -euo pipefail

# ホスト側に共有する予定のディレクトリが存在するか確認
if [ ! -d "/mnt/c/repositories" ]; then
    echo "警告: C:/repositories が存在しません"
    exit 1
fi

# ホストと共有する予定のディレクトリを作成
sudo mkdir -p /mnt/repositories

# エイリアス
ln -s /mnt/repositories $HOME/repositories

sudo cp /etc/wsl.conf /etc/wsl.conf.backup

# 上書きするため注意
sudo tee /etc/wsl.conf > /dev/null << 'EOF'
[automount]
enabled = false

[interop]
appendWindowsPath = false
EOF

sudo tee -a /etc/fstab > /dev/null << 'EOF'
C:/repositories /mnt/repositories drvfs metadata,notime,gid=1000,uid=1000,defaults 0 0
EOF

