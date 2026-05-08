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

## Available commands

| Command | What it does |
|---------|-------------|
| `/why` | Explain Claude's last decision or code generation |
| `/teach <concept>` | Deep dive into any concept, bridged to Rails |
| `/compare <pattern>` | Side-by-side Rails vs current stack comparison |
| `/review` | Review recent code through a learning lens |
| `/checkpoint` | Summarize what you've learned this session |
| `/evaluate <phase>` | Run curriculum phase evaluation gate |

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
