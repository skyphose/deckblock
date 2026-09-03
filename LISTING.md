# Listing copy

Paste-ready text for Printables / MakerWorld / Thingiverse. Everything below the
rules is the listing itself.

**Note on claims:** this copy says the insert is dimensioned to fit top-opening
vertical deck boxes and gives the spec to check against. It does *not* say it has
been physically tested in a range of boxes, because it has not. If you print it in
several boxes yourself, that sentence can be upgraded — until then, the fit spec
is the honest and more useful version anyway, since a downloader can check it in
ten seconds with calipers.

---

## Title

> Universal Dice & Counter Insert for Top-Opening Deck Boxes — MTG, Pokémon & Riftbound

## Summary / one-liner

> A no-supports sliding-lid tray that fills the dead space in front of your deck.
> Flat on both faces, three game layouts, and a parametric source file so you can
> build your own.

## Tags

`deck box` `deck box insert` `dice tray` `dice insert` `universal` `mtg`
`magic the gathering` `pokemon` `riftbound` `tcg` `card game` `organizer`
`ultimate guard` `boulder` `gamegenic` `dragon shield` `parametric` `openscad`
`customizer` `no supports` `sliding lid`

## Category

Gadgets → Board games / Tabletop accessories

## Licence

CC BY-NC-SA 4.0

---

## Description

### The dead space in front of your deck

A 100+ capacity deck box is far deeper than the deck you keep in it. This is a slab
that fills the gap: it spans the **full interior width and height** of the box but
only **18.6 mm** of its depth, so it is captured on all four sides and cannot shift,
tip or rattle — no glue, no clips, no friction fit to tune.

It leaves **48.9 mm** for cards. A double-sleeved 60-card deck is about 45 mm, so
that fits with room over. Be clear-eyed about the trade: you are giving up roughly
a quarter of the box's depth, so a 100+ becomes something nearer a 70+. If you
routinely fill a deck box to the brim, this is not for you.

### Will it fit my box?

It is universal by geometry rather than by brand. The width and height are set by
the **card footprint**, which is the same in every standard-size deck box — only
the depth differs. So the question is just whether yours has the room:

> **The slab is 66 × 88 × 18.6 mm.**
> It drops into any top-opening vertical deck box with an interior at least
> **66 mm wide, 88 mm tall, and 19 mm of depth to spare.**

Measure the inside of your box and compare. Most 100+ capacity top-loaders clear
this comfortably; 50+ and 80+ boxes will take the slab but leave you correspondingly
less deck. It was dimensioned around an **Ultimate Guard Boulder 100+** (interior
about 68.5 × 67.5 × 93 mm), which is where the 2.5 mm and 5 mm fit gaps come from.

If your box is a little larger inside, the slab sits with more slack — raise
`fit_gap_w` / `fit_gap_h` in the source and re-render to suit.

### Flat on both faces

The lid sits flush with the frame — 0.3 mm down, which is only the clearance it
needs to slide. The thumb grip is cut *into* the lid rather than raised off it, so
nothing stands proud to catch your card stack, and the back face is flat apart from
the push-out holes.

### The lid can't open in your bag

A 1.2 mm lid slides in a dovetailed groove and clicks over a detent. The clever part
is which way it goes: **the lid exits the bottom edge**, so as soon as the slab is
seated, the floor of the deck box sits across that edge and mechanically blocks it.
There is no orientation in which it can slide open while it is in the box. Lift the
slab out by the finger scoop in the top rail and it opens normally.

### Three layouts

| Variant | Holds |
|---|---|
| **MTG** | 6 × 16 mm d6 + a large open bay for tokens |
| **Pokémon** | ⌀38 mm flip-coin well, both damage-counter sizes, 2 × d6, marker bay |
| **Riftbound** | Victory-point die well, 2 × d6, 3 separated Might-modifier wells |

The Riftbound layout is built around how the game actually plays: it is a race to 8
points, so the score is the one thing that has to persist between turns — while
combat damage does **not** persist, which is why there is no damage-counter bank.
The three token wells keep Might modifier denominations from becoming one mixed pile.

### Things come back out again

- **Push-out holes** through the floor behind every cavity — push a die or a counter
  stack out from behind with a fingertip rather than picking at it. Sized as large as
  the retaining ledge allows, and scaled to the cavity: 13.4 mm behind a d6, 31 mm
  behind the coin, so a big flat coin can be tipped out rather than just pressed.
- **Pinch cutouts** in the dividers, shaped as a shallow segment of a large circle, so
  you can get a finger onto the side of a die and catch it as it comes up. Each one is
  sized against the divider it cuts, taking the most that divider can give while
  leaving 1.2 mm standing.

### Printing

- **Orientation:** exactly as the models are oriented — flat, open side up.
- **Supports:** none. Verified numerically, not by eye: zero downward-facing facets
  steeper than 45° on every body.
- **Body:** 0.20 mm layers, 3 walls, 15% infill.
- **Lid:** 0.16 mm layers, 4 walls, 100% infill — it is only 1.2 mm thick.
- PLA is fine; PETG slides a little more smoothly.

Print one body and one lid. All three profiles ship the **same lid** — one file, not three. The detent is
anchored to the bottom wall rather than to each layout's dividers, so a lid from any
variant slides, clicks and holds in any body.

### Make your own layout

The source is one parametric OpenSCAD file and it works in the Customizer — `game`
and `part` are dropdowns. A layout is just a list of bands:

```scad
mtg_bands = [
    [[ d6(), d6(), d6() ], div_wall, 0],
    [[ d6(), d6(), d6() ], wall,    0],
];
```

Cells are `d6(size)`, `well(diameter, depth)` or `slot(w, h, depth)`. Set
`game = "custom"`, edit `custom_bands`, and the gaps, wall thicknesses, lid, groove,
push-outs, pinch cutouts and the open bay are all derived for you. Remixes welcome.

### Before you print a body

Two numbers in the model are assumptions rather than measurements, and both are a
one-line fix:

- **Your box's interior.** Published interior dimensions are rare and the figure used
  here is a reported one. Measure yours against the spec above.
- **Your counters.** `ctr_small_d = 13.0` and `ctr_large_d = 17.0` are plausible for
  common accessories, not callipered readings of yours. The coin well is sized to the
  38 mm authorised coin and takes every smaller one, including the common 34 mm "large".

Every clearance is a single named parameter at the top of the file, so a miss is one
number and a re-render.
