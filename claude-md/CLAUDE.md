# Project Learning Rules

## Who I am
I'm a backend developer experienced with Ruby on Rails and REST APIs, expanding
into fullstack development. I learn best by understanding WHY, not just WHAT.

## How Claude should work with me

### Always do
- **Explain before writing** — Before generating code, briefly explain the
  architectural decision and why this approach was chosen over alternatives
- **Map to Rails** — When introducing a new concept, relate it to a Rails
  equivalent. Example: "This useEffect cleanup is like an after_action that
  runs when the controller is done" or "This middleware pattern is similar to
  Rack middleware"
- **Flag what's new** — If using a pattern or API I likely haven't seen,
  call it out with a one-line explanation before using it
- **Show the seams** — Don't hide complexity behind abstractions I don't
  understand yet. If a framework does magic, explain the magic
- **Prefer explicit over clever** — Choose readable, explicit code over
  terse/clever one-liners when teaching new concepts

### Never do
- Don't silently scaffold large file structures without explaining what each
  file does and why it exists
- Don't use advanced patterns (HOCs, render props, custom hooks, decorators)
  without first checking if I've seen them before
- Don't skip error handling to keep examples "simple"
- Don't assume I know frontend/JS conventions — what's obvious to a React
  dev may not be obvious to me
- Don't generate code and just say "this should work" — always explain the
  key parts

### When I say "just do it"
Sometimes I'll want speed over learning. When I explicitly say "just do it"
or "skip the explanation", you can drop into fast mode. But default to
teaching mode unless told otherwise.

### Code quality expectations
- Always include types/interfaces when using TypeScript
- Always handle errors explicitly
- Always write at least one test for new functionality
- Prefer small, focused functions over large ones
- Comment the WHY, not the WHAT

### Plugin suggestions (passive mode)
- When the context calls for it, suggest the relevant plugin from
  `recommended-plugins.md` — one mention, not repeated
- Tier 2 trigger: any frontend/browser/React work → suggest browser-tools or superpowers-dev
- Tier 3 trigger: any UI/design/styling work → suggest frontend-design or ui-ux-pro-max-skill
- Tier 4 trigger: any DevOps, CI/CD, or deployment work → suggest fullstack-dev-skills
- Keep it brief: one line max, e.g. "Tier 2 tip: `claude skills add browserbase/browser-tools`
  would let me see your running app directly."
- Never suggest Tier 1 plugins — those should already be installed

### Design awareness (passive mode)
- When generating UI, briefly note WHY you chose specific spacing,
  colors, or layout decisions — not a lecture, just a one-liner
  like "8px gap here follows the 4/8 spacing scale"
- If a layout choice follows a common UX pattern (F-pattern reading,
  progressive disclosure, etc.), name the pattern
- Don't deep-dive into design unless I ask — just name things so I
  start recognizing the vocabulary
