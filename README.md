# 🏛️ Industrial Architecture Environment (Event-Driven)

macOSのネイティブ機能を用いた「完全イベント駆動バックアップ」を実現した、インフラストラクチャ・アズ・コード (IaC) の極致。
建築的な「空間の透明性」と、工業デザインの「機能美」を融合させ、最小限のノイズで最大のパフォーマンスを発揮する開発環境です。

## 🎨 Design Philosophy (設計の美学)

特定の様式に依存せず、普遍的な「使いやすさ」と「美しさ」を追求しています。

- **Architectural Minimalism**: 境界線のない透明感。タイトルバーを排除し、深いボケ（Blur）効果によってデスクトップ環境とシームレスに調和。
- **Industrial Functionalism**: 「より少なく、しかしより良く」。無彩色ベースのテーマに、機能的アクセントカラー（Orange）を配置。
- **Universal Glass-morphism**: 磨りガラスのような質感を伴う、硬質でモダンなインターフェース。

## 🏗️ The Stack (技術スタック)

| Layer | Technology | Key Features |
| :--- | :--- | :--- |
| **Terminal** | `Ghostty` | GPUレンダリングによる高速描画と高いカスタマイズ性。 |
| **Shell** | `Zsh` + `Starship` | 最小限のコンテキストのみを提示するミニマルなUI。 |
| **Node.js** | `fnm` + `pnpm` | Rust製マネージャーによる高速なバージョン管理と効率的なディスク利用。 |
| **Python** | `Miniforge` + `uv` | バイナリ依存の隔離と、Rust製ツールによる爆速なパッケージ管理のハイブリッド。 |
| **Infra** | `Homebrew` + `mas` | 全てのCLI、GUIアプリ、Storeアプリをコードで統制。 |

## 🔄 Zero-Touch Maintenance (イベント駆動同期)

`launchd` がシステムの状態を監視し、以下の変更を検知した瞬間に GitHub へ同期します。

1. **設定の更新**: `.zshrc`, `starship.toml`, 設定ファイルの保存時。
2. **アプリの増減**: アプリケーションフォルダ、またはパッケージマネージャーの管理下で構成が変化した時。

## 🛠️ Setup & Restore

```bash
# 1. リポジトリの取得
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles

# 2. 全アプリと構成の復元
brew bundle

# 3. 同期エンジンの起動
launchctl load ~/Library/LaunchAgents/com.env.sync.plist
