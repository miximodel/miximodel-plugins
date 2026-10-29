# Miximodel

Miximodel is a professional network for models, photographers, make-up artists, stylists and
agencies. This plugin lets your assistant work on your own Miximodel account: read your
profile and portfolio, see your casting notices and who applied, plan the stops of your
travel timeline, and answer your bookings. It does only what you approve when you connect.

**Installing it for the first time?** Follow
[Use Miximodel from Claude or ChatGPT](https://miximodel.com/assistants), written for
members who have never used a terminal.

## What it connects to

The plugin talks to one remote server, Miximodel's hosted MCP server at
`https://miximodel.com/mcp`, and nothing else. The first time a tool runs, a Miximodel page
opens in your browser: sign in, tick what the assistant may do, and approve with your
password. Reading is ticked for you; anything that changes your account is not.

## In Claude Code

```
/plugin install miximodel --marketplace miximodel/claude-plugin
```

## Disconnect

On miximodel.com, open **Settings → Connected applications** and choose **Disconnect**. Removing
the plugin from your assistant may leave its access in place; disconnecting it on Miximodel is
what revokes it.

## Links

- [Installation guide](https://miximodel.com/assistants)
- [Privacy policy](https://miximodel.com/legal/privacy-policy)
- [Terms of service](https://miximodel.com/legal/terms-of-service)
- [Support](https://miximodel.com/legal/contact)
