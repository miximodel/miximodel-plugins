# Miximodel plugin

The official [Miximodel](https://miximodel.com) plugin, published by MakerLabs. It connects
Claude, ChatGPT and Codex to Miximodel's hosted MCP server and adds a skill that describes
common workflows.

**Members:** follow [Use Miximodel from Claude or ChatGPT](https://miximodel.com/assistants).
No terminal is needed.

## Claude Code

```
/plugin marketplace add miximodel/claude-plugin
/plugin install miximodel@miximodel
```

What the first connection asks you, and how to disconnect, are on
https://miximodel.com/assistants.

## Layout

| Path | What it is |
| --- | --- |
| `plugins/miximodel/` | The Claude plugin, as submitted to Anthropic's directory. |
| `openai/` | The OpenAI Agent Plugins manifest and MCP configuration. |
| `scripts/build-openai.sh` | Builds `dist/miximodel-openai.zip` for OpenAI's plugin portal. |

The OpenAI package carries the same skill and logo as the Claude plugin: the build script
copies them from `plugins/miximodel/`, so neither is committed twice.

## Documentation

- Members: https://miximodel.com/assistants
- Developers: https://miximodel.com/developers
