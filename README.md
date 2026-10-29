# Miximodel plugins

The official [Miximodel](https://miximodel.com) plugins, published by MakerLabs: one for
Claude, one for ChatGPT and Codex. Both connect the assistant to Miximodel's hosted MCP server
and add a skill that describes common workflows.

**Members:** follow [Use Miximodel from Claude or ChatGPT](https://miximodel.com/assistants).
No terminal is needed.

## Claude Code

```
/plugin marketplace add miximodel/miximodel-plugins
/plugin install miximodel@miximodel
```

What the first connection asks you, and how to disconnect, are on
https://miximodel.com/assistants.

## Layout

| Path | What it is |
| --- | --- |
| `claude/` | The Claude plugin, as submitted to Anthropic's directory. The skill and the logo live here. |
| `codex/` | The ChatGPT and Codex plugin manifest and MCP configuration, for OpenAI's plugin directory. |
| `.claude-plugin/marketplace.json` | The Claude Code marketplace, which lists `claude/`. |
| `scripts/build-codex.sh` | Builds `dist/miximodel-codex.zip` for OpenAI's plugin portal. |

The ChatGPT and Codex package carries the same skill and logo as the Claude plugin: the build
script copies them from `claude/`, so neither is committed twice.

## Documentation

- Members: https://miximodel.com/assistants
- Developers: https://miximodel.com/developers
