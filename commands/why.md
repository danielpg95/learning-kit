---
description: Explain the reasoning behind Claude's last decision or code generation
argument-hint: [optional: specific thing to explain]
---

Look at the last code you generated or decision you made in this conversation.
Explain:

1. **What you did** — one sentence summary
2. **Why this approach** — what made you choose this over alternatives
3. **What you considered** — name 1-2 alternatives and why you rejected them
4. **The trade-off** — what's the downside of this approach
5. **Rails comparison** — how would this have been done in Rails, and why is
   it different here

If the user specified something specific with $ARGUMENTS, focus on that.
Otherwise, explain the most recent significant decision.

Keep it concise. No more than 15-20 lines total.
