# Miximodel for Claude Code

The official [Miximodel](https://miximodel.com) plugin for Claude Code. It connects Claude
Code to Miximodel's hosted MCP server and adds a skill that describes common workflows.

## Install

```
/plugin marketplace add miximodel/claude-plugin
/plugin install miximodel@miximodel
```

The first tool call opens miximodel.com in your browser. Sign in, tick the permissions you
want to grant, and approve. Read permissions are ticked by default; writes are not.

Without the plugin:

```
claude mcp add --transport http miximodel https://miximodel.com/mcp
```

## Revoke

Settings → Connected applications on miximodel.com lists every connection and revokes one.

## Documentation

https://miximodel.com/developers
