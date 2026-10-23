## Preferences
- Always use `pnpm` when installing dependencies.
- Always use `uv run` instead of `python` to run python scripts.
- Do not write any comments: Code should be self-explanatory.
- Watch CI and GitHub Actions workflow runs asynchronously: run `gh run watch <run-id> --exit-status` in the background and report the result when it completes.

## Browser control

- Before connecting `chrome-devtools` to Chrome, run `osascript ~/bin/chrome-auto-allow.applescript 30` in the background; it clicks `Allow` on Chrome's "Allow remote debugging?" prompt once, then exits.

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

- Do not include `Cause` `Criteria`, `Solution`, or `Scope` or any similar sections when creating issues.

## Pull requests

- When squash-merging with `gh pr merge --squash`, pass `--subject` and `--body`; format the subject as `<pull request title> (#<pull request number>)` and use one concise paragraph describing the final change as the body.
- When uploading logs to a PR body, format them as a collapsible `<details>` section with a descriptive `<summary>`.
