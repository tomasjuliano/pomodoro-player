# Foco y Música — design system

World: **Tapa de disco** (v2). The session is a record: the timer lives on an LP sleeve in the hard-bop cover tradition (flat inks, enormous stacked condensed type), a vinyl slides out of the sleeve and spins while time runs, and the session reads as a tracklist. Replaces v1 "Campo de color" (Swiss drenched field).

## Colour

Each phase is a two-ink sleeve: **cover** (ground), **ink** (clock and text), **label** (phase word, record label).

| Sleeve | Light cover / ink / label | Dark cover / label |
|---|---|---|
| Focus, running | `#1d3fd8` / `#ffffff` / `#ffd23f` | `#1733b8` / `#ffd23f` |
| Focus, idle or paused | `#3b4a8c` / `#ffffff` / `#e3cf7a` | `#232c5e` / `#cdb862` |
| Break, running | `#f2b705` / `#111111` / `#1d3fd8` | `#d9a404` / `#1d3fd8` |
| Break, idle or paused | `#c4a650` / `#111111` / `#26388f` | `#6f5f2c` (ink `#f3ead2`) / `#b9c6ff` |
| Finished | `#e6dfcc` / `#111111` / `#1d3fd8` | `#2a2823` (ink `#efe9dc`) / `#ffd23f` |

Page (record-store wall): light `--page #ece6d8`, ink `#16140f`, muted `#5f594d`, line `#d3cbb8`; dark `#131210` / `#efe9dc` / `#a7a090` / `#2d2a24`.
Liner-notes sheet: light `#f8f5ee` (inputs `#efeadf`, line `#ddd5c3`); dark `#1c1a17` (`#25221e`, `#332f29`).
Accent for sheet actions: `#1d3fd8` (dark `#7d96ff` with ink `#0b1238`). Danger: `#c2321f` / `#ff7a66`. Vinyl `#0d0d0f` with grooves `#1d1d21`.

### Theme pressings

The table above is the default pressing, **Azul y mostaza** (light and dark). Seven more themes keep every rule of the world (two-ink sleeve per phase, drained when paused, bone/paper page) and change only the inks. Four light, four dark; "Automático" follows the system between the two Azul y mostaza pressings.

| Theme | Mode | Focus cover / ink / label | Break cover / ink / label | Page / accent |
|---|---|---|---|---|
| Imprenta | light | `#c8321b` / `#ffffff` / `#151515` | `#1c1c1c` / `#f3ead8` / `#ff5a3c` | `#efe8dc` / `#c8321b` |
| Bossa | light | `#0e6b52` / `#fbf4e4` / `#ffb347` | `#f4a9a0` / `#1d1a17` / `#0b5a45` | `#eef0e6` / `#0e6b52` |
| Risografía | light | `#007a85` / `#ffffff` / `#ffd2e3` | `#ff8fb8` / `#20123a` / `#005f68` | `#f6efe9` / `#007a85` |
| Humo y bronce | dark | `#7d1d2c` / `#f6ead6` / `#e7b24a` | `#c99a3f` / `#1c1210` / `#5e1220` | `#141011` / `#e7b24a` |
| Neón | dark | `#5b2bd6` / `#ffffff` / `#4ef2c5` | `#ff6f59` / `#1a0f2e` / `#341a8c` | `#0f0c17` / `#4ef2c5` |
| Lima | dark | `#c6ef3a` / `#121410` / `#2d3bd1` | `#e9e4d6` / `#121212` / `#c23a22` | `#101210` / `#c6ef3a` |

Paused inks are derived in OKLCH (chroma ×0.42, lightness ×0.9 light / ×0.78 dark for light-ink sleeves), hand-set where a sleeve is already near black or bone (Imprenta, Lima). Every pair is checked: ink on cover ≥4.5:1, label on cover ≥3:1 (running and paused), page and sheet text ≥4.5:1, accent ≥3:1. Full token sets live in `index.html` as `:root[data-theme="…"]` blocks, which also scope `.sw[data-sw="…"]` so each picker swatch renders with its own theme's real tokens.

Rule: the sleeve swaps inks between phases (blue/white for focus, mustard/black for break) so the phase reads from across the room; paused drains the hue. Cover colour crossfades over .9 s.

## Type

- **Big Shoulders Display** 700–900 (Google Fonts), fallback `Bahnschrift, Arial Narrow`: phase word (900, uppercase, `clamp(54px, 15.5cqi, 168px)`, line-height .8, in the label ink), clock (800, `clamp(92px, 27cqi, 300px)`; each digit in a fixed .52em cell so it never jitters), section titles (900 uppercase: "Lado A", "Música", "A continuación"), track and block numbers.
- **Barlow** 400–700, fallback `Segoe UI, system-ui`: all UI and body text, 15px base.
- Labels and copy in sentence case; uppercase only for the display words and the main action.

## Layout

- Stage (container query): sleeve with the cover on top and the vinyl behind it, sticking out to the right (`--D: min(44cqi, 360px)`, reserved `0.36·D`). Then the now-playing strip, then the tracklist.
- ≥1100px: stage (1.5fr) beside the liner-notes sheet (min 360px). Below: one column.
- Square-ish corners everywhere (2–4px): sleeves, buttons, inputs, chips.

## Components

- **Vinyl** (signature): grooves via repeating radial gradient, a conic sheen so rotation is visible, label in the phase's label ink. Tucked 24% behind the sleeve when idle; slides fully out (1.1 s expo-out) and spins at 33⅓ rpm only while running.
- **Tracklist** ("Lado A"): every block and break is a track — number, name, dotted leader, duration, state. Done tracks are struck through with a check; the current track is inverted in the sleeve colours, fills left-to-right with elapsed time and shows the time left.
- **Now playing strip**: mini vinyl (spins with the music), title, source, next track, transport (round play button), volume.
- **Buttons on the cover**: main = ink fill with cover-coloured uppercase text (hover: label ink); secondary = 2px ink outline; icon buttons 44px. State tag: dashed outline.
- **Side panel** for plan, alarm and theme: slides in from the right, 6px left edge in the current sleeve colour, Plan / Alarma / Tema switch, closes with X, Esc or a click outside.
- **Theme picker**: square 34px outline button (palette icon) after Plan/Alarma opens the side panel on its third tab, "Tema". Options are miniature records on their own page: the break sleeve behind with a label dot, the focus sleeve in front with "FOCO" in its label ink. "Automático" first (light and dark pair), then Claros and Oscuros in two-column grids; a radio group (arrows move and apply), selected = 2px ink border plus check. The backdrop stays clear on this tab so the cover is the live preview. Stored per viewer and applied before first paint via `data-theme` on the root.
- Icons: inline SVG, filled 24-grid.

## Desktop window (Neutralino)

Borderless window with an HTML title bar (36px) on the page colour: icon, "FOCO Y MÚSICA" in the display face, live status with a dot in the sleeve colour; Windows caption buttons (46×36, Segoe Fluent Icons; close hover `#c42b1c`). Double-click maximizes; dims when unfocused; only the content scrolls; invisible 5px edges and 10px corners resize. App icon: blue sleeve with a yellow-label record sliding out.

## Browser surfaces

Selection in the accent (inverted on the cover); caret and `accent-color` follow the accent; scrollbars tinted from page/sheet lines; focus ring 2.5px in current ink.
