#!/usr/bin/env bash
set -euo pipefail

MARKER=".learning-kit-installed"

SKILLS=(learning-mode explain-code review-my-code concept-bridge)
COMMANDS=(why.md teach.md compare.md review.md checkpoint.md evaluate.md)

usage() {
  echo "Usage: $(basename "$0") [--global | --project]"
  echo ""
  echo "  --global   Remove from ~/.claude/"
  echo "  --project  Remove from ./.claude/ and project files"
  exit 1
}

uninstall_from() {
  local dest="$1"
  local claude_md_dest="$2"

  if [ ! -f "$dest/$MARKER" ]; then
    echo "❌ Learning kit not found at: $dest"
    echo "   (No $MARKER marker detected)"
    exit 1
  fi

  echo "🧹 Removing learning kit from: $dest"
  echo ""

  # ── Remove skills ──────────────────────────────────
  for skill in "${SKILLS[@]}"; do
    if [ -d "$dest/skills/$skill" ]; then
      rm -rf "$dest/skills/$skill"
      echo "  🗑  Skill: $skill"
    fi
  done

  # ── Remove commands ────────────────────────────────
  for cmd in "${COMMANDS[@]}"; do
    if [ -f "$dest/commands/$cmd" ]; then
      rm "$dest/commands/$cmd"
      echo "  🗑  Command: /$(basename "$cmd" .md)"
    fi
  done

  # ── Remove project files ───────────────────────────
  if [ -n "$claude_md_dest" ]; then
    # CLAUDE.md
    if [ -f "$claude_md_dest/CLAUDE.md" ]; then
      echo ""
      echo "  ⚠  Remove CLAUDE.md from project root? (y/N)"
      read -r confirm
      if [[ "$confirm" =~ ^[Yy]$ ]]; then
        rm "$claude_md_dest/CLAUDE.md"
        echo "  🗑  CLAUDE.md removed"
      else
        echo "  ⏭  CLAUDE.md kept"
      fi
    fi

    # Curriculum doc
    if [ -f "$claude_md_dest/docs/CURRICULUM.md" ]; then
      rm "$claude_md_dest/docs/CURRICULUM.md"
      rmdir "$claude_md_dest/docs" 2>/dev/null || true
      echo "  🗑  docs/CURRICULUM.md removed"
    fi

    # Progress tracker
    if [ -f "$claude_md_dest/progress.md" ]; then
      echo ""
      echo "  ⚠  Remove progress.md? This contains your learning history. (y/N)"
      read -r confirm
      if [[ "$confirm" =~ ^[Yy]$ ]]; then
        rm "$claude_md_dest/progress.md"
        echo "  🗑  progress.md removed"
      else
        echo "  ⏭  progress.md kept"
      fi
    fi
  fi

  # ── Remove marker ─────────────────────────────────
  rm "$dest/$MARKER"

  # ── Clean up empty dirs ────────────────────────────
  rmdir "$dest/skills" 2>/dev/null || true
  rmdir "$dest/commands" 2>/dev/null || true

  echo ""
  echo "✅ Learning kit removed."
}

# ── Main ──────────────────────────────────────────────

[ $# -eq 0 ] && usage

case "$1" in
  --global)
    uninstall_from "$HOME/.claude" ""
    ;;
  --project)
    uninstall_from "./.claude" "$(pwd)"
    ;;
  *)
    usage
    ;;
esac
