# 🏛️ My Industrial Mac Architecture (Event-Driven)

山本理顕の「透明性」とディーター・ラムスの「機能美」を融合させ、macOSネイティブの `launchd` による完全イベント駆動バックアップを実現した、究極の開発環境。

## 🎨 Design Philosophy
- **Architecture (Riken Yamamoto)**: ガラスのような透明感と、境界線のない空間設計。
- **Industrial (Dieter Rams)**: 「Less, but better」。無彩色ベースにオレンジの機能的アクセント。
- **Zorin OS Essence**: 深いボケ（Blur）を伴うフロストガラスのような質感。

## 🚀 Tech Stack
- **Terminal**: [Ghostty](https://ghostty.org/) (GPU Accelerated / Zig)
- **Shell**: Zsh + [Starship](https://starship.rs/)
- **Node.js**: `fnm` + `pnpm` (Fast & Efficient)
- **Python**: `Miniforge` + `uv` (Hybrid Conda/Rust-pip)
- **Library**: OpenCASCADE, FastAPI, etc.

## 🤖 Automation (The Engine)
`launchd` が以下のイベントを常時監視し、変更があった瞬間に GitHub へ自動同期します。
- **Config**: `.zshrc`, `starship.toml`, `config.ghostty`
- **Apps**: `/Applications`, `/opt/homebrew/Caskroom` (GUI/CLIアプリの増減)

## 🛠️ Setup
1. **Homebrew**: `brew bundle` を実行して全アプリを復元。
2. **Setup Script**: `~/setup_dotfiles.sh` を配置。
3. **LaunchAgent**: `com.mote.dotfiles.plist` をロード。

```bash
launchctl load ~/Library/LaunchAgents/com.mote.dotfiles.plist
