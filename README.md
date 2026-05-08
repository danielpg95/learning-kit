# learning-kit
A set of Agent, skills, and rules to guide my backend oriented experience into the frontend path successfully

## Structure
```
learning-kit/
├── README.md
├── install.sh
├── uninstall.sh
├── claude-md/
│   └── CLAUDE.md
├── skills/
│   ├── learning-mode/SKILL.md
│   ├── explain-code/SKILL.md
│   ├── review-my-code/SKILL.md
│   └── concept-bridge/SKILL.md
├── commands/
│   ├── why.md
│   ├── teach.md
│   ├── compare.md
│   ├── review.md
│   └── checkpoint.md
└── recommended-plugins.md
```

## Usage

### Run under /learning-kit
`chmod +x install.sh uninstall.sh`

### Run it in a project
```
# New project, want learning mode
cd my-new-project
~/learning-kit/install.sh --project

# Done learning, want speed
~/learning-kit/uninstall.sh --project
```