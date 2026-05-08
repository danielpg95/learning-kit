#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MARKER=".learning-kit-installed"

usage() {
  echo "Usage: $(basename "$0") [--global | --project]"
  echo ""
  echo "  --global   Install into ~/.claude/ (applies to all projects)"
  echo "  --project  Install into ./.claude/ (current project only)"
  exit 1
}

backup_if_exists() {
  local target="$1"
  if [ -e "$target" ]; then
    local backup="${target}.backup.$(date +%Y%m%d%H%M%S)"
    echo "  ⚠  Backing up existing: $target → $backup"
    cp -r "$target" "$backup"
  fi
}

install_to() {
  local dest="$1"
  local claude_md_dest="$2"

  echo "📦 Installing learning kit to: $dest"
  echo ""

  # Create directories
  mkdir -p "$dest/skills"
  mkdir -p "$dest/commands"

  # Install skills
  for skill_dir in "$SCRIPT_DIR"/skills/*/; do
    skill_name=$(basename "$skill_dir")
    target_dir="$dest/skills/$skill_name"
    backup_if_exists "$target_dir"
    mkdir -p "$target_dir"
    cp "$skill_dir/SKILL.md" "$target_dir/SKILL.md"
    echo "  ✅ Skill: $skill_name"
  done

  # Install commands
  for cmd_file in "$SCRIPT_DIR"/commands/*.md; do
    cmd_name=$(basename "$cmd_file")
    target_file="$dest/commands/$cmd_name"
    backup_if_exists "$target_file"
    cp "$cmd_file" "$target_file"
    echo "  ✅ Command: /$(basename "$cmd_name" .md)"
  done

  # Install CLAUDE.md (only for project installs)
  if [ -n "$claude_md_dest" ]; then
    backup_if_exists "$claude_md_dest/CLAUDE.md"
    cp "$SCRIPT_DIR/claude-md/CLAUDE.md" "$claude_md_dest/CLAUDE.md"
    echo "  ✅ CLAUDE.md"
  fi

  # Leave a marker for clean uninstall
  echo "$SCRIPT_DIR" > "$dest/$MARKER"

  echo ""
  echo "🎓 Learning kit installed. Skills and commands are now active."
  echo "   Run 'uninstall.sh' with the same flag to remove."
}

# ── Main ──────────────────────────────────────────────

[ $# -eq 0 ] && usage

case "$1" in
  --global)
    install_to "$HOME/.claude" ""
    ;;
  --project)
    if [ ! -d ".git" ] && [ ! -f "Gemfile" ] && [ ! -f "package.json" ]; then
      echo "⚠  This doesn't look like a project root. Continue anyway? (y/N)"
      read -r confirm
      [[ "$confirm" =~ ^[Yy]$ ]] || exit 0
    fi
    install_to "./.claude" "$(pwd)"
    ;;
  *)
    usage
    ;;
esac