# Claude preferences

## Identity

The user's name is Rareș Nistor. In plain ASCII contexts use Raresh Nistor. He also goes by Razz or Razza informally.

For commits and attributions, use the name and email from the project's local git config if one exists, falling back to `~/.gitconfig`. Never substitute a Claude account name or email address. If in doubt, run `git config user.name` and `git config user.email`.

## Language and writing

In Rareș's own projects, use New Zealand English for prose and documentation, and US English spellings for code identifiers (variable names, function names, etc.). For others' projects, infer from the existing documentation and code.

Do not write prose on Rareș's behalf, especially for anything intended for publication (blog posts, articles, etc.) — it should be in his own voice. Quick or rough drafts for documentation are fine.

Helping with typos, spelling, grammar, readability, understandability, and factual correctness is always welcome.

---

## At the start of a session

- **Commit workflow** — ask whether to use quick commits (commit after every change) or reviewed commits (stage and wait for review). Quick commits are typical for experiments; reviewed commits for larger or longer-lived projects. Ask again if the nature of the work changes during the session.
- **Large pastes** — when large content is pasted with no instructions, just summarise it.

## At the start of a project

- **Testing** — ask upfront whether testing should be:
  - **first** — test-driven from the start
  - **after initial buildout** — once the shape of the thing is clear
  - **later** — consciously deferred
  - **never** — experiments, throwaway drafts, quick proofs of concept
- **Devcontainers** — Rareș is interested in devcontainers and project-level toolchain isolation; flag if this would be a good fit for the project.

---

## Making changes

- Read the existing code and relevant `CLAUDE.md` files before editing
- Keep changes minimal and related to the current request — don't refactor things that aren't being touched
- Follow the project's style guide when it conflicts with personal preference
- Do not revert unrelated changes
- If unsure, inspect the codebase instead of inventing patterns
- Never duplicate documentation across files
- For significant decisions, explain the reasoning and ask for feedback before proceeding
- Flag breaking changes explicitly — call out when a change breaks backwards compatibility or existing interfaces

## Definition of done

Before calling a task complete, always run (where applicable): format, lint, check, build. Fix any issues before handing back.

## When things go wrong

- If something doesn't go to plan — unexpected errors, surprising results, ambiguous next steps — stop and ask for review rather than pushing onward
- Warn and ask for confirmation before destructive operations (file deletions, database mutations, overwrites)
- Media files (photos, videos, audio, raw files, etc.) are precious and often irreplaceable — do not move or delete them unless a backup exists or the file can be re-sourced. When in doubt, ask

---

## Code style

Prefer declarative and functional programming patterns over imperative and OOP where feasible. In languages where this is awkward (C, Go, etc.), prefer imperative.

Unless in conflict with a project's code style, follow these guidelines (from https://razza.io/notes/clean-code.html):

- **Name things clearly.** For globals, use namespacing where the language supports it — the library prefix and grouping are only needed when there is no namespacing (e.g. C needs `SDL_RenderTexture`; Swift/Go can use `SDLRenderer.texture`; C++/Rust can go to `sdl::render::Renderer::texture`). Locals should indicate importance and lifetime — single letters (`i`, `j`) are fine for numeric loops but not for object iteration; prefer `item` or `item_index`.
- **Return early.** When the unhappy path requires less work, invert the condition and return early to avoid deep nesting.
- **Limit indentation.** Aim for no more than 2–3 levels of nesting in a function. Deeper nesting is a hint to simplify, deduplicate, or extract.
- **Keep functions simple.** A function should do one thing. If you're struggling to name it, it's probably doing too much.
- **Use abstractions when available.** Prefer language-provided abstractions (`map`, `filter`, `sort`, list comprehensions, streams) over manual loops.
- **Prefer pure functions** — avoid modifying input parameters or global state where practical, but don't let it make things needlessly awkward.
- **Use strict typing** in languages that support it well (TypeScript, Rust, Swift, Kotlin, etc.). Dynamic languages and C/C++ get a pass. Avoid generic types like `Any`, `unknown`, or `List[Dict[str, Any]]`.
- **Prefer structured data models over loose dictionaries.**
- **Follow DRY and KISS.**
- **Break UI into small, reusable components.** Avoid large, complex view trees in a single component — decompose into focused pieces.
- **Avoid unnecessary comments and docstrings.** Code should be readable and self-documenting. Comments are warranted for genuinely non-obvious decisions, not for describing what the code plainly shows.
- **Prefer structured logging** over interpolating dynamic values into log message strings (e.g. `logger.info("request failed", status=404)` not `logger.info(f"request failed with {status}")`).

## Error handling

- Where the language supports it, prefer returned errors (error values, `Result`, `throws`) over unwinding errors (exceptions, panics)
- Always raise errors explicitly — never silently ignore them
- Use specific error types that clearly indicate what went wrong
- Avoid catch-all exception handlers that hide the root cause
- Error messages should be clear, actionable, and include enough context to debug (request params, response body, status codes, etc.)
- No fallbacks unless explicitly asked for
- Fix root causes, not symptoms

## Testing

- Prefer table-driven tests where the framework supports it or it can be done without much ceremony
- Test behaviour, not implementation details — implementation can change at any time

## Git and commits

- Default to [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) unless the project specifies otherwise. Use scope on larger projects; omit it on smaller ones.
- For configuration and state-tracking repos — dotfiles, PKI, infrastructure state, asset stores, secret vaults, and similar — drop the type prefix and use plain descriptive commit messages.

## Package and dependency management

- Never assume package versions from training data — always look up the current latest before suggesting an install or adding a dependency. If a version cannot be found, ask rather than falling back to training data. This applies to package managers (npm, pip, cargo, brew, etc.) and GitHub Actions (always check the latest tag for any `uses:` action).
- Prefer stdlib and lightweight alternatives before reaching for heavy dependencies
- Install dependencies in project environments, not globally; always add them to the project config files (e.g. `package.json`, `pyproject.toml`, `Cargo.toml`). Use modern package management files where applicable.

## Licences

When retrieving or editing software licences, you must download a plain text copy from an authoritative source.

If you can't find such source that is easy to curl or wget. You may also try the `reuse download` command with the SPDX identifier.

NEVER generate licence text yourself.

---

## Security

- Never commit API keys, credentials, or secrets
- Never read `.env` files directly — if environment variables are needed, identify which keys are required first, then decide whether it's safe to retrieve the value
- Example/sample `.env` files (e.g. `.env.example`, `.env.sample`) are safe to read
- If a project's `.env` file is confirmed to contain no secrets, store a project-level memory noting it is safe to read without checking first
- Flag any secrets spotted accidentally included in code or diffs

## Filesystem

Rareș may work on remote filesystems (mounted under `/Volumes` on macOS, `/mnt/remote` on Linux). Before any I/O-heavy operation, check whether the path is remote. If it is, treat the volume as unreliable — expect it to fail or stop responding at any time and handle accordingly.

## Tool use

Prefer tool calls over terminal commands where possible — use the Read tool to read files rather than `cat`, for example. They're faster and provide a better experience.

## Scripts

Use `#!/usr/bin/env bash` or `#!/usr/bin/env zsh` as the shebang unless the script is explicitly intended to be POSIX compatible. Be aware that macOS ships bash 3.2 (2007), which lacks many modern features (associative arrays, `mapfile`, etc.) — Linux has bash 5.x. When writing bash scripts that need to run on macOS, either target 3.2's feature set or use `zsh` instead.

For any script longer than a few lines, enable strict mode after the shebang:

```bash
set -euo pipefail
```

Both bash and zsh support these flags. Exceptions: scripts that deliberately handle partial failures inline, or wrappers where a non-zero exit from a subcommand is expected and checked explicitly.

## Terminal

- Prefer non-interactive commands; use flags to avoid interactive prompts
- Always use `git --no-pager diff` (or `git diff | cat`) rather than interactive diffs
- For a single operation in another directory, pass the path as an argument if the command supports it (e.g. `git -C <path>`). Use `cd` only when doing multiple operations in that directory
- Never use `2>&1` — keep stderr and stdout separate
- Break complex bash commands into multiple simple commands so each can be approved individually. For unavoidably complex sequences, put them in a script and run with `bash /tmp/<script>.sh`
- Avoid complex pipes. Run each step individually, or write a script with pipes broken across multiple lines for readability

## Build orchestration

Use [`just`](https://github.com/casey/just) to orchestrate builds on complex projects.

## Forges

For actions on GitHub and other forges, use the `gh` and `forge` CLI commands when available rather than API calls or web scraping.

## Notion

Notion is connected via MCP — always use the MCP tools rather than the web or API directly.

"Projects list" or "projects list" refers to the Projects database in Notion unless context makes it clear otherwise. It is the source of truth for what Rareș is working on personally.
