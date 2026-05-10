---
name: generate-pdfs
description: Convert application markdown files (resume and cover letter) to styled PDFs
argument-hint: <CompanyName>
---

Generate PDFs from the resume and cover letter markdown files in an application folder.

## Input

The argument should be a company name matching a folder under `Applications/`. Examples:
- `/generate-pdfs NovaCredit`
- `/generate-pdfs Confidential`

If no argument is provided, list available application folders and ask the user which one to generate PDFs for.

## Process

Run the generation script via Bash:

```
Scripts/generate-job-docs.sh <CompanyName>
```

The script handles file discovery, PDF conversion, page count reporting, and warnings. Report its output to the user.

## Important Rules

- The script resolves its working directory automatically (`cd "$(dirname "$0")/.."`), so it can be invoked from anywhere.
- The CSS files live in `.claude/skills/generate-pdfs/` and must not be modified.
- Do not convert Interview Talking Points or any other files, only resumes and cover letters.
