# Clearer support site

Source for [support.getclearer.me](https://support.getclearer.me), the support site for [Clearer](https://getclearer.me). Built with Jekyll and the [Just the Docs](https://just-the-docs.github.io/just-the-docs/) theme, and deployed to GitHub Pages by GitHub Actions on every push to `main`.

## Sections

- **Guides** (`_guides/`): one explainer per feature, published at `/guides/{slug}/`.
- **Help** (`_help/`): FAQ, one page per question, published at `/help/{slug}/`.

## Adding a page

1. Create `_guides/<slug>.md` or `_help/<slug>.md` with front matter:

   ```yaml
   ---
   title: Page title
   nav_order: 8
   ---
   ```

2. Add the new URL (for example `/help/<slug>/`) to `permalinks.txt`, in the same PR.

The filename is the slug, so choose it carefully.

## Permalinks never change

Published URLs are permanent. `permalinks.txt` lists every published URL, and CI (`scripts/check-permalinks.sh`) fails if any of them is missing from the built site.

- Never remove a line from `permalinks.txt`.
- To rename or move a page, keep the old URL working with `redirect_from` on the new page, and leave the old line in the manifest:

  ```yaml
  redirect_from:
    - /guides/old-slug/
  ```

## Local preview

Requires Ruby 3.3 and Bundler.

```bash
bundle install
bundle exec jekyll serve
```

The site is served at `http://localhost:4000`. To run the permalink check, build first and then run it:

```bash
bundle exec jekyll build
scripts/check-permalinks.sh
```

## Deployment

`.github/workflows/pages.yml` builds and deploys on every push to `main`. `.github/workflows/ci.yml` builds and checks permalinks on pull requests too. The custom domain is set by the `CNAME` file and in the repository's Pages settings.

## License

MIT. See [LICENSE](LICENSE).
