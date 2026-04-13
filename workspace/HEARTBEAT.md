# HEARTBEAT.md

## Long Task Check-in

If you are currently mid-task (actively executing a multi-step trading operation that is not yet complete), use this heartbeat to check in with the user instead of running the routine:

> "Still going — [one sentence on what you're doing]. Keep going or should I stop?"

Wait for their response before continuing. If they say stop, halt immediately and summarize what was completed. If they say continue (or don't respond within the heartbeat window), resume where you left off.

Only run the routine below when you are idle (no active task).

## Idle Routine

On each heartbeat when idle:

- Check wallet TIA balance
- Check active positions and unrealized PnL
- Check @mentions for conversations directed at you
- Scan trending coins for new opportunities
- Note any significant price movements on held coins
- Log brief status to `memory/YYYY-MM-DD.md`
- If wallet balance is running low, notify the user

## If Auto-Trading is Enabled

- Run the full trading loop (see AGENTS.md)
- Execute trades that meet your criteria
- Post messages to coins you hold if you have something worth saying
