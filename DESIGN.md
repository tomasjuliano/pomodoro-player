# Foco y Música — design system

World: **Campo de color**. The phase colour drenches the whole page so the state reads from the corner of the eye; a sheet holds setup.

## Colour

| Token | Light | Dark | Use |
|---|---|---|---|
| `--focus-field` | `#d3361f` | `#6e1a10` | Page ground while a focus block runs |
| `--focus-idle` | `#6b524c` | `#2e2321` | Focus phase not started or paused |
| `--rest-field` | `#1d7356` | `#0e3a2b` | Page ground while a break runs |
| `--rest-idle` | `#4a5f56` | `#1c2a24` | Break paused or waiting |
| `--done-field` | `#2b2f3a` | `#16181f` | Session finished |
| `--field-ink` | `#ffffff` | `#ffe9e2` | All text and marks on the field |
| `--sheet` / `--sheet-2` | `#fbf8f7` / `#f2edeb` | `#1a1615` / `#241e1d` | Setup sheet and its inputs |
| `--sheet-ink` / `--sheet-muted` | `#1e1a19` / `#675e5b` | `#eee7e4` / `#a59a96` | Text on the sheet |
| `--accent-focus` / `--accent-rest` | `#c2311b` / `#1a6b50` | `#ff7a5c` / `#4cc79a` | Accents on the sheet, follow the phase |

Rule: running = saturated field, paused/idle = same hue drained toward slate. The field crossfades over 1.2 s (expo ease-out) on every phase or state change; that is the only ambient motion.

## Type

One family, **Archivo** (Google Fonts, variable `wdth` 62–125, `wght` 100–900), fallback `Segoe UI, system-ui`.

- Clock: weight 800, `wdth` 72, tabular numerals, `clamp(84px, 31cqi, 300px)` of the stage width (22cqi when hours show), line-height .82.
- Phase word: 800 / `wdth` 88 / 26px. Section headings: 750 / `wdth` 90 / 19px.
- UI and body: 400–600 / `wdth` 100 / 15px; meta 13–14px.
- Sentence case everywhere; no all-caps labels or eyebrows.

## Layout

- Under 1100px: one column. Field content (top line, clock, meta, controls, ruler, music bar), then the sheet.
- 1100px and up: field column (1.45fr, sticky) beside the sheet (min 360px).
- Side gutter `max(20px, safe-area)`, 16px under 520px.

## Components

- **Session ruler** (signature): segments sized by duration; focus blocks 34px tall with solid border, breaks 14px dashed; fill = elapsed; SVG minute ticks (every 5 min taller; 5/30 when the session passes 4 h); block numbers below; a now marker with a notch.
- **Buttons on field**: pill. Main = ink fill with field-coloured text; secondary = 1.5px ink outline; icon buttons 44px. Hover = 14% ink wash.
- **Sheet buttons**: `btn-solid` (accent fill), `btn-quiet` (sheet-2 with line border). Segmented switch for YouTube/Spotify.
- **Side panel**: "Plan" and "Alarma" buttons in the top line open a panel that slides in from the right (sheet colours, 460px, dimmed backdrop) with a Plan de bloques / Alarma switch; closes with X, Esc or a click outside, and returns focus to the button that opened it.
- Icons: inline SVG, filled 24-grid, one weight.

## Browser surfaces

`::selection` inverts field and ink; caret and `accent-color` follow the phase accent; scrollbars tinted from field ink or sheet line; focus ring 2.5px in current ink.

## Desktop window (Neutralino)

Borderless window with an HTML title bar (36px) painted in the current field colour, so the phase colour reaches the window edge. Left: 16px icon, app name, live status (time and phase). Right: Windows caption buttons (46×36, Segoe Fluent Icons glyphs E921/E922/E923/E8BB; close hover `#c42b1c`). Double-click maximizes; the bar dims when the window loses focus. Only the content under the bar scrolls. Invisible 5px edges and 10px corners resize the window.
