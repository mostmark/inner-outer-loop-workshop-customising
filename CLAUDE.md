# Customising the Inner & Outer Loop Workshop: tutorial site

Antora site with hands-on tutorials that teach organisations to customise the Inner & Outer Loop
Workshop by forking its three repositories. Published on GitHub Pages
(`https://mostmark.github.io/inner-outer-loop-workshop-customising`). Readers don't fork this
repository; they fork the workshop's.

The workshop's repositories (all only `main`), which the tutorials describe and quote:

- `github.com/mostmark/inner-outer-loop-workshop-gitops`: charts, `bootstrap.sh`, smoke tests,
  `tools/` (tooling image), `docs/`. Its `CLAUDE.md` has the names, contracts and fork checklist.
- `github.com/mostmark/inner-outer-loop-workshop`: the lab guide (Antora).
- `github.com/mostmark/inner-outer-loop-workshop-code`: what participants get in their workspace.

## Layout

| Path | What |
|---|---|
| `content/modules/ROOT/pages/` | `index.adoc` (Introduction), `how-the-workshop-is-built.adoc`, `own-git-server-and-registry.adoc`, then the tutorials |
| `content/modules/ROOT/nav.adoc` | navigation: "Before you start", then the tutorials; list only pages that exist |
| `content/modules/ROOT/partials/_attributes.adoc` | the workshop's repository URLs and images; every page includes it after its title |
| `content/modules/ROOT/assets/images/` | diagrams (`*.svg`) and screenshots (`*.png`) |
| `content/modules/ROOT/examples/acme/` | files the tutorials give readers (for example the new chapter); test exactly these files in a scratch fork |
| `content/modules/ROOT/examples/acme/gitops/cleanup-and-smoke-tests.patch` | tutorial 5, steps 6 and 7 as a patch against the gitops repository's `cleanup.sh` and smoke tests; regenerate it (`git diff` on a fresh clone) whenever those scripts change upstream, and check it with `git apply --check` |
| `content/supplemental-ui/` | theme additions; `supplemental_files` in `site.yml` is a directory, so every file there is active |
| `SCREENSHOTS-TODO.md` | capture rules and the list of open screenshots |

## The plan

Storyline: the fictional company ACME customises the workshop. Pages, in this order:

0. Introduction; How the workshop is built; Using your own Git server and registry (public only).
1. Fork and preview the lab guide (fork checklist as `sed` commands).
2. Branding: logo, colours, title.
3. New chapter "Build a container image with Shipwright" (participants create a `Build` and a
   `BuildRun` and deploy the image).
4. Install the workshop from your forks.
5. Builds for Red Hat OpenShift: operator (`openshift-builds-operator`), `OpenShiftBuild`
   instance, readiness check, a project `acme-<user>` with an `admin` RoleBinding per participant,
   cleanup, smoke test. No pre-created `Build`: creating it is the participants' exercise.
6. Exercise code: `labs/acme-hello` in the code repository, a devfile command and a solution script.

Decided and out of scope for now: extension points (forks only), a license, versions or tags,
private Git repositories and registries.

## Writing rules

- Terms: "you" is the person customising the workshop; a "participant" attends the workshop.
- Every tutorial page: goal, prerequisites and time; steps (tabs for alternatives); a check;
  "What you changed"; troubleshooting.
- Reader-specific values are shell variables set on the Introduction page: `GITHUB_USER`,
  `QUAY_USER`, `WORKDIR`. Never write a real user's names, passwords or host names.
- Verify every fact against the workshop's repositories and, for cluster steps, on a test
  cluster. Quote files by path and short snippet, never by line number, so the tutorials survive
  changes in the workshop.
- Command output is shown as text, not as screenshots.
- Every code block a reader copies (commands, file contents, snippets) gets `role=copypaste`, for
  example `[source,bash,role=copypaste]`: the theme then adds a copy button. Blocks that only show
  output don't.
- Show an example file with `include::example$acme/<file>[]` in a listing whose delimiter is
  longer than any inside the file (`------`). Asciidoctor runs `include::` lines of the included
  file even in a listing (also for `.txt` files): write such lines in the page with a backslash
  (`\include::...`) and include the rest with `lines=`.
- Blank line before and after every list. `ifeval`/attribute examples from the workshop are
  written with `+...+` so this site does not resolve them.

## Screenshots and diagrams

- A missing screenshot is a placeholder box, never a missing image (the build must stay free of
  warnings):

  ```asciidoc
  // SCREENSHOT-TODO: 05-02-installed-operators.png
  [NOTE.screenshot-todo,caption=Screenshot]
  ====
  *Screenshot to add:* `05-02-installed-operators.png` +
  <which UI and page, as which user, what must be visible>
  ====
  ```

- A captured screenshot replaces its box as `[.screenshot]` + `image::<file>[<description>]` (the role adds
  a thin frame).
- File names `<page>-<number>-<subject>.png` (`00a`, `00b`, ... for the introduction pages,
  `01`-`06` for the tutorials). Add every placeholder to `SCREENSHOTS-TODO.md`.
- Diagrams are SVG files written by hand, used with `[.diagram]` before `image::`. Check them in a
  browser (for example headless Chrome) for text that runs over a box.

## Build and check

- `./build-site.sh` must finish without warnings (`--log-failure-level=warn`).
- Antora reads the content from Git: the repository needs a commit, and uncommitted changes in
  the working copy are included.

## Branding

The site uses the workshop's theme (`rhpds/rhdp_showroom_theme`) with a plain header and footer
(`content/supplemental-ui/partials/`): the theme's Red Hat Demo Platform logo and link are
replaced on purpose, because this site is not part of that platform.

## Git

- Only `main`; no version branches or tags.
- No secrets, no links to the repositories of the earlier version of the workshop (attribution
  is in the gitops repository's README "Credits" and `docs/origin.md`).
- Commit messages without AI or Claude attribution.
