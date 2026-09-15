# listing copy

paste-ready text for printables / makerworld / thingiverse. everything below the line is
the listing itself.

---

## title

> deckblock - a dice insert made for the ultimate guard boulder, fits any top-opening
> deck box, with or without a coin well

## summary / one-liner

> 67 x 91 x 18.6 mm sliding-lid dice tray, made for the ultimate guard boulder 100+ and
> sized to fit any standard top-opening deck box. no supports, flat on both faces. two
> variants, coin well or not. parametric openscad source included.

## tags

`deckblock` `deck box` `deck box insert` `dice tray` `dice insert` `universal` `mtg`
`magic the gathering` `pokemon` `riftbound` `tcg` `card game` `organizer` `coin holder`
`ultimate guard` `boulder` `gamegenic` `dragon shield` `parametric` `openscad`
`customizer` `no supports` `sliding lid`

## category

gadgets -> board games / tabletop accessories

## license

CC BY-NC-SA 4.0

---

## description

### the dead space in front of your deck

a 100+ capacity deck box is far deeper than the deck you keep in it. this is a slab that
fills the gap. it spans the full interior width and height of the box but only 18.6 mm
of its depth. its captured on all four sides and cant shift, tip or rattle. no glue, no
clips, no friction fit to tune.

it leaves 48.9 mm for cards. a double-sleeved 60-card deck is about 45 mm, so that fits
with room over. the slab takes 18.6 mm of the 67.5 mm interior, about a quarter, so a
100+ becomes something nearer a 70+. if you fill a deck box to the brim, this isnt for
you.

### will it fit my box?

it was made for an ultimate guard boulder 100+, which is the box every dimension came
off. it fits the rest by arithmetic rather than by brand: width and height are set by the
card footprint, and thats the same in every standard-size deck box. only the depth
differs. so the question is whether yours has the room:

> the slab is 67 x 91 x 18.6 mm.
> it drops into any top-opening vertical deck box with an interior at least 67 mm wide,
> 91 mm tall, and 19 mm of depth to spare.

untested at this size. i printed an earlier build at 66 x 88, not this one. so measure
the inside of your box and compare. most 100+ capacity top-loaders clear this comfortably. 50+ and
80+ boxes will take the slab but leave you correspondingly less deck. it was dimensioned
around an ultimate guard boulder 100+ (interior about 68.5 x 67.5 x 93 mm), which is
where the 2.5 mm and 5 mm fit gaps come from.

if your box is a little larger inside, the slab sits with more slack - raise `fit_gap_w`
/ `fit_gap_h` in the source and re-render.

### flat on both faces

the lid sits flush with the frame - 0.3 mm down, which is only the clearance it needs to
slide. the thumb grip is cut INTO the lid rather than raised off it, so nothing stands
proud to catch your card stack. the back face is flat apart from the push-out holes.

### the lid cant open in your bag

a 1.2 mm lid slides in a dovetailed groove and clicks over a detent. the part that
matters is which way it goes: the lid exits the BOTTOM edge. once the slab is seated,
the floor of the deck box sits across that edge and blocks it. theres no orientaiton in
which it can slide open while its in the box. lift the slab out by the finger scoop in
the top rail and it opens normally.

### two variants

| variant | holds |
|---|---|
| dice | 6 x 16 mm d6 and a 43.8 mm open bay for tokens, markers and spares |
| dice + coin | 7 x 16 mm d6 and a ⌀38 mm flip-coin well |

pick by whats in your bag, not by which game you play - nothing in either layout is
game-specific. mtg and riftbound players almost always want the no-coin one. pokemon
players almost always want the coin one.

the coin version has MORE dice, not fewer. a round well's diameter sets the height of
the whole band it sits in. so the coin's band is 38.8 mm tall and leaves 22.2 mm of the
61 mm interior beside it - exactly enough for a seventh die rather than dead space. the
coin costs the bay, not the dice.

a 51 mm jumbo coin cant be housed at all - not in a well, and not loose either. nothing
in a 67 x 91 slab will take one.

### things come back out again

- push-out holes through the floor behind every cavity. push a die or a counter stack
  out from behind with a fiingertip rather than picking at it. sized as large as the
  retaining ledge allows, and scaled to the cavity: 13.4 mm behind a d6, 31 mm behind
  the coin. a big flat coin gets tipped out rather than pressed.
- pinch cutouts in the dividers, shaped as a shallow segment of a large circle. you get
  a finger onto the side of a die and catch it as it comes up. each one is sized
  against the divider it cuts, taking the most that divider can give while leaving
  1.2 mm standing.

### printing

orientation: exactly as the models are oriented, flat, open side up. supports: none.
verified numerically, not by eye: zero downward-facing facets steeper than 45° on every
body. pla is fine. petg slides a little more smoothly.

| | body | lid |
|---|---|---|
| layers | 0.20 mm | 0.16 mm |
| walls | 3 | 4 |
| infill | 15% | 100%, its only 1.2 mm thick |

print one body and one lid. both variants ship the SAME lid - one file, not two. the
detent is anchored to the bottom wall rather than to each layout's dividers, so a lid
from any variant slides, clicks and holds in any body.

### make your own layout

the source is one parametric openscad file (`deckblock.scad`) and it works in the customizer - `variant` and
`part` are dropdowns. a layout is a list of bands:

```scad
nocoin_bands = [
    [[ d6(), d6(), d6() ], div_wall, 0],
    [[ d6(), d6(), d6() ], wall,    0],
];
```

cells are `d6(size)`, `well(diameter, depth)` or `slot(w, h, depth)`. set
`variant = "custom"`, edit `custom_bands`, and the gaps, wall thicknesses, lid, groove,
push-outs, pinch cutouts and the open bay are all derived for you. remixes welcome.

### before you print a body

two numbers in the model are assumptions rather than measurements, and both are a
one-line fix:

- your box's interior. published interior dimensions are rare and the figure used here
  is a reported one. measure yours against the spec above.
- your counters. `ctr_small_d = 13.0` and `ctr_large_d = 17.0` are plausible for common
  accessories, not calipered readings of yours. the coin well is sized to the 38 mm
  atuhorized coin and takes every smaller one, including the common 34 mm "large".

every clearance is a single named parameter at the top of the file, so a miss is one
number and a re-render.
