#!/bin/sh
# Renders the last page of the template once per bundled theme in light and
# dark mode into screenshots/ for the README. The default theme in light mode
# doubles as the template thumbnail, so all of them share its resolution: the
# longer edge must be at least 1080 px.
# Usage: scripts/screenshots.sh
set -eu

root=$(cd "$(dirname "$0")/.." && pwd)
version=$(sed -n 's/^version = "\(.*\)"/\1/p' "$root/typst.toml")
out="$root/screenshots"
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT

# Resolve `@preview/typtorial:<version>` to the working copy.
mkdir -p "$work/packages/preview/typtorial" "$out"
ln -s "$root" "$work/packages/preview/typtorial/$version"

# render <theme> <mode> <ppi> <target>
render() {
  perl -pe "s/\": tutorial\$/\": tutorial, themes/;
    s/^#show: tutorial.with\(\$/#show: tutorial.with(\n  theme: themes.$1,\n  mode: \"$2\",/" \
    "$root/template/main.typ" > "$work/main.typ"
  typst compile --package-path "$work/packages" --format png --ppi "$3" \
    "$work/main.typ" "$work/page-{0p}.png" 2>/dev/null
  mv "$(ls "$work"/page-*.png | sort | tail -n 1)" "$4"
  rm -f "$work"/page-*.png
}

for theme in default paper forest indigo coral; do
  for mode in light dark; do
    render "$theme" "$mode" 150 "$out/$theme-$mode.png"
  done
done

if command -v oxipng >/dev/null; then
  oxipng --quiet --opt 4 --strip safe "$out"/*.png
fi

ls -l "$out"
