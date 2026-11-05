# PhD Spotlight website

## Project and editing workflow

This repository contains the static website for PhD Spotlight 2026 at
https://phd-spotlight.github.io/. It uses plain HTML and CSS, with no build step,
package manager, framework, or automated test suite configured.

- `index.html`: all page content, metadata, registration links, and analytics.
- `style.css`: layout, typography, colors, responsive rules, and animations.
- `assets/organizers/`: organizer photographs.
- `assets/favicon.svg`: site icon.
- `first-edition/`: static archive of the 2024 edition, linked from the footer
  ("First edition (2024)"). It is built output, not sources: generated from
  the `first-edition` branch of `di-unipi/phd-spotlight` with
  `jekyll build --baseurl /first-edition`. Its CSS is the original production
  `main.css`. The branch's `css/main.scss` has no front matter, so Jekyll does
  not compile it. Do not hand-edit it; rebuild instead.
- `Makefile`: `make publish` copies `index.html`, `style.css`, `assets/**` and
  `first-edition/**` to the department server with `rclone copy` (no
  deletions). It needs a local rclone SFTP remote named exactly `PHDSPOTLIGHT`.
- `.nojekyll`: retain for static GitHub Pages hosting.
- `AGENTS.md`: shared project guidance and decisions.
- `CLAUDE.md`: imports this guidance for Claude; keep shared information here.

Make focused edits to the existing files. Preserve unrelated user changes. A local
edit does not mean the live website has been deployed; do not claim publication
without verifying it. Do not introduce a framework or build tooling for simple
content or styling changes.

For local preview, run `python3 -m http.server 8000` from the repository root and
open `http://localhost:8000`. Check changed layouts at desktop and mobile widths
when a browser is available, especially long organizer descriptions. Check local
asset references and registration links after relevant edits. Do not add tests
that merely duplicate static copy, or claim browser validation if none was done.

The stylesheet currently uses a version query in `index.html` (`style.css?v=7`).
Increment it when changing CSS if needed to prevent stale cached styles. If a
reported visual change is missing, inspect the loaded stylesheet and deployment
before making further speculative design changes.

## Event content

- Name: **PhD Spotlight 2026**.
- Institution: **Department of Computer Science, University of Pisa**.
- Date: **Monday, November 30, 2026**, in the afternoon (moved from November 23).
- Exact times remain to be announced; the program is a draft.
- Purpose: PhD students present research through posters and short talks;
  students can discover research, find thesis ideas, and meet researchers.
- Program: either keynote talks (3–4 talks of 10–15 minutes) or lightning
  pitches, followed by the poster session and refreshments. Keynotes and pitches
  are mutually exclusive alternatives; the format remains to be confirmed.
- Organized by the PhD student representatives.

Keep the institution explicit in the hero, About section, search description,
and Open Graph description. Keep event details consistent across these locations.
Do not invent exact times, a venue, speakers, or deadlines.

The website copy is in English. There are separate Google Forms for **Attend**
and **Present a poster**, each linked in both the hero and Join section. Preserve
the existing form URLs in `index.html` and keep duplicate links synchronized.
If the keynote format is chosen, speakers are selected from poster submissions,
as described in the Join section. Do not imply that keynotes are confirmed or
list keynotes and lightning pitches as two separate scheduled sessions.

## Visual design and hero typography

Retain the dark navy background, warm gold accents, the three animated
spotlights (a centre beam plus dimmer left and right beams with independent
timing), and responsive layout. Preserve keyboard focus indicators, meaningful
image alt text, and reduced-motion support.

The following are two separate text blocks with visibly distinct typography:

1. **Institutional description:** “The PhD poster session of the Department of
   Computer Science, University of Pisa.” Keep this complete sentence in its own
   `.event-description` paragraph. Current styling is Inter, 15 px, regular,
   light gray.
2. **Tagline:** “Discover the research, meet the people doing it.” Keep this in a
   separate `.lead` paragraph. Current styling is Georgia italic, 24–34 px,
   gold, with a line break after “research,” and a thin gold divider above it.

The hero date (`.meta`) is a third, distinct element: a pill-shaped badge with
a thin gold border, Inter 13 px semibold, uppercase with wide letter spacing,
light text with the date itself in gold. It replaced plain gold Inter text.

The user explicitly wants these two sentences to look different, not merely
parts of a single paragraph. Do not split the institutional sentence into a stack
of labels. The handwritten Caveat font was rejected; do not reintroduce it.
Instrument Serif remains the display font for the main title, section headings,
and organizer names; Inter is the body font.

## Organizers

Sort alphabetically by **surname**, while displaying names in given-name/surname
order. The order and exact course/representation text are:

| Name | PhD course | Representation |
| --- | --- | --- |
| Alessio Cascione | National PhD in Artificial Intelligence | Representative at the PhD Steering Committee |
| Malio Li | PhD in Computer Science | Representative at the PhD Steering Committee |
| Luca Miglior | PhD in Computer Science | Representative at the Department Council |
| Matteo Tolloso | National PhD in Artificial Intelligence | Representative at the Department Council |
| Calogero Turco | PhD in Computer Science | Representative at the PhD Steering Committee |

Spell out **Artificial Intelligence** for Alessio and Matteo; do not shorten it to AI.
Keep the PhD course distinct from the body on which the person represents students.
All five representation descriptions start with **Representative at the**.

Each organizer has three stacked text elements:

1. Name: one line, Instrument Serif, 24 px, linked to the existing profile.
2. Course: smaller Inter text, 13 px.
3. Representation: monospace text, 11.5 px.

Do not add separate “PhD course” or “Student representative” label rows: that
layout was rejected. Allow longer course/representation text to wrap naturally
on narrow screens rather than clipping it or shrinking it excessively.

Photographs are circular, **96 × 96 px**. The organizer grid is two columns on
desktop and one column at the existing mobile breakpoint of 600 px.

The source photo for Malio was a group photograph, with Malio in the center.
It was moved from the repository root to `assets/organizers/malio-li.jpg`.
The asset is still the full photograph; `.avatar-malio` and its nested image
provide the close framing through CSS. Preserve this framing when changing image
sizes. Do not restore the original root-level copy. Other photos are named
`luca-miglior.jpg`, `matteo-tolloso.jpg`, and `calogero-turco.jpg` in the same folder.

Alessio's photograph is `assets/organizers/alessio-cascione.jpg`, downloaded from
`https://acascione.github.io/profile.webp` (the source serves JPEG data despite
its extension). His name links to his personal website, https://acascione.github.io/.

## GoatCounter and sharing links

The following script is embedded once, immediately before `</body>`:

```html
<script data-goatcounter="https://phd-spotlight.goatcounter.com/count"
        async src="//gc.zgo.at/count.js"></script>
```

Dashboard: https://phd-spotlight.goatcounter.com/

The current sharing convention uses **only `utm_source`**. Campaign parameters
were discussed, but the user chose not to use `utm_campaign` for now. Do not add
`utm_campaign`, `utm_medium`, or other tracking parameters unless requested.

Use these source-specific links when sharing the same website:

| Channel | URL |
| --- | --- |
| Department email | https://phd-spotlight.github.io/?utm_source=department-email |
| LinkedIn | https://phd-spotlight.github.io/?utm_source=linkedin |
| WhatsApp | https://phd-spotlight.github.io/?utm_source=whatsapp |
| Printed poster QR code | https://phd-spotlight.github.io/?utm_source=poster-qr |

These are prepared sharing links, not evidence that posts, emails, or QR codes
have been created. Use the tagged URL as the QR code destination if asked to
generate one. Keep source names lowercase and consistent. Source tagging does
not require additional website code or separate pages. Keep the canonical Open
Graph URL untagged.

GoatCounter reference: https://www.goatcounter.com/help/campaigns

## Previous edition and department site

State checked on 2026-11-05. Re-verify before acting on it.

### Previous edition (2024)

- "PhD Spotlight – From Study to Research", Monday 11 November 2024,
  14:00–16:30, corridor in front of the Seminar Rooms, Department of Computer
  Science. Its About page calls it the first edition. Jacopo Massa (a former
  organizer) calls the 2026 event the second edition; nothing suggests a 2025
  edition, but confirm before printing an edition number.
- 22 posters, published one page per poster on the old site.

### Old repository: https://github.com/di-unipi/phd-spotlight

- Public repository in the `di-unipi` organization, maintained by Jacopo Massa,
  who invited Matteo to it so that everything can live in one place. Whether
  the invitation was accepted has not been checked. Nothing has been changed
  there.
- Jekyll site (Bootstrap "cards" theme, `jekyll-paginate`, `jekyll-seo-tag`),
  about 49 MB. Each poster is a `_posts/2024-11-11-<surname>.md` file whose
  front matter has `id`, `show`, `title`, `category` (topics) and `authors`,
  with the abstract as the body. The PDF is `images/pdf/<id>.pdf` and the
  thumbnail is `images/png/<id>.png`, made by `pdf-to-png.sh` (ImageMagick,
  800×450). `show: false` shows a placeholder image and no download button.
- `CNAME` is `phdspotlight.di.unipi.it`. Contact email in `_config.yml`:
  `comunicazione@di.unipi.it`.

### How the department site is actually served

- `phdspotlight.di.unipi.it` resolves to 131.114.22.75
  (`webhost2.sid.unipi.it`), a University Apache server, **not** GitHub Pages.
  It still serves the 2024 site (Last-Modified 20 January 2025).
- It looks unreachable because its TLS certificate (GEANT OV RSA CA 4) **expired
  on 7 November 2025**: browsers show a security error. Plain HTTP (port 80)
  resets the connection. SSH (port 22) is open.
- GitHub Pages is also enabled on `di-unipi/phd-spotlight` and rebuilds on every
  push. Jacopo points to the deployments
  (https://github.com/di-unipi/phd-spotlight/deployments/github-pages) and the
  Pages settings as proof that deployment is automatic.
  - The deployments really do succeed (latest: 2026-09-01, commit `fe01d63`,
    environment URL `http://phdspotlight.di.unipi.it/`).
  - GitHub would serve the domain: a request sent straight to GitHub's Pages IP
    returns the build, with `Server: GitHub.com`.
  - But public DNS (8.8.8.8, 1.1.1.1 and the system resolver, checked on
    2026-11-05) resolves `phdspotlight.di.unipi.it` as a CNAME to
    `webhost2.sid.unipi.it` (131.114.22.75). It does not resolve to GitHub
    (`185.199.108–111.153`). Visitors therefore get the University Apache copy
    (`Server: Apache`), and `di-unipi.github.io/phd-spotlight/` only
    redirects there.
  - The two copies currently show the same 2024 content, which hides the
    problem. A new push would update only the GitHub copy.
  - These checks were run from a machine **inside** the University network
    (public IP 131.114.50.236, GARR Pisa). To rule out an internal DNS
    override, the name was also resolved over DNS-over-HTTPS (Google and
    Cloudflare, over TLS, so a local network cannot alter the answer). Google's
    resolver was confirmed to be the real one. The University's authoritative
    nameservers (`ns1`/`ns2.unipi.it`) were also queried directly. All of them
    returned `webhost2.sid.unipi.it`. The only remaining caveat is
    source-based split DNS on the authoritative servers, which is unlikely
    because Cloudflare (it sends no client-subnet information) gives the same
    answer.
  - A decisive check from outside the network (for example a phone on mobile
    data): `curl -skI https://phdspotlight.di.unipi.it | grep -i server`.
    `Apache` means the University server; `GitHub.com` means Pages.
  - Over plain HTTP the TCP connection opens, but it is reset as soon as the
    request is sent (seen again on 2026-11-05 after the redeploy). So
    `http://phdspotlight.di.unipi.it` does not work and only `https://`
    does, with the certificate warning. This is server or network
    configuration, outside the hosting account: an `.htaccess` cannot fix it,
    because Apache never answers. Checked only from inside the University
    network. `www.phdspotlight.di.unipi.it` has no DNS record, although the
    certificate lists it.
- Jacopo says the expired certificate "should not bother us". It does not
  affect GitHub Pages builds. Visitors still see a full-page browser warning,
  which they can bypass manually because there is no HSTS header. At least from
  the University network port 80 does not answer, so HTTPS is the only way in.
- The University server is updated with rclone, not by pushing:
  `.github/workflows/rclone-publish.yaml` runs only by manual
  `workflow_dispatch` (the push trigger is commented out). It builds Jekyll on
  Ruby 2.7.8 and runs `rclone copy ./_site PHDSPOTLIGHT:/web --delete-during`,
  using the repository secrets `RCLONE_CONFIG` and `RCLONE_CONFIG_PASS`.
  `make publish` does the same with `rclone sync` from a configured machine.
  Since January 2025 the repository's Actions history only shows GitHub Pages
  builds, not rclone runs.
- So Jacopo's statement that "an `index.html` in the repository root is enough;
  deployment is automatic" is **not** true for the department server. The SSH
  inspection below confirms that nothing pulls from GitHub.

### What the server looks like over SSH (read-only inspection, 2026-11-05)

- ISPConfig-style shared hosting: Debian 11, the user is confined to a jailkit
  chroot, site `client8/web868`. No `crontab` command and no `.git` in the
  document root, so there is no automatic pull or deploy.
- Inside the jail:
  - `/web`: the document root. It holds the built 2024 Jekyll site, one folder
    per poster, `images/pdf` with 22 PDFs, `images/png`, `CNAME` and
    `feed.xml`, last changed in January 2025.
  - `/web/stats`: AWStats reports, publicly reachable at `/stats/`.
  - `/log`: Apache access and error logs, rotated daily, kept for about two
    months.
  - `/ssl`: the certificate, key and CSR, dated 7 November 2024 and owned by
    root. The certificate cannot be renewed from this account; the hosting
    administrators (`sid.unipi.it`) must do it.
  - `backup`, `private`, `webdav`, `cgi-bin` and `tmp` are empty.
- The jail has `git`, `rsync`, `scp`, `wget`, `curl`, `php`, `mysql`, `nano`,
  `tar`, `zip`/`unzip`. There is no `openssl`, `uniq` or `df`. A future deploy
  can therefore be `rsync`/`scp` from a local machine, or a `git clone`/`pull`
  run by hand on the server.
- The shell history shows that earlier updates were done by hand (editing
  `index.html` files under `/web` with `nano`, `rm -rf`, `make publish`). The
  last login before ours was on 2026-11-04, probably Jacopo's; it removed an
  empty `~/web` folder in the home directory, not the document root.
- Traffic from September to November 2026 is almost entirely crawlers and
  vulnerability scanners (probes for `/.env`, `/.git/config`, `wp-config`, and
  so on; ModSecurity logs them). Real visits are few. The expired certificate
  discourages browsers anyway.
- `--delete-during` and `rclone sync` delete server files that are not in the
  build. Deploying a new site this way would remove the 2024 archive unless the
  2024 content is in the build.
- Jacopo sent SSH credentials privately. On the user's machine (`dgx-a100-2`)
  they are stored outside the repository in
  `~/.config/phd-spotlight/server.env` (mode 600: host, user, password,
  document root), and in the rclone remote `PHDSPOTLIGHT`. Read them from
  there when needed. **Never write SSH usernames,
  passwords, or other credentials into this repository**: it is public, and
  GitHub Pages serves every file in it, including `AGENTS.md`. Because the
  password was shared in chat, it would be sensible to change it.

### Decisions and plan

- **https://phd-spotlight.github.io (this repository) stays the primary site.**
  Printed posters already link to it (QR code with `utm_source=poster-qr`). Do
  not remove it, rename the repository, or redirect it elsewhere.
- The DNS mismatch does not block GitHub Pages deployments; it makes them
  invisible. Two ways to make a department-domain copy show up:
  1. Ask the `unipi.it` DNS administrators to point `phdspotlight.di.unipi.it`
     to GitHub, with a CNAME to `di-unipi.github.io`. Pushes would then deploy
     automatically, and GitHub Pages could issue its own HTTPS certificate,
     which would also fix the expired-certificate problem. The Apache copy
     would no longer be used.
  2. Keep the University server and upload the built site by hand with
     `rsync`/`scp` over SSH, or with the rclone workflow if its secrets still
     work. The certificate must be renewed by the hosting administrators.
- Jacopo's plan (2026-11-05), because getting changes from the hosting
  administrators ("polo2") is slow: he uploads the sources himself, moves the
  2024 site into a `first-edition/` subfolder, and adds a Makefile that
  publishes with rclone. Later, when he has time, he will ask for the DNS
  change. Points agreed or raised with him:
  - Rebuild the 2024 Jekyll site with `baseurl: "/first-edition"`. Its
    templates build links through `relative_url` / `site.baseurl`, so a rebuild
    fixes them, but copying the old `_site` into the subfolder as it is would
    break them. Optionally add `.htaccess` redirects from old URLs such as
    `/li/` to `/first-edition/li/`.
  - `rclone sync` or `--delete-during` on `/web` deletes anything that is not
    in the source, including `/web/stats` (AWStats) and `first-edition/`.
    Exclude them or use `rclone copy`.
  - Keep the rclone configuration and passwords out of the public repository.
  - This repository stays the source for the 2026 site. Every change here (for
    example the date) has to be republished to the server by hand until the
    DNS points to GitHub.
- **What happened (2026-11-05, around 11:50)**: Jacopo published the 2026 site
  on the department server.
  - On the server he moved all the old content into `/web/first-version/`,
    without rebuilding it. `/web` now holds `index.html`, `style.css`,
    `assets/` and `first-version/`. The AWStats folder `stats/` also ended up
    inside `first-version/`.
  - In `di-unipi/phd-spotlight`, `main` now holds a copy of this repository's
    2026 files (including `AGENTS.md` and `CLAUDE.md`) and a `Makefile`:
    `make publish` runs `rclone copy` of `index.html`, `style.css` and
    `assets/**` to `PHDSPOTLIGHT:/web`, without deleting anything. The 2024
    Jekyll sources were removed from `main` and kept in the `first-edition`
    branch.
  - His copy of `index.html` adds a footer link
    `<a href="/first-edition/">First edition</a>`. This repository does not
    have that link yet.
  - Setup for `make publish`: run `rclone config`, create a remote named
    exactly `PHDSPOTLIGHT`, storage type SFTP, with the SSH host, user and
    password that Jacopo sent privately. Never commit them.
- **Problems found right after publishing** (checked from the University
  network):
  - The footer link `/first-edition/` returns 404, because the folder is
    called `first-version`.
  - `/first-version/` loads, but its links still point to the root (for
    example `/css/main.css`, `/li/`). The page has no styling and the poster
    links return 404. It needs a rebuild of the `first-edition` branch with
    `baseurl` set to the folder name.
  - On GitHub Pages the same relative link `/first-edition/` would also return
    404, because the first edition is not hosted there.
  - The department copy was published from this repository's pushed `main`
    before the 30 November date fix: the badge shows November 30, but the
    `datetime` attribute and the meta and Open Graph descriptions still say
    November 23.
  - The 2026 site now exists in two repositories. Decision (user, 2026-11-05):
    **this repository is the single source**, for both GitHub Pages and the
    department server. Publish to the server with `make publish` from here.
- **Fix prepared on 2026-11-05**: the first edition was rebuilt into
  `first-edition/` here. The footer link (`/first-edition/`, relative) works
  on both hosts, and the date fix and Makefile are included. Claude was not
  allowed to deploy, so the user pushed and ran `make publish`, then moved
  `stats` back to `/web/stats` and deleted `/web/first-version/`. Verified
  on 2026-11-05: `/first-edition/` (pages, CSS, PDFs) and `/stats/` return
  200 on both hosts, and both show November 30. The rclone remote
  `PHDSPOTLIGHT` is configured on the user's machine (`dgx-a100-2`).
- The copy on `phdspotlight.di.unipi.it` is secondary. Before sharing that
  address, the certificate must be renewed (through the
  University/department IT that manages `webhost2.sid.unipi.it`). If a mirror is
  made, keep the canonical and Open Graph URLs pointing to
  `https://phd-spotlight.github.io/`, and keep this repository as the source.
- Not yet decided: how to combine both editions in one place. Options:
  (a) keep the 2024 Jekyll archive as it is and add the 2026 site to the
  department server under its own path (for example `/2026/`);
  (b) keep both editions in one repository with an **edition switch**
  (proposed by the user, not implemented). Sketch: the current edition stays
  at the root URL, so the printed QR codes keep working. Each past edition
  gets its own subfolder (`/2024/`), and a small control in the page header
  (for example a "2026 · 2024" pill in the existing gold style) links between
  them. Because this repository has no build step and uses `.nojekyll`, the
  2024 site would be committed as static output: build it with
  `baseurl: "/2024"` first, because the old templates use root-absolute links
  such as `/li/` and `/images/...`. Alternatively, rewrite it as plain HTML.
  The 2026 posters could go into `/2026/posters/` later in the same format.
- Posters: in 2024 they were published directly on the site (abstract, PDF and
  thumbnail for each). For 2026 they are being collected through the "Present a
  poster" Google Form. After the event, export the form responses into the same
  fields (title, authors, topics, abstract, PDF) so that both editions can be
  published consistently. Check presenters' consent to publish before uploading
  their posters.

### Open questions

- Who among the `sid.unipi.it` hosting administrators can renew the TLS
  certificate for `phdspotlight.di.unipi.it` (ISPConfig, possibly with
  Let's Encrypt)? The account cannot do it.
- Are the rclone secrets in `di-unipi/phd-spotlight` still valid, and will
  Jacopo or the department keep running the deployment? Without them,
  deploying means `rsync`/`scp` over SSH.
- Should the 2026 site be mirrored to the department domain before
  30 November 2026, or only archived there after the event?

## Maintaining this guidance

Update this file when the user changes an established project decision. Current
user instructions take precedence over this record. Keep implementation facts
distinct from user preferences and do not preserve rejected designs as defaults.
