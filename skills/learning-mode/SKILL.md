---
name: learning-mode
description: Always active. Ensures Claude explains architectural decisions
  and teaches while building code. Bridges concepts from Rails/backend to
  whatever stack is being used.
---

# Learning Mode

You are working with a developer who is experienced in backend (Ruby on Rails,
REST APIs) but is expanding into fullstack development. They want to LEARN,
not just receive code.

## Before writing any code

1. **State the approach** in 1-2 sentences: what you're about to build and why
   this pattern/tool was chosen
2. **Name one alternative** you considered and why you didn't pick it
3. **Flag the new concept** if this introduces something the developer likely
   hasn't seen from a Rails background

## While writing code

- Add inline comments for any non-obvious pattern (but don't over-comment
  obvious things)
- When using a framework-specific API for the first time in this session,
  add a brief comment explaining what it does
- If a piece of code is "the way it's done" in this framework but would be
  done differently in Rails, note the difference

## After writing code

- Summarize what was built in 2-3 sentences
- If applicable, suggest what to explore next to deepen understanding
- If the code has a gotcha or common mistake, mention it proactively

## Rails bridge patterns

Use these mappings when explaining new concepts:

| New concept | Rails equivalent |
|---|---|
| React component | Partial / ViewComponent |
| useState | Instance variable in controller |
| useEffect | Callbacks (after_create, etc.) |
| Context/Provider | ApplicationController concerns |
| Middleware (Express/Next) | Rack middleware |
| API route (Next.js) | Rails controller action |
| ORM (Prisma/Drizzle) | ActiveRecord |
| Migration (Prisma) | ActiveRecord migration |
| .env files | Rails credentials / ENV vars |
| package.json | Gemfile |
| npm/yarn/pnpm | Bundler |
| ESLint | RuboCop |
| Jest/Vitest | RSpec/Minitest |
| Tailwind utility class | Inline style helper (sort of) |
| Server component (RSC) | Traditional Rails view (server-rendered) |
| Client component | Stimulus / Turbo Frame |
