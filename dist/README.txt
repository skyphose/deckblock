================================================================================
 deckblock - a dice and counter insert for top-opening deck boxes
 made for the ultimate guard boulder 100+      openscad source included
================================================================================

WHAT IT IS
  a slab that fills the dead space in front of your deck. it spans the full
  interior width and height of the box but only 18.6 mm of its depth, so its
  captured on all four sides and cant rattle. it still leaves 48.9 mm for
  cards, which takes a double-sleeved 60-card deck with room over.

  a lid slides across the top to keep everything in. the lid exits the BOTTOM
  edge, so once the slab is seated the floor of the deck box sits across that
  edge and blocks it. it cant open in your bag.

  both faces are flat. the lid sits flush with the frame, 0.3 mm down, which is
  only the clearance it needs to slide. its thumb grip is cut into it rather
  than raised off it. nothing stands proud to catch your cards.

--------------------------------------------------------------------------------
WILL IT FIT YOUR BOX?
--------------------------------------------------------------------------------
  the slab is  67 x 91 x 18.6 mm.

  it drops into any top-opening deck box whose interior is at least 67 mm wide,
  91 mm tall, with 19 mm of depth to spare.

  it was made for an ultimate guard boulder 100+, interior about
  68.5 x 67.5 x 93 mm, and thats where the 2.5 mm and 5 mm fit gaps come from.
  it fits the rest by arithmetic rather than by brand: width and height come off
  the card footprint, and thats the same in every standard-size deck box. only
  depth varies between them.

  the height is taken from the SLEEVE, not the box. an ultimate guard katana
  standard sleeve is 66 x 91 mm, and every deck in the box is that tall. if your
  sleeved cards stand up in it, so does this.

  untested at this size. i printed an earlier build at 66 x 88, not this one. so
  measure the inside of yours and compare against those three numbers.

--------------------------------------------------------------------------------
BEFORE YOU PRINT A BODY
--------------------------------------------------------------------------------
  two numbers here are assumptions, not measurements:

    - your box's interior. mnaufacturers rarely publish interior dimensions and
      the figure above is a reported one. measure yours.
    - your counters. ctr_small_d = 13.0 and ctr_large_d = 17.0 are plausible for
      common accesories, not calipered readings of yours. the coin well is
      sized to the 38 mm authorized pokemon coin and takes every smaller one,
      including the common 34 mm "large" flip coin. a 51 mm jumbo wont fit.

  every clearance is a single named parameter at the top of the .scad file, so a
  miss is one number and a re-render:

    die_clearance        dice too tight / too loose      (0.8 total)
    well_clearance       counters too tight / too loose  (0.8 total)
    ctr_small_d etc.     counters are the wrong size
    lid_side_clearance   lid binds / too loose           (0.5 total)
    lid_vert_clearance   lid rattles vertically          (0.3)
    detent_h             click too weak / too strong     (0.6)

  the lid is the cheap part to print, about 20 minutes. it wont tell you whether
  the slab fits your box. it does tell you whether the groove clearances and the
  detent feel right, and its the same part on both variants.

--------------------------------------------------------------------------------
PRINTING
--------------------------------------------------------------------------------
  orientation   exactly as the models are oriented. flat, open side up.
  supports      NONE. verified: zero downward-facing facets steeper than 45
                degrees on every body.
  body          0.20 mm layers, 3 walls, 15% infill
  lid           0.16 mm layers, 4 walls, 100% infill  (its only 1.2 mm thick)
  material      pla or petg. petg slides a little more smoothly.

  print one body + one lid. both variants ship the SAME lid, one file not two.
  the detent is anchored to the bottom wall rather than to each layout's
  dividers, so any lid slides, clicks and holds in any body.

--------------------------------------------------------------------------------
GETTING PIECES BACK OUT
--------------------------------------------------------------------------------
  every cavity has a hole through the floor behind it, so you push a die or a
  counter stack out from behind instead of picking at it. the hole is scaled to
  the cavity: 13.4 mm behind a d6, 31 mm behind the coin.

  the dividers also carry shallow arc cutouts, so you can get a finger onto the
  side of a die and catch it as it comes up.

--------------------------------------------------------------------------------
FILES
--------------------------------------------------------------------------------
  models-stl/   stls, numbered in the order to print them
  models-3mf/   the same parts as 3mf
  images/       renders
  source/       openscad source, see below
  LICENSE.txt   CC BY-NC-SA 4.0

--------------------------------------------------------------------------------
MAKING YOUR OWN LAYOUT
--------------------------------------------------------------------------------
  source/deckblock.scad is fully parametric and works in the openscad
  customizer. `variant` and `part` are dropdowns. a layout is a list of bands:

      nocoin_bands = [
          [[ d6(), d6(), d6() ], div_wall, 0],
          [[ d6(), d6(), d6() ], wall,    0],
      ];

  cells are d6(size), well(diameter, depth) or slot(w, h, depth). set
  `variant = "custom"` and edit `custom_bands`. gaps, wall thicknesses, the lid
  and its groove, the push-out holes, the pinch cutouts and the open bay at the
  bottom are all derived for you.

================================================================================
