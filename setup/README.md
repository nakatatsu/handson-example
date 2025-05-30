# 事前準備

このドキュメントではClaude Code利用ハンズオンをWSL上のUbuntuで行うための設定についてご説明します。

なお🪟アイコンの項目はWindows、🐧アイコンがついた項目はUbuntu(Linux）側の作業を意味します。上から順番に実施していってください。

## Ubuntuと作業用ディレクトリの用意

### 🪟 Windows側

Windows側で、ホストとファイルを共有するためのディレクトリを下記で作成します。

```powershell
mkdir c:\repositories
```

WSL上にUbuntu-24.04をインストールします。

```powershell
wsl --install -d Ubuntu-24.04
```

### 🐧 Ubuntu側

同梱のrestrict_wsl_mount.sh の内容をコピペするなどして取得し、実行してください。作業用ディレクトリが作成されるほか、Cドライブ全体がマウントされないようになるはずです。

```
# 内容を確認し
cat restrict_wsl_mount.sh

# 問題なければ実行
bash restrict_wsl_mount.sh
```

#### ※ 🐧 restrict_wsl_mount.sh の代替

もしWSLを利用していない（EC2上のUbuntuなど）場合、代わりに作業用ディレクトリを下記コマンドで作成してください。

```
mkdir -p $HOME/repositories
```

### 🪟 Windows側

WindowsのPowershellからWSLを再起動します。

```powershell
wsl --shutdown
wsl -e /bin/true
```

## 🐧 ハンズオン用ファイルを取得し、ツール群をインストールする

下記コマンドでハンズオン用ファイルを取得ください。
ここから先はすべてUbuntu側で作業します。

```console
# 作業用ディレクトリに移動。
cd $HOME/repositories

# ハンズオン用ファイルを取得
git clone https://github.com/nakatatsu/handson-claude-code.git

# ツール類をインストール
cd handson-claude-code/setup
sudo apt update
sudo apt install -y ansible
ansible-playbook -i localhost, -c local --ask-become-pass configure_playbook.yml
```

終わったらWSLを再起動します

```powershell
wsl --shutdown
wsl -e /bin/true
```

## 🐧 初期設定を行う

### AWS

terraform planを行えるよう、権限を取得しておきます。権限はリードオンリーにしておくことを推奨します。

```console
# 各自の環境に合わせて設定してください
aws configure sso

# 必要なければスキップ
vi .aws/config

aws sso login
```

### ハンズオンに使う検証用リポジトリを用意する

ご自身のGithubアカウントで空のリポジトリを作成しておいてください。名前は任意です。
また、そのリポジトリに権限を限定したFine-grained personal access tokensをご作成ください。コードとプルリクエストのRead and Writeが必要です。

### GitHub

```console
# 内容を変えて入力してください
git config --global user.email "you@example.com"
git config --global user.name "Your Name"

# ご自身のトークンを
gh auth login

cd $HOME/repositories/handson-claude-code
git remote set-url origin https://github.com/nakatatsu/handson-example.git
git push -u origin main
```

### Claude

```console
claude /init
```
