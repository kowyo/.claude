## Preferences
- Reply in the language the user writes in.
- Always use `pnpm` when installing dependencies.
- Always use `uv run` instead of `python` to run python scripts.
- Do not write any comments: Code should be self-explanatory.
- Before the first `gh` command of a session, load the `gh` skill.
- Watch CI and GitHub Actions workflow runs asynchronously: run `gh run watch <run-id> --exit-status` in the background and report the result when it completes.

## Browser control

- `chrome-auto-allow` clicks `Allow` on every Chrome "Allow remote debugging?" prompt it sees, and exits once 5s pass with no new one. Run `chrome-auto-allow --help` for options.
- Before connecting `chrome-devtools` to Chrome, run `chrome-auto-allow` in the background.
- When `chrome-devtools` is unavailable or fails to connect, use `agent-browser` with `--auto-connect` instead. Make the first connecting command of a session go through the wrapper: `chrome-auto-allow -- agent-browser --auto-connect <command>`.
- Do not bring a browser page or window to the front (e.g. `select_page` with `bringToFront: true`, or `agent-browser`'s bring-to-front) unless the user asks: it steals focus from what the user is doing.

## Verifying frontend changes

- Verify frontend changes in a real browser with `chrome-devtools` or `agent-browser` before claiming they work; passing type checks and tests is not enough.

## Starting a dev server

- Run dev servers in a tmux session, not a built-in background task.
- Once the task's pull request merges, kill its tmux session.

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

- When opening a pull request, add a `Follow-up cleanup` section to its body listing the logic and branches that can be removed once the change is deployed, to be cleaned up in a follow-up pull request.
- When squash-merging with `gh pr merge --squash`, pass `--subject` and `--body`; format the subject as `<pull request title> (#<pull request number>)` and use one concise paragraph describing the final change as the body.
- When uploading logs to a PR body, format them as a collapsible `<details>` section with a descriptive `<summary>`.
