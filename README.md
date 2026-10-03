# Customising the Inner & Outer Loop Workshop

Hands-on tutorials that show organisations how to customise the
[Inner & Outer Loop Workshop](https://github.com/mostmark/inner-outer-loop-workshop-gitops) and run
it on their own OpenShift cluster: branding, new lab guide chapters, new exercise code, and
additional operators and per-participant resources.

**Read the tutorials:** <https://mostmark.github.io/inner-outer-loop-workshop-customising>

The tutorials follow one storyline: the fictional company ACME forks the workshop's three
repositories and turns it into its own version. You read this site; you don't need to fork it.

## Repository Layout

| Path | What |
|---|---|
| `content/modules/ROOT/pages/` | the pages |
| `content/modules/ROOT/nav.adoc` | navigation |
| `content/modules/ROOT/partials/_attributes.adoc` | shared attributes (the workshop's repository URLs and images) |
| `content/modules/ROOT/assets/images/` | diagrams (SVG) and screenshots |
| `content/antora.yml` | component descriptor, product versions |
| `content/supplemental-ui/` | additions to the theme: plain header and footer, `css/site-extra.css` |
| `content/lib/tab-block.js` | tabs in pages |
| `site.yml`, `build-site.sh` | Antora playbook and local build |
| `.github/workflows/gh-pages.yml` | publishes every push to `main` on GitHub Pages |
| `SCREENSHOTS-TODO.md` | screenshots still to capture, and how to capture them |

## Build Locally

```bash
./build-site.sh            # needs Node.js 20+ (uses npx) or the antora CLI
python3 -m http.server -d www 8080
```

Open <http://localhost:8080>. The build fails on any Antora warning. Antora reads the content from
Git, so the repository needs at least one commit; uncommitted changes in the working copy are
included.

## Related Repositories

- [inner-outer-loop-workshop-gitops](https://github.com/mostmark/inner-outer-loop-workshop-gitops): installs the workshop
- [inner-outer-loop-workshop](https://github.com/mostmark/inner-outer-loop-workshop): the lab guide
- [inner-outer-loop-workshop-code](https://github.com/mostmark/inner-outer-loop-workshop-code): the participants' code
