#!/usr/bin/env bash
# Regenerate the generic resume and cover letter PDFs in Documents/
# from the source markdown files in Inputs/.
#
# Update APPLICANT_NAME to your full name before running.

set -euo pipefail
cd "$(dirname "$0")/.."

APPLICANT_NAME="Your Name"  # <-- Update this to your name

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
  pages="(null)"
  for _ in 1 2 3; do
    pages=$(mdls -name kMDItemNumberOfPages -raw "$pdf")
    [[ "$pages" != "(null)" ]] && break
    sleep 1
  done
  echo "  $pdf: $pages page(s)"
  if [[ "$pages" != "(null)" ]]; then
    case "$pdf" in
      *Resume*)  [[ "$pages" -gt 2 ]] && echo "    WARNING: Resume exceeds 2 pages" ;;
      *Cover*)   [[ "$pages" -gt 1 ]] && echo "    WARNING: Cover letter spills to a second page" ;;
    esac
  fi
done

echo ""
echo "Done."
