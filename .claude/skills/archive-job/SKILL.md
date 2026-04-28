---
name: archive-job
description: Archive a job application folder by moving it from Applications to Archived
argument-hint: <folder-name>
---

Move a job application folder from `Applications/` to `Archived/`.

## Input

The argument should be the name of a folder inside `Applications/`. Examples:
- `NovaCredit`
- `OptimalDynamics`

If no argument is provided, list the current folders in `Applications/` and ask the user which one to archive.

## Process

1. Verify the folder exists at `Applications/<folder-name>/`. If it does not exist, list the available folders in `Applications/` and ask the user to pick one.
2. Create the `Archived/` directory if it does not already exist.
3. Move `Applications/<folder-name>/` to `Archived/<folder-name>/` using `mv`.
4. Confirm the move to the user, showing the source and destination paths.

## Important Rules

- NEVER delete any files. This is a move operation only.
- If `Archived/<folder-name>/` already exists, stop and ask the user how to proceed rather than overwriting.
