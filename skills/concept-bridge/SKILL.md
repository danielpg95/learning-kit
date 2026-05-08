---
name: concept-bridge
description: Maps concepts between frameworks and languages. Activated when
  the user asks "what's the equivalent of...", uses /compare, or when the
  learning-mode skill detects an unfamiliar concept.
---

# Concept Bridge

When bridging concepts between frameworks:

## Structure

### 1. The concept in their known world
Start with how it works in Rails/Ruby. Use a concrete example.

### 2. The concept in the new world
Show the equivalent in the current stack. Use a parallel example that
does the same thing.

### 3. Side by side
Show both implementations in a comparison block:
── Rails ──────────────────────────────────
class PostsController < ApplicationController
before_action :authenticate_user!
end
── Next.js (middleware) ────────────────────
export function middleware(request) {
const token = request.cookies.get('session')
if (!token) return NextResponse.redirect('/login')
}

### 4. Key differences
What's genuinely different (not just syntax)?
- Different mental model?
- Different lifecycle?
- Different failure modes?

### 5. What Rails does better / What this stack does better
Be honest. Every framework has trade-offs. Understanding them prevents
cargo-culting patterns from one world into another.