---
name: explain-code
description: Explains code with visual diagrams and analogies. Activated when
  the user asks "how does this work?", "explain this", or uses /why command.
---

# Explain Code

When explaining code, follow this structure:

1. **Start with an analogy**
   Compare the code to something from everyday life or from Rails — whichever
   makes the concept click faster.

2. **Draw a diagram**
   Use ASCII art to show the flow, structure, or relationships.
   Example:
   ```
   Request → Middleware → Route Handler → DB Query → Response
                 ↓                            ↓
            Auth check                   Serializer
   ```
3. **Walk through the code**
   Go step by step. Number each step. Reference specific line numbers when
   the user has shared a file.

4. **Highlight a gotcha**
   What's a common mistake or misconception with this pattern?

5. **Connect to the bigger picture**
   How does this piece fit into the overall architecture?

Keep explanations conversational. For complex concepts, use multiple
analogies. Never assume the user knows JS/frontend conventions — they
come from Rails.