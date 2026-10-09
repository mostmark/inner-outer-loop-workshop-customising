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
| `02-01-header-before-after.png` | Tutorial 2 | original and ACME header bars, one above the other |
| `02-02-browser-tab.png` | Tutorial 2 | browser tab with the ACME icon and title |
| `03-01-new-chapter-nav.png` | Tutorial 3 | navigation with the new module 9 of Part 1 |
| `03-02-new-chapter-page.png` | Tutorial 3 | the new chapter's *Define the Build* step with filled-in values |
| `04-01-argocd-applications.png` | Tutorial 4 | `openshift-gitops` Argo CD: the five Applications Synced and Healthy |
| `04-02-guide-on-cluster.png` | Tutorial 4 | the ACME lab guide on the cluster, opened with `user1`'s URL |
| `05-01-argocd-platform-builds.png` | Tutorial 5 | Argo CD `workshop-platform` with `OpenShiftBuild cluster` |
| `05-02-installed-operators.png` | Tutorial 5 | Installed Operators: Builds for Red Hat OpenShift Succeeded |
| `05-03-participant-projects.png` | Tutorial 5 | `user1`'s projects including `acme-user1` |
| `06-01-workspace-explorer.png` | Tutorial 6 | `user1`'s workspace with `labs/acme-hello` open |
| `06-02-run-task.png` | Tutorial 6 | Run Task list with "ACME - Build with Shipwright" |
| `06-03-buildrun-succeeded.png` | Tutorial 6 | the BuildRun Succeeded in the console, as `user1` |
| `06-04-acme-hello-app.png` | Tutorial 6 | the ACME Hello page in the browser |
