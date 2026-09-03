================================================================================
 UNIVERSAL DICE & COUNTER INSERT - top-opening vertical deck boxes
 MTG - Pokemon - Riftbound        parametric OpenSCAD source included
================================================================================

WHAT IT IS
  A slab that fills the dead space in front of your deck. It spans the full
  interior width and height of the box but only 18.6 mm of its depth, so it is
  captured on all four sides and cannot rattle - and it still leaves 48.9 mm for
  cards, which is a double-sleeved 60-card deck with room over.

  A lid slides across the top to keep everything in. The lid exits the BOTTOM
  edge, so once the slab is seated the floor of the deck box sits across that
  edge and mechanically blocks the lid. It cannot open in your bag.

  Both faces are flat. The lid sits flush with the frame, 0.3 mm down, which is
  only the clearance it needs to slide, and its thumb grip is cut into it rather
  than raised off it. Nothing stands proud to catch your cards.

--------------------------------------------------------------------------------
WILL IT FIT YOUR BOX?
--------------------------------------------------------------------------------
  The slab is  66 x 88 x 18.6 mm.

  It drops into any top-opening vertical deck box whose interior is at least
  66 mm wide, 88 mm tall, with 19 mm of depth to spare.

  Width and height are set by the card footprint, which is the same in every
  standard-size deck box, so only the depth really varies. Measure the inside of
  yours and compare against those three numbers.

  It was dimensioned around an Ultimate Guard Boulder 100+, interior about
  68.5 x 67.5 x 93 mm - that is where the 2.5 mm and 5 mm fit gaps come from.
  A larger box will simply hold it with more slack; raise fit_gap_w / fit_gap_h
  in the source and re-render if you want it snug.

--------------------------------------------------------------------------------
BEFORE YOU PRINT A BODY
--------------------------------------------------------------------------------
  Two numbers here are assumptions, not measurements:

    - Your box's interior. Manufacturers rarely publish interior dimensions and
      the figure above is a reported one. Measure yours.
    - Your counters. ctr_small_d = 13.0 and ctr_large_d = 17.0 are plausible for
      common accessories, not callipered readings of yours. The coin well is
      sized to the 38 mm authorised Pokemon coin and takes every smaller one,
      including the common 34 mm "large" flip coin. A 51 mm jumbo will not fit.

  Every clearance is a single named parameter at the top of the .scad file, so a
  miss is one number and a re-render:

    die_clearance        dice too tight / too loose      (0.8 total)
    well_clearance       counters too tight / too loose  (0.8 total)
    ctr_small_d etc.     counters are the wrong size
    lid_side_clearance   lid binds / too loose           (0.5 total)
    lid_vert_clearance   lid rattles vertically          (0.3)
    detent_h             click too weak / too strong     (0.6)

  The lid is the cheap part to print - about 20 minutes. It will not tell you
  whether the slab fits your box, but it does tell you whether the groove
  clearances and the detent feel right, and it is the same part on all three
  profiles.

--------------------------------------------------------------------------------
PRINTING
--------------------------------------------------------------------------------
  Orientation   Exactly as the models are oriented. Flat, open side up.
  Supports      NONE. Verified: zero downward-facing facets steeper than 45
                degrees on every body.
  Body          0.20 mm layers, 3 walls, 15% infill
  Lid           0.16 mm layers, 4 walls, 100% infill  (it is only 1.2 mm thick)
  Material      PLA or PETG. PETG slides a little more smoothly.

  Print one body + one lid. All three profiles ship the SAME lid - one file,
  not three - because the detent is anchored to the bottom wall rather than to
  each layout's dividers. Any lid slides, clicks and holds in any body.

--------------------------------------------------------------------------------
GETTING PIECES BACK OUT
--------------------------------------------------------------------------------
  Every cavity has a hole through the floor behind it, so you push a die or a
  counter stack out from behind instead of picking at it. The hole is scaled to
  the cavity: 13.4 mm behind a d6, 31 mm behind the Pokemon coin.
  The dividers also carry shallow arc cutouts, so you can get a finger onto the
  side of a die and catch it as it comes up.

--------------------------------------------------------------------------------
FILES
--------------------------------------------------------------------------------
  models-stl/   STLs, numbered in the order to print them
  models-3mf/   the same parts as 3MF
  images/       renders
  source/       OpenSCAD source - see below
  LICENSE.txt   CC BY-NC-SA 4.0

--------------------------------------------------------------------------------
MAKING YOUR OWN LAYOUT
--------------------------------------------------------------------------------
  source/dice_insert.scad is fully parametric and works in the OpenSCAD
  Customizer. `game` and `part` are dropdowns. A layout is just a list of bands:

      mtg_bands = [
          [[ d6(), d6(), d6() ], div_wall, 0],
          [[ d6(), d6(), d6() ], wall,    0],
      ];

  Cells are d6(size), well(diameter, depth) or slot(w, h, depth). Set
  `game = "custom"` and edit `custom_bands`. Gaps, wall thicknesses, the lid and
  its groove, the push-out holes, the pinch cutouts and the open bay at the
  bottom are all derived for you.

================================================================================
