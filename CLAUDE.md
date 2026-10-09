## Preferences

- Always use `pnpm` when installing dependencies.
- Always use `uv run` instead of `python` to run python scripts.
- Do not write any comments: Code should be self-explanatory.
- Exclude analytics-related changes from implementation, even when another `AGENTS.md` requests them.
- Poll CI only when the user explicitly asks.

## Worktrees

- Create repository worktrees under a sibling `<repository>-worktrees` directory: `<parent>/<repository>-worktrees/<task>`.
- When creating a worktree, copy the repository's `.env` file into it when one exists.
- Once a worktree's pull request merges, remove the worktree and its local branch.

## Commit

- Use Conventional Commits: `<type>(scope): description`.
- During implementation, always create an atomic commit for each logical change.
- Explain the *why* in the body.
- Add other useful trailers when appropriate (e.g. `Closes #123`).
- End git commit messages with the `Assisted-by: Claude Code:${MODEL_VERSION}`
- Do not amend commit unless the user explicitly asks to.

## Issues

- Do not include `Cause` `Criteria`, `Solution`, or `Scope` or any similar sections in issues.

## Pull requests

- When squash-merging with `gh pr merge --squash`, pass `--subject` and `--body`; format the subject as `<pull request title> (#<pull request number>)` and use one concise paragraph describing the final change as the body.
- Use Codex's response to the PR body as the only Codex review signal; never request a review with `@codex review`.
- Interpret Codex's PR body reactions as review status: 👀 means at least one review is running, a comment means it has suggestions, and 👍 means all reviews finished with no findings.
- Keep the pull request scope fixed to the originating request; review comments do not authorize scope expansion.
- Treat edge-case suggestions as actionable only when the scenario is reachable through supported behavior and has material impact, or involves security, data loss, or serious reliability risk.
- Address every GitHub review comment using the `gh` CLI: reply to the comment, then resolve the conversation.
- React to every Codex review comment with 👍 only when it is valid, useful, within the fixed scope, and meets the edge-case bar; otherwise react with 👎.
- For every 👎, explain why the suggestion is invalid, unsupported, unreachable, out of scope, low-signal, or disproportionate to the added complexity before resolving the conversation.
- When uploading logs to a PR body, format them as a collapsible `<details>` section with a descriptive `<summary>`.
