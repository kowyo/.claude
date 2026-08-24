- Always use `pnpm` when installing dependencies.
- Always use `uv run` instead of `python` to run python scripts.
- Do not write any comments: Code should be self-explanatory.

## Worktrees

- Create repository worktrees under a sibling `<repository>-worktrees` directory: `<parent>/<repository>-worktrees/<task>`.
- When creating a worktree, copy the repository's `.env` file into it when one exists.

## Commit messages

- Use Conventional Commits: `<type>(scope): description`.
- Make one logical change per commit.
- Explain the *why* in the body.
- Add other useful trailers when appropriate (e.g. `Refs: #123`).
- End git commit messages with the `Assisted-by: Claude Code:${MODEL_VERSION}`

## Issues

- Do not include `Cause` `Criteria`, `Solution`, or `Scope` or any similar sections in issues.

## Pull requests

- Address every GitHub review comment using the `gh` CLI: reply to the comment, then resolve the conversation.
- React to every Codex review comment with 👍 when it is valid and useful, or 👎 when it is invalid, out of scope, low-signal or does not warrant a change.
- If a comment is invalid, concerns an edge case that does not warrant a change, or falls outside the pull request’s scope, explain why in the reply and mark the conversation as resolved
- When uploading logs to a PR body, format them as a collapsible `<details>` section with a descriptive `<summary>`.
