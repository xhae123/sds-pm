#!/usr/bin/env bash
# Build an AI-consumable bundle from the shared context files.
# Output is machine-first: delimited with <FILE path="..."> tags.
# Not meant to be read by humans — feed the URL to an AI and let it parse.

set -euo pipefail

OUTDIR="${1:-_site}"
mkdir -p "$OUTDIR"
OUT="$OUTDIR/bundle.txt"

COMMIT=$(git rev-parse HEAD 2>/dev/null || echo "unknown")
GENERATED=$(date -u +%Y-%m-%dT%H:%M:%SZ)

FILES=(
  CONTEXT.md
  MEMORY.md
  course/framework.md
  course/ai-workflow.md
  course/assignment-formats.md
  course/good-answer-rubric.md
)

{
  echo "<BUNDLE source=\"https://github.com/xhae123/sds-pm\" commit=\"$COMMIT\" generated=\"$GENERATED\">"
  for f in "${FILES[@]}"; do
    if [ ! -f "$f" ]; then
      echo "WARN: missing $f" >&2
      continue
    fi
    echo ""
    echo "<FILE path=\"$f\">"
    cat "$f"
    echo "</FILE>"
  done
  echo ""
  echo "</BUNDLE>"
} > "$OUT"

# Jekyll을 비활성화해서 Pages가 그대로 서빙하도록
touch "$OUTDIR/.nojekyll"

# 루트 접근 시 번들로 리다이렉트
cat > "$OUTDIR/index.html" <<'HTML'
<!doctype html>
<meta charset="utf-8">
<meta http-equiv="refresh" content="0; url=bundle.txt">
<title>sds-pm bundle</title>
<p><a href="bundle.txt">bundle.txt</a></p>
HTML

echo "Wrote $OUT ($(wc -c < "$OUT") bytes)"
