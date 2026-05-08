# Recommended External Plugins

These complement the learning kit. Install separately via Claude Code.

## Tier 1 — Install immediately

```bash
# Task breakdown and planning
claude skills add eyaltoledano/taskmaster

# Forces Claude to think critically about its own suggestions
claude skills add abagames/criticalthink

# Turns any codebase into an interactive learning course
claude install-skill https://github.com/zarazhangrui/codebase-to-course
```

**Why these three:**
- Taskmaster prevents you from jumping into code without a plan
- Critical Think prevents Claude from giving you lazy or generic answers
- Codebase to Course closes the loop — after building, you learn what was built

## Tier 2 — Add when starting frontend work

```bash
# Browser integration — Claude can see your app
claude skills add browserbase/browser-tools

# TDD workflows and dev best practices
claude skills add obra/superpowers-dev
```

## Tier 3 — Add for design awareness

```bash
# Anthropic's official frontend design skill (277k+ installs)
# Pushes Claude to make bold, intentional design choices
claude skills add anthropics/frontend-design

# UI/UX Pro Max — searchable design database
# 50+ UI styles, 97 color palettes, 57 font pairings, 99 UX guidelines
claude skills add nextlevelbuilder/ui-ux-pro-max-skill
```

## Tier 4 — Add for DevOps and deployment

```bash
# 66 skills covering infra, CI/CD, security, and more
claude skills add jeffallan/fullstack-dev-skills
```

## Tier 5 — Add after a month or two

```bash
# LSP integration — gives Claude real type information
# (heavy, but makes Claude much smarter on large codebases)
# Check for latest version/name before installing
```

## Rule of thumb

> Don't install more than 3-5 plugins at once. Each one adds to your
> context window baseline. Less noise = better signal.
>
> Start with Tier 1. Add the rest as you reach the relevant
> curriculum phase.
