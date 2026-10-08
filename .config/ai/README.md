# AI tool config — single source of truth

Shared config for the AI coding tools (Claude Code, OpenCode, Antigravity/Gemini).
Edit things **here**, then run `./sync.sh` to fan out to each tool.

## Layout

```
~/.config/ai/
  rules/      # coding standards / instructions (markdown)
  agents/     # subagent definitions (Claude-native frontmatter + body)
  skills/     # SKILL.md trees
  sync.sh     # regenerates every tool's config from the above
```

## How each tool is fed

| Source     | Claude Code            | OpenCode                        | Antigravity / Gemini          |
|------------|------------------------|---------------------------------|-------------------------------|
| `rules/`   | symlink `~/.claude/rules` | symlink `~/.config/opencode/rules` | concatenated into `~/.gemini/GEMINI.md` |
| `agents/`  | symlink `~/.claude/agents` | generated (frontmatter rewritten to `mode: subagent`) | not supported |
| `skills/`  | symlink `~/.claude/skills` | not supported                   | not supported                 |

Symlinks mean Claude/OpenCode rules and Claude agents/skills update instantly.
OpenCode agents and `GEMINI.md` are **generated** (different formats), so rerun
`sync.sh` after editing those sources.

## Common tasks

- Add/edit a rule: edit `rules/**`, run `./sync.sh`.
- Add/edit an agent: edit `agents/<name>.md` (Claude format). To also publish it
  to OpenCode, add its name to `OPENCODE_AGENTS` in `sync.sh`, then run it.
- Add a skill: drop it under `skills/<name>/`; it appears in Claude via the symlink.

## Not managed here

MCP server definitions are **not** consolidated (each tool uses an incompatible
schema). They still live in each tool's own config. Note: do not hardcode tokens
there — reference an env var instead.
