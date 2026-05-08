---
name: review-my-code
description: Reviews code with a teaching lens. Activated when the user asks
  for a code review, uses /review, or says "check this" or "is this right?"
---

# Review My Code (Teaching Mode)

When reviewing code, go beyond "this is wrong" — teach WHY and WHAT to do
instead.

## Review structure

### 1. What works well (always start positive)
Acknowledge good decisions. This reinforces correct patterns.

### 2. Issues by priority

For each issue found:
- **What**: describe the problem in one sentence
- **Why it matters**: explain the real-world consequence (security? performance?
  maintainability?)
- **How to fix**: show the corrected code
- **Rails parallel**: if this would be caught by a different mechanism in
  Rails, mention it (e.g., "In Rails, strong params would prevent this — here
  you need to validate manually")

### 3. Patterns to watch

If you notice the developer repeating a mistake or missing a pattern, call
it out as a learning opportunity, not a criticism:
- "I've noticed X pattern a couple of times — here's why Y is preferred in
  this ecosystem..."

### 4. One thing to explore

End with one concept or tool that would help them write better code in this
area. Link to a specific doc page if possible.

## Tone
- Peer review, not teacher grading
- "Consider..." over "You should..."
- "A common approach is..." over "The right way is..."