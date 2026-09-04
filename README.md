# TCG Deck-Case Spacer Inserts

A dice/counter tray that lives **inside** a top-opening vertical deck box, alongside the
cards. One parametric source, two variants.

The variants answer **"do you carry a coin?"**, not "which game do you play". The layouts
were named after games for three releases and it was always slightly a lie — nothing in
either is game-specific, and people picked the wrong one because they picked by the name on
the box rather than by what they actually carry.

**Fit spec:** the slab is **66 × 91 × 18.6 mm**. It drops into any top-opening deck box with
an interior at least 66 mm wide, 91 mm tall, with 19 mm of depth to spare.

The height is taken from the SLEEVE rather than the box: an Ultimate Guard Katana standard sleeve is 66 × 91 mm, and every deck in the box is that tall. So the test is simply whether your sleeved cards stand up in it — if they do, so does this. It also puts the slab's top edge level with the top of
the cards instead of 3 mm below them, so the insert no longer sinks away from the opening. Width and height
are set by the card footprint and so are effectively constant across standard-size boxes;
only depth varies. Dimensioned around an Ultimate Guard Boulder 100+ (interior ≈ 68.5 × 67.5
× 93 mm), which is where the fit gaps come from. That box is the only one whose interior
figure has been looked up, and even that one is a reported number rather than an official
spec — treat the three numbers above as the thing to measure against, not the brand.

| Variant | Holds | Slab depth | Card depth left |
|---|---|---|---|
| **`nocoin`** | 6 × 16 mm d6 + a 43.8 mm open bay for tokens | 18.6 mm | 48.9 mm |
| **`coin`** | **7** × 16 mm d6 + a ⌀38 mm flip-coin well, no bay | 18.6 mm | 48.9 mm |

![Pokémon layout](preview_pokemon.png)

## How it works

A slab that spans the full interior **width and height** of the case but only ~19 mm of its
~67 mm depth. Because it is captured on all four sides by the case walls, it cannot shift,
tip, or rattle. A sliding lid encloses the contents.

The lid exits the **bottom** edge. Once the slab is seated in the case, the floor of the deck
box sits across that edge and mechanically blocks the lid — it can only come off once you
lift the slab out, using the finger scoop in the top rail.

```
                 slab           +-- 48.9 mm left for cards --+
   box wall  | <-18.6 mm-> |    |                              |  box wall
             |[d6][d6][d6] |    |   sideboard                  |
             |[d6][d6][d6] |    |                              |
             | open bay    |    |                              |
```

## The depth budget is the whole design

18.6 mm is the practical floor for an enclosed 16 mm die — the die itself is 86% of it:

```
  0.8  floor (with a push-out hole under each cavity)
 16.3  cavity depth      <- 16.0 of this is the die
  1.5  lid + its groove, running out to the top face
 -----
 18.6  mm
```

Every millimetre added here is a millimetre taken from the card stack. That is why the
Round wells are **16.3 mm deep and no deeper**: a deeper well buys
counter capacity you will not use, and a double-sleeved 60-card deck needs roughly 45 mm.
Both variants therefore land on the same 18.6 mm.

Pick by what is in your bag, not by which game you play — nothing in either layout is
game-specific. MTG and Riftbound players almost always want the no-coin one; Pokémon
players almost always want the coin one.

The coin variant has **more** dice, not fewer. A round well's diameter sets the height of the
whole band it sits in, so the coin's band is 38.8 mm tall and leaves 22.2 mm of the 61 mm
interior beside it — exactly enough for a seventh die rather than dead space. **The coin costs
the bay, not the dice.**

There used to be a fourth line here: 1.4 mm of "retaining lip above the groove". It was
doing nothing. The groove is a **dovetail** — the lid is trapezoidal and wide at its base,
so what stops it lifting out is the taper of the groove beside it, not material on top of
it. Running the groove out to the top face costs nothing structurally, takes 1.4 mm straight
off the slab, and brings the lid flush with the frame.

A polyhedral die is cheaper than it looks: one resting on a face is only
**0.795 × its vertex-to-vertex width** tall, so a 20 mm d20 in a custom layout stands
15.9 mm and clears the standard 16.3 mm well without deepening anything. If you build a
custom profile around a d20, use `well(d20_size, d20_depth)` — `d20_depth` applies that
rule for you instead of the naive full width.

## The Pokémon coin well

**This was wrong for a long time and is worth recording.** The well was built around
`coin_d = 26.0`, a figure assumed rather than looked up. Official Pokémon coins actually run
**29.8–51.6 mm**. The common modern flip coin is the 34 mm "large"; the bigger authorised
collectible is 38 mm; 25 mm compact ones and 51 mm jumbos sit at the extremes. A 26.8 mm well
took only the smallest of them, so for most people the coin simply would not go in.

It is now built for **`coin_d = 38.0`** — a ⌀38.8 mm well, which swallows every size below it:

| Coin | ⌀ | Fits |
|---|---|---|
| Pokémon compact flip coin | ~25 mm | yes |
| US quarter | 24.26 mm | yes |
| Pokémon **large** flip coin (the common one) | 34 mm | yes |
| Pokémon large collectible | 38 mm | yes |
| US half dollar | 30.61 mm | yes |
| Pokémon **jumbo** | 51 mm | **no — see below** |

### What the coin costs

A round well's **diameter** sets the height of the whole band it sits in, so a 38.8 mm well is
expensive twice over: it is 38.8 mm tall, and it leaves only 22.2 mm of the 61 mm interior
beside it. Two consequences:

- **The coin gets one companion, not two.** Coin + two ⌀13.8 counter wells comes to 66.4 mm in
  a 61 mm interior — impossible at any wall thickness. It is paired with the **large** counter
  well rather than a small one, because that uses the leftover width better: a 4.4 mm gap
  instead of 8.4 mm of dead space.
- **The small counter well moved up** to join the dice, whose band is only 16.8 mm tall and had
  width going spare. Both counter sizes survive; nothing was dropped.

Measured, at `div_wall = 1.6`:

| Layout | Bay | Tightest gap | |
|---|---|---|---|
| `[small, d6, d6]` / `[coin, large]` | **15.8 mm** | 4.4 mm | shipped |
| `[large, d6, d6]` / `[coin, small]` | 14.8 mm | 4.8 mm | 8.4 mm of dead width |
| `[small, lg, d6]` / `[coin, d6]` | 14.8 mm | 5.4 mm | loses a die |
| `[large, d6, d6]` / `[coin, small, small]` | 17.9 mm | **−2.7 mm** | impossible |

The bay pays for it: 25.9 mm before, **15.8 mm** now. A 25.4 mm status marker no longer lies
flat in it. That is the deliberate trade — a coin well that fits the coin most people own beats
a bay sized for a marker you could keep in the open.

### Jumbo coins cannot be housed

A 51 mm jumbo needs a 51.8 mm well. That exceeds the tallest band the slab can hold once the
dice row and the bay's bottom wall are accounted for, and it does not fit loose in the bay
either — the largest bay any layout can offer is 41.9 mm. Nothing in a 66 × 91 slab takes one.
If you own a jumbo, it lives outside the insert.

### Internal dividers run thinner than the perimeter

`div_wall = 1.6` separates the two bands, against `wall = 2.5` for the outer shell. The
perimeter cannot thin — the lid groove already cuts 1.2 mm into it, leaving 1.3 mm — but a
divider between two cavities carries no load and buys 0.9 mm of bay.

One divider is excluded: the last band's gap to the bay carries the **detent bump**, whose
footprint is 2.30 mm across. On a 1.6 mm divider the dome would overhang its own wall and need
support, so that gap stays at `wall`.

### What this insert deliberately does not do

Some games want a second card group at the table — Riftbound's rune deck and battlefields are
the clearest case. The obvious idea is a card slot in the slab for them. **It cannot be done in this case.** The slab is 91 mm tall — exactly a
sleeve — and a sleeved standard card is the same 91 mm.
The cards are 3 mm too tall for any slot the slab could contain, in any orientation. Sixteen
sleeved cards also want ~11 mm of the depth budget, which is well over half the 18.6 mm the whole
insert gets. Keep the runes and battlefields banded in the main card compartment.

## Measure before you print

There is no test print to fall back on, so the numbers have to be right up front. Two of
them are not measurements:

- **The case interior** (68.5 × 67.5 × 93 mm) is a widely-reported figure, not an official
  one. Check yours before committing to a 3-hour body.
- **The counter diameters** are plausible values for common accessories, not callipered
  readings of yours.

Everything that governs fit is a single named parameter at the top of `dice_insert.scad`,
so a miss is a one-number change and a re-render:

| Symptom | Change |
|---|---|
| Dice too tight / too loose | `die_clearance` (0.8 total, ±0.2) |
| Counters too tight / too loose | `well_clearance` (0.8 total, ±0.2) |
| Counters are the wrong size | `ctr_small_d` / `ctr_large_d` / `coin_d` / `d20_size` |
| Lid binds / too loose | `lid_side_clearance` (0.5 total, ±0.2) |
| Lid rattles vertically | `lid_vert_clearance` (0.3) |
| Detent too weak / too strong | `detent_h` (0.60) — see below; set to 0 to remove it |

One clearance parameter governs every cell of a kind — `die_clearance` for square pockets,
`well_clearance` for round wells — so if your *smallest* counters bind, that is
`well_clearance`, not the layout.

The lid is the cheap part to print: ~20 minutes and 5.8 cm³. It will not tell you whether
the slab fits your case, but it does tell you whether the groove clearances and the detent
are right, since it is the same extrusion on every profile.

## Rendering

```sh
./render.sh              # both variants -> stl/<variant>/ + preview_<variant>.png
./render.sh pokemon      # just one
```

Or open `dice_insert.scad` in the OpenSCAD GUI and pick `game` in the Customizer panel.
Installed here via `brew install --cask openscad@snapshot` (the stable `openscad` cask is
disabled on macOS — it fails the Gatekeeper check).

## Print settings

Print **flat, open side up, exactly as the STL is oriented**. Verified across all three
profiles: **zero** downward-facing facets steeper than 45° on every body, and the only
overhang on a lid is its 2.87 mm² detent dimple. **No supports anywhere.**

| | Body | Lid |
|---|---|---|
| Layer height | 0.20 mm | 0.16 mm |
| Walls | 3 | 4 |
| Infill | 15% gyroid | 100% |
| Supports | none | none |

Solid volumes:

| Variant | Body | Lid |
|---|---|---|
| `nocoin` | 30.8 cm³ | 6.2 cm³ |
| `coin` | 49.1 cm³ | 6.2 cm³ |

Down 12% across the three bodies from a space-saving pass: the top rail cut from 10 mm to 7,
the floor from 1.0 to 0.8, and every divider *between two bands* thinned from `wall` to
`div_wall`. Each of those also hands the space back to the bay.

With the settings above expect roughly 24–30 g / 2.5–3 h for the MTG body and ~7 g / 20 min
for a lid; scale the others by volume and confirm in Orca.

The only feature on any part that overhangs is the lid's single 0.35 mm detent dimple
(2.87 mm² — measured, on every profile). It bridges over ~2.9 mm in about three layers and
needs no support. Every **body** measures exactly **0.00 mm²** of unsupported facet. The
pinch notches keep it that way by construction: they are cut downward from the cavity mouth,
so nothing is ever left spanning over one.

**Tightest wall:** **3.3 mm**, between the coin well and its neighbour in the `coin`
variant's third band. That is eight perimeters at
0.4 mm and it thickens immediately either side of the tangent line. Nothing in any shipped
profile is thinner.

## One lid fits both

Both lids are **the same file** — identical MD5, not merely similar, and it is checked rather
than assumed: `tools/build_all.sh` compares the MD5s on every build.

They used to differ by the position of one dimple, because the detent bump sat on the divider
between the last band and the bay, and that divider lands somewhere different in every layout.
Any lid would slide in any body, but only its own would click.

The detent is now anchored to the **bottom wall** — the one piece of solid material every layout
has in the same place — at `detent_y = 4.0`. The lid no longer references the band list at all,
so `insert_lid()` does not take one.

The bottom wall is only `wall` thick, which is not enough to seat the bump and still keep the
lid's mating dimple clear of the lid's open end, so a small boss thickens it locally: 11 mm wide,
reaching 3 mm into the bay. That costs about 0.5 cm³ and a sliver of the bay's bottom edge — a
fair price for one lid instead of three. The lid's grip grooves moved from y = 4 to y = 8 to stay
clear of the dimple, which sits at y = 3.5.

## Getting things back out

A pocket sized to hold a die also holds onto it. Two features fix that, and both are sized by
rule rather than by eye.

### Push-out holes

A hole through the floor behind every cavity, so you push a die or a counter stack out from
behind with a fingertip instead of picking at it.

**The hole is sized from the cavity, not to a fixed number.** It used to be capped at 14 mm,
which meant the hole behind a ⌀38.8 mm coin well was the same size as the one behind a ⌀17.8 mm
counter well — the coin sat on a 12.4 mm ledge with a fingertip-sized hole in the middle of it.
You could press the coin, but not tip it. Now:

```
hole = min( cavity × pushout_frac ,  cavity − 2 × pushout_ledge )
```

`pushout_frac = 0.80` scales the hole with the cavity; `pushout_ledge = 1.6` is a floor that
takes over on small cavities, where the fraction alone would leave too little material.

| Cavity | Old | New | Ledge under contents | Limited by |
|---|---|---|---|---|
| ⌀13.8 small counter well | 10.6 | **10.6** | 1.20 mm | ledge |
| 16.8 mm d6 pocket | 13.6 | **13.44** | 1.28 mm | proportion |
| ⌀17.8 large counter well | 14.0 | **14.24** | 1.38 mm | proportion |
| ⌀20.8 VP die well | 14.0 | **16.64** | 1.68 mm | proportion |
| ⌀38.8 coin well | 14.0 | **31.04** | 3.48 mm | proportion |

`pushout_d` survives as an optional absolute cap, defaulting to 0 (none).

Nothing can fall through, because the contents are captured sideways by the cavity walls: a
16 mm die over a 13.44 mm hole still rests on all four corners of its face and can only move
±0.4 mm, and a 38 mm coin over a 31.04 mm hole keeps 3.5 mm of ledge all the way round.

### Pinch cutouts

A dish taken out of the divider beside each cavity. It works *with* the push-out hole rather
than instead of it: push the die up from behind, and the dish is what lets you get a finger onto
its side and catch it.

The shape is a **segment of a large circle**, not a round-bottomed slot. `notch_arc = 60` sets
how much of that circle is used — a sixth — and the radius follows from the bite, so the sweep
stays long and smooth instead of becoming a tight bowl. `notch_depth = 4.5` is how far it
reaches down the side of the die.

**Each edge is sized against the divider it is actually cutting.** A divider between two
cavities is bitten from both sides, so each side takes half the spare material; a divider facing
the open bay is bitten once and takes all of it. The result is that every divider necks to
exactly `notch_min_wall = 1.2` mm at the notch, whatever it started at — the most the cut can
take without going thinner than one number you control.

In practice the side edges, cut into 3.3–6.8 mm dividers, get bites of 1.05–2.2 mm. The
cross-band edges sit on the 1.6 mm `div_wall` divider and would get 0.2 mm, which is a scratch
rather than a grip, so dishes below 0.3 mm are not generated at all. That is the deliberate
trade for thin dividers: the space goes to the bay, and the grip lives on the side edges.

Two properties worth knowing:

- **They cannot introduce an overhang.** The dish is an ellipsoid whose centre sits `notch_ease`
  *above* the cavity mouth. Every scrap of material is below the mouth, hence below the centre,
  so every cut surface faces upward. That is also what eases the rim instead of leaving a 90°
  lip. All three bodies measure 0.00 mm² unsupported.
- **They cannot breach a wall.** The full set is clipped to the divider field — inside the outer
  walls, below the top rail — so a notch that would break out erases itself instead of being a
  bug. Each dish is additionally clipped to its own side of the edge, so it cannot reach across
  a cavity and nibble the divider opposite.

The subtree is wrapped in `render()`. Without it the preview's CSG normaliser explodes on the
clipped dishes and gives up; it makes no difference to the exported geometry.

Set `pinch_notch = false` to omit them entirely.

## Layouts

Each profile is a stack of **bands**, laid out top-down under the finger rail; whatever height
is left at the bottom becomes the open bay. Within a band, gaps are derived to fill the
interior width.

```
band = [ [cell, cell, ...], gap_after, cell_gap ]
cell = ["sq", w, h, depth]     rect pocket (dice, card-shaped markers)
     | ["rd", d, d, depth]     round well  (counters, coins, a d20)
```

So a new layout is a few lines. Set `game = "custom"` and edit `custom_bands`:

```scad
custom_bands = [
    [[ d6(), d6(), d6() ],                                 div_wall, 0],
    [[ well(ctr_small_d, well_depth), well(coin_d, 16.3) ], wall,    0],
];
```

`cell_gap = 0` spreads the cells to fill the width; a positive value uses that fixed gap and
centres the block instead.

| Variant | Band 1 | Band 2 | Band 3 | Bay |
|---|---|---|---|---|
| `nocoin` | 3 × d6 | 3 × d6 | — | 43.8 mm |
| `coin` | 3 × d6 | 3 × d6 | ⌀38.8 coin well + d6 | none |

The bay is one undivided space. It used to carry a centre rib to support the lid mid-span,
which bought very little — the lid is captured in the side grooves along its whole length —
and cost a lot, because it turned one pocket you can actually reach into two narrow ones.
Set `bay_rib = true` to bring it back.

## Publishing

`./prep_release.sh` rebuilds `dist/` from scratch — STLs, 3MFs, images, source and docs,
with the models named so they sort into the order you should print them:

```
dist/
  models-stl/  BoulderInsert_<Game>_{1-body,2-lid}.stl
  models-3mf/  the same parts as 3MF (MakerWorld prefers these)
  images/      1-<Game>.png, 2-fits-in-case.png, 3-push-out-holes.png
  source/      dice_insert.scad + the render scripts
  README.txt   LICENSE.txt
```

Every exported STL is run through `tools/meshcheck.py --strip`, which asserts the mesh is a
closed 2-manifold — every edge shared by exactly two triangles, no zero-area facets — and
rewrites it without the degenerate ones if any turn up. Three checks worth knowing:

- **Bodies come out genus 6**, which is an independent confirmation that all six cavities
  got their push-out tunnel. If a hole ever failed to cut, the genus would drop.
- **Bodies carry 8 zero-area facets** and the published files have them stripped. They come
  from the flush groove: with `cap_t = 0` the groove's top edge lands exactly on the slab's
  top face, and the mesher leaves a few degenerate facets along that coincidence. They sit
  on an already-closed mesh — 0 open edges, 0 non-manifold edges with them discarded — so
  removing them is provably safe. Running the cut past the top face along the same taper was
  tried and made it worse (8 → 12), so the strip stays.
- **3MF round-trips exactly** — re-importing `BoulderInsert_MTG_2-body.3mf` gives 13784
  triangles and 38.444 cm³, identical to the STL.

`LISTING.md` holds the listing copy. The licence is **CC BY-NC-SA 4.0**, set in
`LICENSE.txt` — change that file and the listing's licence field together if you want
something else.

⚠️ **Nothing here has been printed yet.** The geometry is verified, but verification is not
the same as a test print, and there is no longer a cheap coupon to catch a bad fit.

An **earlier prototype of the original MTG design was printed**, and it is the reason the
detent got rebuilt — it was reported as doing nothing, which turned out to be exactly right
and provable from the numbers. Nothing in the current geometry has been printed: not the
flush lid, not the recessed grip, not the arc notches, not the 18.6 mm slab. Print one body
and lid and check them in a real case before publishing.

## Dimensions used

| | Value | Source |
|---|---|---|
| Case exterior | 76 × 75 × 98.5 mm | Ultimate Guard product data |
| Case interior | 68.5 × 67.5 × 93 mm | Ultimate Guard Boulder 100+. **Reported, not official — measure yours** |
| Slab | 66 × 91 × 18.6 mm | 1.25 mm/side across the width, 1.0 mm/side up the height |
| Die pocket | 16.8 mm sq × 16.3 deep | 0.4 mm/side around a 16.0 mm die |
| Lid in groove | 0.25 mm/side, 0.3 mm vertical | derived from the groove geometry, unverified in plastic |

⚠️ **The counter diameters are assumptions, not measurements.** `ctr_small_d = 13.0`,
`ctr_large_d = 17.0` are plausible figures for common accessories, but nobody has put
callipers on yours. (`coin_d = 38.0` is not a guess — it is the larger authorised Pokémon
coin size, and the well takes every smaller one.) Measure them and edit the four numbers
before you print a body.

Width and height are set by the card footprint and should be the **same across the Boulder
sizes** (60+/80+/100+/133+); only the depth budget changes, and only `box_int_d` in the
report line depends on it. That reasoning is untested on anything but the 100+.

## Files

| File | What |
|---|---|
| `dice_insert.scad` | Parametric source — edit this, everything else is generated |
| `render.sh` | Renders every profile |
| `preview.scad` | Preview render only, not printable |
| `stl/<game>/` | `<game>_body.stl`, `<game>_lid.stl` — working output |
| `prep_release.sh` | Builds `dist/`, the upload bundle |
| `tools/meshcheck.py` | Watertight / manifold validator, with `--strip` to drop zero-area facets |
| `context.scad` | Exploded in-case render for the listing, not printable |
| `LISTING.md` | Paste-ready listing copy — the single source of truth for the description |
| `UPLOAD.md` | Per-platform upload sheet: field values, file lists, and each platform's gotchas |
| `LICENSE.txt`, `dist_README.txt` | Shipped inside `dist/` |
| `dist/` | **The upload bundle.** Regenerated from scratch by `prep_release.sh` |
| ~~`boulder_dice_insert.scad`, `stl/insert_*.stl`~~ | **Deleted from the repo.** The original MTG-only source and its STLs — they were the reference the regression check differenced against. See the note under that check. |

### Has the MTG part changed?

Yes, a great deal, and all of it deliberate. It has gone from 40.503 cm³ to **30.328 cm³** —
25% lighter — through, in order: bigger push-out holes, pinch cutouts, the undivided bay, the
flush lid (`cap_t → 0`), the shorter top rail, the thinner floor, and `div_wall` on the
between-band dividers.

Every one of those is a parameter, and setting them all back reproduces the original exactly:

```sh
openscad -D 'game="mtg"' -D 'part="body"' \
         -D pinch_notch=false -D pushout_d=10.0 -D pushout_ledge=2.0 -D bay_rib=true \
         -D cap_t=1.4 -D top_rail=10 -D floor_t=1.0 -D scoop_d=20 -D scoop_depth=6 \
         -D div_wall=5.0 -D detent_h=0.001 -D boss_w=0.001 \
         -o /tmp/off.stl dice_insert.scad
```

Differenced against the original in both directions this leaves **0.000 cm³** either way —
only zero-volume slivers a few millimetres across, which are the residue of the detent moving
from the divider to the bottom wall. That relocation is structural rather than parametric, so
it is the one change this test cannot switch off; `detent_h=0.001 -D boss_w=0.001` shrinks it
to nothing instead.

⚠️ **This check can no longer be run from a clean checkout.** `boulder_dice_insert.scad` and
`stl/insert_*.stl` — the original source and its STLs — have been deleted from the repo. The
verification above was performed against a copy while they still existed. If you want the test
back, restore those two from wherever you have them.

### Other checks

- **Overhangs.** All three bodies measure 0.00 mm² of unsupported facet; a lid measures
  2.87 mm², which is its detent dimple and matches π × 0.963² = 2.91.
- **Wall breach.** A probe solid covering both side walls and the bottom wall, below the
  groove and clear of the corner reliefs and finger scoop, was differenced against each
  body. Nothing remained on any profile — no notch reaches an outer wall.
