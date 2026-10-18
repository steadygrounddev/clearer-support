# Clearer support site: technical plan

Source: [issue #2, Site requirements](https://github.com/steadygrounddev/clearer-support/issues/2). This plan covers the technical foundation only. Writing the guide and FAQ content comes after.

## Requirements

- Every page has a stable permalink of the form `/{section}/{slug}` that never changes.
- The site builds on every push to `main`.
- Sections: **Guides** (one explainer per tentpole feature) and **Help** (FAQ).

## Decisions

| Area | Decision |
| --- | --- |
| Stack | Jekyll 4.4.1 and Just the Docs 0.12.0 (as in the template), built by GitHub Actions |
| Structure | Two Jekyll collections, `_guides/` and `_help/`, with permalink `/:collection/:name/`, wired into Just the Docs navigation |
| Help layout | One page per question, each at `/help/{slug}/` |
| Permalink stability | A committed `permalinks.txt` manifest, checked in CI, plus `jekyll-redirect-from` so a moved page keeps its old URL |
| CI | Keep the Jekyll build. Add only the permalink manifest check (no link checker, no markdown lint) |
| Domain | `support.getclearer.me`: set `url`, commit a `CNAME` file, enforce HTTPS |
| Extras | Link to the app site, https://getclearer.me, a link to the privacy policy hosted there (not republished here), and a custom 404 page |
| Not included | No contact page, no local copy of the privacy policy |
| Template cleanup | Rewrite README, `_config.yml` and `index.md` for Clearer. Keep `ci.yml` and `pages.yml` |

## Current state

- The repo is the just-the-docs template and is otherwise untouched: `index.md`, `_config.yml`, `Gemfile` and `Gemfile.lock`, `README.md`, and two workflows.
- `pages.yml` already builds and deploys on push to `main`, so the "build on every push" requirement is met. `ci.yml` also builds on PRs.
- GitHub Pages is already set to **GitHub Actions** and serves `support.getclearer.me`. The HTTPS certificate is approved, and "Enforce HTTPS" is **off**.
- There is no `CNAME` file in the repo. `_config.yml` still points at the template's `url`.

## Work

### 1. Site config (`_config.yml`)

- Set `title` and `description` for Clearer support, and `url: https://support.getclearer.me`. Leave `baseurl` empty.
- Add `aux_links` pointing to the app site (https://getclearer.me) and to its privacy policy (https://getclearer.me/privacypolicy). Replace the template repo link.
- Add a `footer_content` line linking the privacy policy too, so it shows on every page.
- Declare the collections:

  ```yaml
  collections:
    guides:
      permalink: "/:collection/:name/"
      output: true
    help:
      permalink: "/:collection/:name/"
      output: true

  just_the_docs:
    collections:
      guides:
        name: Guides
        nav_fold: true
      help:
        name: Help
        nav_fold: true
  ```

- Add `jekyll-redirect-from` under `plugins:` (and to the `Gemfile`; regenerate `Gemfile.lock` with `bundle install`). Actions-based Pages builds allow plugins that the classic Pages build did not.
- Add `exclude:` entries for `PLAN.md`, `permalinks.txt` and `scripts/`, so they are not published.

### 2. Content skeleton

- `index.md`: Clearer-specific home page linking to Guides, Help and the app site.
- `_guides/` stubs with `title`, `nav_order` and a one-line summary. Slugs are proposed here and become permanent once published, so confirm them first:

  | File | URL |
  | --- | --- |
  | `access-groups.md` | `/guides/access-groups/` |
  | `limit-groups.md` | `/guides/limit-groups/` |
  | `how-groups-are-applied.md` | `/guides/how-groups-are-applied/` |
  | `streaks.md` | `/guides/streaks/` |
  | `focus-filters.md` | `/guides/focus-filters/` |
  | `places.md` | `/guides/places/` |
  | `always-allowed-apps.md` | `/guides/always-allowed-apps/` |

- `_help/` with one placeholder FAQ page showing the one-question-per-page pattern. Real questions come with the content pass.
- `404.md`: `permalink: /404.html`, `nav_exclude: true`, with links to Guides, Help and the app site.
- `CNAME` containing `support.getclearer.me`.

### 3. Permalink guard

- `permalinks.txt`: one published path per line, for example `/guides/streaks/`. Include `/` and `/404.html` if they should be protected.
- `scripts/check-permalinks.sh`: after `jekyll build`, check that each manifest path exists in `_site/` (`<path>/index.html`, or the file itself for `.html` paths). Print every missing path and exit non-zero.
- Add the step to `ci.yml` after the build, and also to the `pages.yml` build job so a bad commit on `main` never deploys.
- Convention, documented in the README: add a line to `permalinks.txt` in the same PR that publishes a page. Never delete a line. To move a page, give the new file `redirect_from: [/old/path/]` and keep the old line.

### 4. Workflows

- Keep `ci.yml` (build on PRs and `main`) and `pages.yml` (build and deploy on `main`).
- `pages.yml` runs `jekyll build --baseurl "${{ steps.pages.outputs.base_path }}"`. With a custom domain `base_path` is empty, so this needs no change. Verify after the first deploy.
- Check the pinned action versions that the template uses (`checkout@v7`, `configure-pages@v6`, `upload-pages-artifact@v5`, `deploy-pages@v5`) resolve. Dependabot already tracks bumps.

### 5. Domain and HTTPS

- After the `CNAME` file and `url` are merged, turn on HTTPS enforcement (needs your go-ahead, since it changes repo settings):

  ```bash
  gh api -X PUT repos/steadygrounddev/clearer-support/pages -F https_enforced=true
  ```

### 6. README

- Replace the template README with: what the site is, how to run it locally (`bundle install`, `bundle exec jekyll serve`), how to add a guide or help page, and the permalink rules from step 3.

## Verification

- `bundle exec jekyll build` succeeds locally.
- `scripts/check-permalinks.sh` passes against the built `_site/`, and fails when a line is added for a page that does not exist.
- `bundle exec jekyll serve`: check the nav shows Guides and Help, the seven guide URLs resolve, `/help/<slug>/` resolves, `/nonexistent/` shows the custom 404, and the aux link goes to https://getclearer.me.
- After merge: the Pages deploy goes green, `https://support.getclearer.me/guides/streaks/` loads over HTTPS, and `http://` redirects to `https://`.

## Open items

- Guide slugs confirmed by you. They become permanent once published.
- Home page and guide stub copy: I will draft it from the app repo's `docs/feature-plan.md` unless you want to write it.
- Privacy policy URL is https://getclearer.me/privacypolicy.
- Not in scope here: the content of the guides and FAQ, a contact page, a local privacy policy page, search tuning, and any analytics (the Clearer principle is zero data collection, so none).
