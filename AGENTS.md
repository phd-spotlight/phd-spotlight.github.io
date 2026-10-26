# PhD Spotlight website

## Project and editing workflow

This repository contains the static website for PhD Spotlight 2026 at
https://phd-spotlight.github.io/. It uses plain HTML and CSS, with no build step,
package manager, framework, or automated test suite configured.

- `index.html`: all page content, metadata, registration links, and analytics.
- `style.css`: layout, typography, colors, responsive rules, and animations.
- `assets/organizers/`: organizer photographs.
- `assets/favicon.svg`: site icon.
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

The stylesheet currently uses a version query in `index.html` (`style.css?v=6`).
Increment it when changing CSS if needed to prevent stale cached styles. If a
reported visual change is missing, inspect the loaded stylesheet and deployment
before making further speculative design changes.

## Event content

- Name: **PhD Spotlight 2026**.
- Institution: **Department of Computer Science, University of Pisa**.
- Date: **Monday, November 23, 2026**, in the afternoon.
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

## Maintaining this guidance

Update this file when the user changes an established project decision. Current
user instructions take precedence over this record. Keep implementation facts
distinct from user preferences and do not preserve rejected designs as defaults.
