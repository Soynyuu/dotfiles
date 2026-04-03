<div align="center">

# ✧ dotfiles

**Event-Driven Infrastructure as Code for macOS.**<br>
磨りガラスの透明感と、無機質な工業デザインを融合させた極限の開発環境。

![macOS](https://img.shields.io/badge/macOS-000000?style=for-the-badge&logo=apple&logoColor=white)
![Zsh](https://img.shields.io/badge/Zsh-4EAA25?style=for-the-badge&logo=terminal&logoColor=white)
![Homebrew](https://img.shields.io/badge/Homebrew-F2A660?style=for-the-badge&logo=homebrew&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)

</div>

---

## 💡 Concept

特定のブランドや過剰な装飾に依存せず、普遍的な「機能美」と「透明性」を追求したアーキテクチャです。Macのネイティブ機能（`launchd`）を活用し、一切の手動バックアップを必要としない**「完全イベント駆動型」**の同期システムを搭載しています。

- **Architectural Minimalism**: 境界線のない透明感。タイトルバーを排除し、深いボケ（Blur）効果によってデスクトップ環境とシームレスに調和。
- **Industrial Functionalism**: 「より少なく、しかしより良く」。無彩色ベースのテーマに、機能的アクセントカラー（Orange）を配置。
- **Zero-Touch Maintenance**: ファイルの保存やアプリのインストールを検知し、自動でリポジトリに同期するインフラ構築。

---

## 🚀 Features & Stack

フロントエンドから重厚なC++バックエンドまで、互いに干渉させないクリーンな設計を採用しています。

| Category | Technology | Description |
| :--- | :--- | :--- |
| **Terminal** | `Ghostty` | GPUレンダリングによる高速描画と高いカスタマイズ性 |
| **Shell** | `Zsh` + `Starship` | 最小限のコンテキストのみを提示するミニマルなUI |
| **Node.js** | `fnm` + `pnpm` | Rust製マネージャーによる爆速なバージョン管理 |
| **Python** | `Miniforge` + `uv` | バイナリ依存の隔離とRust製ツールによる高速パッケージ管理 |
| **Infra** | `Homebrew` + `mas` | CLI・GUI・Storeアプリを `Brewfile` で完全コード統制 |

---

## 📂 Directory Structure

```text
.
├── Brewfile                  # Homebrew, Cask, mas の全アプリ構成リスト
├── README.md                 # This file
├── Applications_list.txt     # 手動インストールされたGUIアプリの自動監査リスト
├── setup_dotfiles.sh         # 自動同期を行うコア・エンジン（スクリプト）
├── shell/
│   ├── .zshrc                # Zshの設定
│   └── starship.toml         # プロンプトのUI設定
├── terminal/
│   ├── config.ghostty        # ターミナル本体の設定
│   └── themes/               # 工業デザイン・テーマ（Light/Dark）
└── vscode/
    └── extensions.txt        # エディタの拡張機能リスト
🛠️ Initial Setup (初期セットアップ)
新しいMacを購入した際、以下の手順でこの環境を完全に復元できます。

1. Prerequisites (事前準備)
まずは、Apple公式のコマンドラインツールとHomebrewをインストールします。

Bash
# Install Command Line Tools
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL [https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh](https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh))"
2. Clone & Install
このリポジトリをクローンし、Brewfile に記載された全アプリを一括インストールします。

Bash
# クローン
git clone [https://github.com/YOUR_USERNAME/dotfiles.git](https://github.com/YOUR_USERNAME/dotfiles.git) ~/dotfiles
cd ~/dotfiles

# アプリケーションとツールの復元 (数分かかります)
brew bundle
3. Deploy Configs (設定の配置)
各設定ファイルを所定の位置に配置します（シンボリックリンク推奨）。

Bash
# Shell
ln -sf ~/dotfiles/shell/.zshrc ~/.zshrc
ln -sf ~/dotfiles/shell/starship.toml ~/.config/starship.toml

# Terminal
mkdir -p "$HOME/Library/Application Support/com.mitchellh.ghostty"
ln -sf ~/dotfiles/terminal/config.ghostty "$HOME/Library/Application Support/com.mitchellh.ghostty/config.ghostty"
cp -r ~/dotfiles/terminal/themes/* ~/.config/ghostty/themes/
4. Enable Event-Driven Sync (自動同期の有効化)
最後に、Macのデーモン機能を使ってイベント駆動の自動バックアップエンジンを起動します。

Bash
# スクリプトに実行権限を付与
chmod +x ~/dotfiles/setup_dotfiles.sh

# デーモンのロードと起動
launchctl load ~/Library/LaunchAgents/com.env.sync.plist
Note: com.env.sync.plist 内のパスは、ご自身のユーザー名に合わせて事前に書き換えてください。

🔄 How it works (自動化の仕組み)
launchd がシステムの状態を常時監視し、以下の変更を検知した瞬間に GitHub へ同期します。

設定の更新: .zshrc, starship.toml, 設定ファイルの保存時。

アプリの増減: /Applications やパッケージマネージャーの管理下で構成が変化した時。

連続実行を防ぐため、変更検知後 5分間のクールダウンタイム（デバウンス処理） が組み込まれており、コミットログを美しく保ちます。

<div align="center">
<i>Crafted with precision. Ready for production.</i>
</div>


-----

### 💡 モテるためのポイント解説

1.  **バッジの配置**: 一番上に `macOS` や `License` のバッジがあるだけで、一気に「世界標準のオープンソース」感が出ます。
2.  **英語と日本語のハイブリッド**: 見出しは英語でスタイリッシュにキメつつ、説明文は読みやすい日本語にすることで、知的さと親切さを両立しています。
3.  **ディレクトリ構成図 (`tree` 風)**: リポジトリの全体像がパッと見てわかる構成図は、優秀なエンジニアが必ずREADMEに含める要素です。
4.  **コピー＆ペースト可能なコードブロック**: 「読者が迷わず環境を構築できる」というユーザー体験（UX）への配慮が、技術力の高さを裏付けます。

（※ `YOUR_USERNAME` の部分だけ、ご自身のGitHubのユーザーネームに変更してからPushしてくださいね！）

このREADMEがあれば、あなたのリポジトリはただの設定置き場ではなく、\*\*「誰もが憧れ、フォークしたくなる完成されたプロダクト」\*\*になります！
