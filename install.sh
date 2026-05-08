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

  # ── Skills ──────────────────────────────────────────
  for skill_dir in "$SCRIPT_DIR"/skills/*/; do
    [ -d "$skill_dir" ] || continue
    skill_name=$(basename "$skill_dir")
    target_dir="$dest/skills/$skill_name"
    backup_if_exists "$target_dir"
    mkdir -p "$target_dir"
    cp "$skill_dir/SKILL.md" "$target_dir/SKILL.md"
    echo "  ✅ Skill: $skill_name"
  done

  # ── Commands ────────────────────────────────────────
  for cmd_file in "$SCRIPT_DIR"/commands/*.md; do
    [ -f "$cmd_file" ] || continue
    cmd_name=$(basename "$cmd_file")
    target_file="$dest/commands/$cmd_name"
    backup_if_exists "$target_file"
    cp "$cmd_file" "$target_file"
    echo "  ✅ Command: /$(basename "$cmd_name" .md)"
  done

  # ── Curriculum commands ─────────────────────────────
  if [ -d "$SCRIPT_DIR/curriculum/commands" ]; then
    for cmd_file in "$SCRIPT_DIR"/curriculum/commands/*.md; do
      [ -f "$cmd_file" ] || continue
      cmd_name=$(basename "$cmd_file")
      target_file="$dest/commands/$cmd_name"
      backup_if_exists "$target_file"
      cp "$cmd_file" "$target_file"
      echo "  ✅ Command: /$(basename "$cmd_name" .md) (curriculum)"
    done
  fi

  # ── CLAUDE.md (project installs only) ──────────────
  if [ -n "$claude_md_dest" ]; then
    backup_if_exists "$claude_md_dest/CLAUDE.md"
    cp "$SCRIPT_DIR/claude-md/CLAUDE.md" "$claude_md_dest/CLAUDE.md"
    echo "  ✅ CLAUDE.md"
  fi

  # ── Curriculum files (project installs only) ───────
  if [ -n "$claude_md_dest" ]; then
    mkdir -p "$claude_md_dest/docs"
    if [ -f "$SCRIPT_DIR/curriculum/CURRICULUM.md" ]; then
      backup_if_exists "$claude_md_dest/docs/CURRICULUM.md"
      cp "$SCRIPT_DIR/curriculum/CURRICULUM.md" "$claude_md_dest/docs/CURRICULUM.md"
      echo "  ✅ Curriculum → docs/CURRICULUM.md"
    fi
    if [ -f "$SCRIPT_DIR/curriculum/progress-template.md" ]; then
      # Only copy progress template if progress.md doesn't exist yet
      if [ ! -f "$claude_md_dest/progress.md" ]; then
        cp "$SCRIPT_DIR/curriculum/progress-template.md" "$claude_md_dest/progress.md"
        echo "  ✅ Progress tracker → progress.md"
      else
        echo "  ⏭  progress.md already exists (kept)"
      fi
    fi
  fi

  # ── Marker for clean uninstall ─────────────────────
  echo "$SCRIPT_DIR" > "$dest/$MARKER"

  echo ""
  echo "🎓 Learning kit installed!"
  echo ""
  echo "   Available commands:"
  echo "     /why         — explain Claude's last decision"
  echo "     /teach       — deep dive into a concept"
  echo "     /compare     — Rails vs current stack comparison"
  echo "     /review      — review code through a learning lens"
  echo "     /checkpoint  — summarize what you've learned"
  echo "     /evaluate    — run phase evaluation (curriculum)"
  echo ""
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
