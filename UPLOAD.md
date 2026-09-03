# Upload sheet — MakerWorld & Printables

Field-by-field values for publishing. The **description body lives in `LISTING.md`** and is not
duplicated here, so there is one source of truth; everything below is the surrounding metadata
and the platform-specific mechanics.

Researched Sept 2026. Where a platform does not publish a spec, it says so — check it live
rather than trusting a number here.

---

## Pre-flight

- [ ] Photos taken, at least one unmistakably a real print (**hard requirement on MakerWorld**)
- [ ] `./prep_release.sh` re-run so `dist/` matches the current source
- [ ] `python3 tools/meshcheck.py dist/models-stl/*.stl` — 6 × OK, bodies genus 6
- [ ] Caveat text in `LISTING.md` / `dist_README.txt` / `README.md` updated to match what was
      actually tested (see Phase C of the plan)
- [ ] Licence consistent: `LICENSE.txt`, the description, and the platform picker all CC BY-NC-SA 4.0

---

## Shared field values

| Field | Value |
|---|---|
| **Title** | Universal Dice & Counter Insert for Top-Opening Deck Boxes — MTG, Pokémon & Riftbound |
| **Summary** | A no-supports sliding-lid tray that fills the dead space in front of your deck. Flat on both faces, three game layouts, and a parametric source file so you can build your own. |
| **Licence** | CC BY-NC-SA 4.0 |
| **Category** | Gadgets → Board games / Tabletop accessories |
| **Description** | the whole `## Description` section of `LISTING.md` |

**Tags** — deck box, deck box insert, dice tray, dice insert, universal, mtg, magic the gathering,
pokemon, riftbound, tcg, card game, organizer, ultimate guard, boulder, gamegenic, dragon shield,
parametric, openscad, customizer, no supports, sliding lid

**Files** (12 models + source)

```
dist/models-stl/  BoulderInsert_{MTG,Pokemon,Riftbound}_{1-body,2-lid}.stl
dist/models-3mf/  BoulderInsert_{MTG,Pokemon,Riftbound}_{1-body,2-lid}.3mf
dist/source/      dice_insert.scad
```

**Images** — photos first, renders after:

1. Insert seated in the Boulder, deck behind it  ← cover
2. MTG loaded, lid half open
3. Pokémon loaded
4. Riftbound loaded
5. Back face, push-out holes
6. Lid closed, raking light on the seam
7. `dist/images/2-fits-in-case.png` — the exploded diagram still explains it better than a photo
8. `dist/images/1-*.png` — the three renders

Renders are 1600 × 1200 (4:3), which survives MakerWorld's card crop.

---

## MakerWorld

**The one that will bite you:** since **5 Feb 2026** every listing must carry at least one real
photograph of the printed part, and you must tick the control that marks it as real. Without it the
listing is *restricted from visibility* — it publishes, but nobody sees it. Renders may sit
alongside it; AI-generated "proof" photos are banned outright.

- Upload **both** STL and 3MF. 3MF is preferred there; both is fine.
- Upload `dice_insert.scad` **as well**. MakerWorld auto-detects it and adds a **Customize**
  button to the listing — few listings have one. Verified working: the file is self-contained,
  uses no post-2021.01 language features, and renders byte-identical geometry under OpenSCAD
  2021.01 (the version their Parametric Model Maker runs).
- **Do not attach a print profile.** MakerWorld print profiles are Bambu Studio objects; the QIDI
  Plus 4 cannot produce one, a QIDI-sliced 3MF will not be recognised as one, and publishing
  without a profile is explicitly supported. Others can attach their own later.
- Boost tokens require a bound Bambu printer, so they are out of reach regardless of what is
  uploaded here. Nothing is lost by skipping the profile.
- Licence picker: CC BY-NC-SA is available among the standard CC options. Ignore the Commercial
  License Membership and Exclusive Model Program — both are opt-in, and Exclusive requires 100+
  prints first and would delist the model everywhere else.

**Unverified:** MakerWorld publishes no official image resolution, aspect-ratio or file-size
limits. 1600 × 1200 is comfortably within every community-reported bound.

## Printables

- Accepts `.stl`, `.3mf`, `.obj`, `.amf`, and `.gcode`; images as JPG/PNG/GIF/TIFF.
- No real-photo mandate — a render-only listing is permitted here. Photos still go in, for
  credibility.
- No print-profile equivalent. "Makes" are posted by other people after the model exists.
- Licence picker includes CC BY-NC-SA 4.0.

**Verify live:** Printables' description formatting article is behind a bot-check, so the exact
Markdown subset is unconfirmed. Paste the description and **use the editor's preview** before
saving — check headings, tables and the fenced code block in "Make your own layout" specifically.
If tables do not render, flatten the two tables into bullet lists.

---

## What gets a listing hidden or penalised

Common to both: a cover image that does not match the downloadable files; licence on the page
disagreeing with the licence in the files; near-duplicate listings (this is why all three games
ship as one model, not three); IP infringement; fabricated engagement.

MakerWorld additionally: missing/unmarked real photo, low-quality bulk uploads, AI-faked proof
photos, and remixes relicensed more permissively than their parent.

Printables additionally: "low quality, intentionally erroneous, or with an incorrect label or
description" per their ToS.

---

## After publishing

- [ ] Both listings link to each other
- [ ] `README.md` gets the two published URLs
- [ ] Test the MakerWorld **Customize** button actually appears and produces a sane model
- [ ] Watch the first comments for fit reports in boxes other than the Boulder — those are what
      eventually earn the word "tested" in front of "universal"
