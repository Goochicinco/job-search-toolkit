#!/usr/bin/env bash
# Regenerate the generic resume and cover letter PDFs in Documents/
# from the source markdown files in Inputs/.
#
# APPLICANT_NAME is set automatically by /get-started Phase 5.

set -euo pipefail
cd "$(dirname "$0")/.."

APPLICANT_NAME="Ryan Magaraci"

mkdir -p Documents

echo "Generating resume PDF..."
pandoc "Inputs/Resume.md" \
  -f markdown+hard_line_breaks \
  -t html5 \
  --pdf-engine=weasyprint \
  --css=".claude/skills/generate-pdfs/resume.css" \
  -o "Documents/$APPLICANT_NAME - Resume.pdf" \
  2>/dev/null

echo "Generating cover letter PDF..."
pandoc "Inputs/Cover Letter.md" \
  -t html5 \
  --pdf-engine=weasyprint \
  --css=".claude/skills/generate-pdfs/cover-letter.css" \
  --include-before-body=".claude/skills/generate-pdfs/cover-letter-header.html" \
  -o "Documents/$APPLICANT_NAME - Cover Letter.pdf" \
  2>/dev/null

echo ""
echo "Page counts:"
for pdf in "Documents/$APPLICANT_NAME - Resume.pdf" "Documents/$APPLICANT_NAME - Cover Letter.pdf"; do
  [[ -f "$pdf" ]] || continue
  pages=$(python -c "
import zlib, re, sys
with open(sys.argv[1], 'rb') as f:
    content = f.read()
for s in re.findall(rb'stream\r?\n(.*?)\r?\nendstream', content, re.DOTALL):
    try:
        d = zlib.decompress(s)
        m = re.search(rb'/Type /Pages.*?/Count (\d+)', d, re.DOTALL)
        if m:
            print(m.group(1).decode()); sys.exit(0)
    except Exception: pass
print('?')
" "$pdf" 2>/dev/null)
  echo "  $pdf: $pages page(s)"
  if [[ "$pages" != "?" ]]; then
    case "$pdf" in
      *Resume*)  [[ "$pages" -gt 2 ]] && echo "    WARNING: Resume exceeds 2 pages" ;;
      *Cover*)   [[ "$pages" -gt 1 ]] && echo "    WARNING: Cover letter spills to a second page" ;;
    esac
  fi
done

echo ""
echo "Done."
