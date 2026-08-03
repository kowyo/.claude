- Always use `pnpm` when installing dependencies.
- Always use `uv run` instead of `python` to run python scripts.
- Avoid unnecessary comments: Code should be self-explanatory.

## Commit messages

- Use Conventional Commits: `<type>(scope): description`.
- Make one logical change per commit.
- Explain the *why* in the body.
- Add other useful trailers when appropriate (e.g. `Refs: #123`).
- End git commit messages with the `Assisted-by: claude-code:${MODEL_NAME}`
