# Claude Learning Kit

A portable set of Claude Code skills, rules, commands, and a structured curriculum designed for developers who want to **learn from AI-assisted development**, not just vibecode.

## Who is this for?

Developers transitioning into fullstack — especially those coming from a backend-heavy background (Rails, Django, etc.) who want to grow into frontend, UI/UX thinking, and light DevOps — without skipping the understanding.

## What's included

```
learning-kit/
├── README.md
├── install.sh
├── uninstall.sh
├── recommended-plugins.md
│
├── claude-md/
│   └── CLAUDE.md                     # Project-level rules and personality
│
├── skills/
│   ├── learning-mode/SKILL.md        # Core: explains decisions, bridges to Rails
│   ├── explain-code/SKILL.md         # Deep explanations with analogies
│   ├── review-my-code/SKILL.md       # Code review that teaches
│   └── concept-bridge/SKILL.md       # Maps concepts between frameworks
│
├── commands/
│   ├── why.md                        # /why — explain last decision
│   ├── teach.md                      # /teach — deep dive into a concept
│   ├── compare.md                    # /compare — Rails vs current stack
│   ├── review.md                     # /review — learning-focused code review
│   └── checkpoint.md                 # /checkpoint — session learning summary
│
└── curriculum/
    ├── CURRICULUM.md                 # Full 3-project phased curriculum
    ├── progress-template.md          # Progress tracker template
    └── commands/
        └── evaluate.md              # /evaluate — phase evaluation gate
```

## Quick start

```bash
# Clone your private repo
git clone git@github.com:YOUR_USER/learning-kit.git
cd learning-kit
chmod +x install.sh uninstall.sh

# Install globally (available in all projects)
./install.sh --global

# Or install into a specific project
cd ~/my-project
/path/to/learning-kit/install.sh --project

# Remove from a project
/path/to/learning-kit/uninstall.sh --project

# Remove globally
/path/to/learning-kit/uninstall.sh --global
```

## What gets installed where

### `--global` (into `~/.claude/`)
- All skills → `~/.claude/skills/`
- All commands → `~/.claude/commands/`
- Active in every Claude Code session

### `--project` (into `./.claude/` + project root)
- All skills → `./.claude/skills/`
- All commands → `./.claude/commands/`
- `CLAUDE.md` → project root
- `CURRICULUM.md` → `docs/`
- `progress.md` → project root
- Adds a `.gitignore` section for all of the above (removed on uninstall)

The `.gitignore` block looks like this:

```
# --- learning-kit ---
.claude/
CLAUDE.md
docs/CURRICULUM.md
progress.md
# --- end learning-kit ---
```

## Available commands

| Command | What it does |
|---------|-------------|
| `/why` | Explain Claude's last decision or code generation |
| `/teach <concept>` | Deep dive into any concept, bridged to Rails |
| `/compare <pattern>` | Side-by-side Rails vs current stack comparison |
| `/review` | Review recent code through a learning lens |
| `/checkpoint` | Summarize what you've learned this session |
| `/evaluate <phase>` | Run curriculum phase evaluation gate |

## Using it on any existing repo

The kit isn't only for the curriculum. You can drop it into any repo you're actively learning from, use it while you explore or contribute, then remove it cleanly when you're done — leaving no trace in git history.

```bash
# Inside any repo you're working in
cd ~/projects/some-existing-repo
~/code/learning-kit/install.sh --project

# Use /why, /teach, /review, /checkpoint as you work...

# When done, remove everything it added
~/code/learning-kit/uninstall.sh --project
```

The `.gitignore` entries are added automatically so the installed files never show up as untracked changes. Uninstalling removes those entries too.

> **Warning:** The install copies `CLAUDE.md` into the project root, which is how Claude picks up the learning-mode instructions. If the repo already has a `CLAUDE.md`, the installer will back it up before overwriting — but review the backup before continuing, since that file may contain rules the project depends on.

## Starting a curriculum project

Each curriculum project lives in its own directory, separate from this repo. Here's the setup flow:

```bash
# 1. Create a directory for your project
mkdir ~/projects/bookmarks-manager
cd ~/projects/bookmarks-manager

# 2. Install the learning kit into it
~/code/learning-kit/install.sh --project

# 3. Open it in VS Code with Claude Code
code .
```

The `--project` install copies skills, commands, and `CURRICULUM.md` into `.claude/` and the project root so Claude has all the learning context when you open that directory.

Once inside the project, start Claude Code and tell it which phase you're on:

```
I'm starting Phase 1.1 of the curriculum. Let's build the vanilla JS bookmarks manager.
```

Use `/checkpoint` at the end of each session and `/evaluate 1.1` to run the evaluation gate before moving to the next phase.

> **Tip:** Once you finish a phase, run `/codebase-to-course` in Claude Code. It generates an interactive single-page HTML walkthrough of everything you built — useful for cementing understanding before moving on.

## The curriculum

See `curriculum/CURRICULUM.md` for the full 3-project learning path:

1. **Bookmarks Manager** — JavaScript, TypeScript, React, Tailwind, Hooks
2. **Team Task Board** — T3 Stack, Prisma, tRPC, Auth, Forms, Testing
3. **Recipe Platform** — Design systems, uploads, search, social, deployment

Each phase has evaluation gates. Use `/evaluate 1.3` (for example) to run them.

## Recommended external plugins

See [recommended-plugins.md](./recommended-plugins.md) for plugins that complement this kit.

## Design principles

1. **Opt-in** — install only where you want the learning experience
2. **Non-destructive** — backs up existing files before overwriting
3. **Portable** — works across machines via your private repo
4. **Layered** — global sets defaults, project installs can override
5. **Removable** — clean uninstall, prompts before deleting progress
