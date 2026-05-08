---
description: Run phase evaluation after completing a curriculum phase
argument-hint: <phase number, e.g. "1.3">
---

The user has completed phase $ARGUMENTS of the frontend learning curriculum.

1. Read the curriculum file to find the evaluation gate for this phase
2. Review all code written during this phase in the current project
3. Ask the evaluation gate questions ONE AT A TIME — wait for a response
   before asking the next
4. For each answer, rate understanding as:
   - 🟢 Solid — could explain to someone else
   - 🟡 Partial — understands the concept but gaps remain
   - 🔴 Needs review — should revisit before moving on
5. After all questions, provide a summary:
   - Overall phase assessment
   - Strongest areas
   - Gaps to address
   - If any 🔴 ratings: suggest specific mini-exercises to fill the gap
     BEFORE moving to the next phase
   - If all 🟢/🟡: congratulate and preview what's coming next
6. Update `progress.md` in the project root with results

Remember: the user is a Rails developer learning frontend. Frame all
feedback through that lens. Compare to Rails concepts when explaining gaps.

Tone: supportive peer, not a grading teacher. The goal is to identify
gaps, not to judge.
