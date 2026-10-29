#!/bin/sh
# Builds dist/miximodel-openai.zip, the package uploaded to OpenAI's plugin portal.
#
# The skill and the logo are the Claude plugin's own files, copied at build time: one
# SKILL.md and one logo.png exist in this repository, whatever the vendor. Only committed
# files of a clean tree are packed, so the ZIP is what the repository says it is.
set -eu

root=$(git rev-parse --show-toplevel)
cd "$root"

if [ -n "$(git status --porcelain)" ]; then
  echo "build-openai: the working tree is not clean; commit or stash first." >&2
  exit 1
fi

# path in the repository -> path in the package
manifest="openai/plugin.json:plugin.json
openai/mcp.json:mcp.json
plugins/miximodel/skills/miximodel/SKILL.md:skills/miximodel/SKILL.md
plugins/miximodel/assets/logo.png:assets/logo.png"

stage=$(mktemp -d)
trap 'rm -rf "$stage"' EXIT

echo "$manifest" | while IFS=: read -r source target; do
  if [ -z "$(git ls-files -- "$source")" ]; then
    echo "build-openai: $source is not tracked." >&2
    exit 1
  fi
  if [ "$(git ls-files -s -- "$source" | cut -d' ' -f1)" = "120000" ] || [ -L "$source" ]; then
    echo "build-openai: $source is a symlink; refusing to pack it." >&2
    exit 1
  fi
  mkdir -p "$stage/$(dirname "$target")"
  git show "HEAD:$source" > "$stage/$target"
done

if grep -rIlE 'miximodel_(mcp|pat|cli)_|[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}|run\.app' "$stage"; then
  echo "build-openai: the files above hold a token prefix, an email address or a run.app URL." >&2
  exit 1
fi

mkdir -p dist
out="$root/dist/miximodel-openai.zip"
rm -f "$out"
(cd "$stage" && find . -type f | sed 's|^\./||' | LC_ALL=C sort | zip -X -q "$out" -@)

echo "build-openai: wrote dist/miximodel-openai.zip from $(git rev-parse --short HEAD):"
unzip -Z1 "$out" | LC_ALL=C sort | sed 's/^/  /'
