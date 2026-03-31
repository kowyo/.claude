---
name: Use uv run for Python commands
description: Always use `uv run` instead of bare `python` when running Python scripts
type: feedback
---

Always prefix Python commands with `uv run` (e.g., `uv run python script.py`) instead of calling `python` directly.

**Why:** User manages Python environments with uv and expects all Python invocations to go through it.

**How to apply:** Any time running a Python script or module (tests, training scripts, gradient checks, etc.), use `uv run python ...` instead of `python ...`.
