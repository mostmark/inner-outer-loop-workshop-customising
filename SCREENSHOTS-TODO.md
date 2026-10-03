# Screenshots to Capture

Pages show a dashed "SCREENSHOT" box where a screenshot belongs. Find them all with:

```bash
grep -rn SCREENSHOT-TODO content/modules/ROOT/pages
```

To add one: save the PNG under the file name the box names in
`content/modules/ROOT/assets/images/`, replace the box (and its `// SCREENSHOT-TODO` comment line)
with `image::<file name>[<short description>]`, and remove its line from the list below.

## How to Capture

- Participant views as `user1`, administrator views as a cluster administrator.
- Light theme, browser window 1920 x 1080 (full HD), browser zoom 100 %.
- Crop to the part the box describes, plus enough around it to recognise where it is.
- Nothing secret or personal in the picture: no passwords, tokens, real e-mail addresses or
  internal host names. Blur them if they can't be avoided.
- PNG, file name as given (`<page>-<number>-<subject>.png`).

## Open

| File | Page | Shows |
|---|---|---|
| `00a-01-participant-view.png` | Introduction | lab guide next to the Dev Spaces workspace, as `user1` |
