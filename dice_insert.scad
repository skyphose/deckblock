// ============================================================================
//  TCG Deck-Case Spacer Insert  --  parametric, multi-game
// ----------------------------------------------------------------------------
//  A full-footprint slab that spans the interior width and height of an
//  Ultimate Guard Boulder deck case but only ~20-24 mm of its ~67 mm depth.
//  Captured on all four sides by the case walls, so it cannot shift or rattle.
//
//  The sliding lid exits the BOTTOM edge: once the slab is seated in the case,
//  the floor of the deck box mechanically blocks the lid shut.
//
//  Print flat, open side up. No supports anywhere.
//
//  Set `game` and `part` below (or override with -D) and export STL.
// ============================================================================

/* [Variant] */
// Which layout to build. The question is whether you carry a coin, not which
// game you play -- see the profiles section for why.
variant = "nocoin"; // [nocoin, coin, custom]

/* [Part to render] */
// Which piece to export.
part = "body"; // [body, lid, all]

/* [Dice] */
die_size      = 16.0;   // across flats of one d6
die_clearance = 0.8;    // TOTAL added to die_size -> 0.4 per side
die_headroom  = 0.3;    // pocket depth above the die, so the lid captures it
// Kept for custom layouts: `well(d20_size, d20_depth)` is the right way to hold
// a d20, and the depth rule below is the non-obvious part.
d20_size      = 22.0;   // WIDEST across your d20 (vertex to vertex) -- measure it

/* [Round wells] */
well_clearance = 0.8;   // TOTAL added to a well diameter -> 0.4 per side

/* [Counters -- VERIFY THESE AGAINST YOUR OWN ACCESSORIES] */
ctr_small_d  = 13.0;    // Pokemon 10-damage / generic small counter, disc diameter
ctr_large_d  = 17.0;    // Pokemon 50-damage / generic large counter
coin_d       = 38.0;    // flip coin -- see the coin table in the README

// Cavity depths. Keeping every well at the die depth holds the whole slab at
// the proven 20.2 mm, which is what leaves 47.3 mm of card stack behind it.
// Going deeper buys counter capacity you almost certainly do not need and
// costs card room a double-sleeved 60-card deck cannot spare.
well_depth   = die_size + die_headroom;   // 16.3 -- counter / coin stack depth

// A d20 resting on a face is only ~0.795 x its vertex-to-vertex width tall
// (icosahedron inradius/circumradius), so the well can be much shallower
// than the die is wide.
d20_depth    = d20_size * 0.795 + 0.5;    // 18.0 for a 22 mm d20

/* [Deck box interior -- Ultimate Guard Boulder] */
// Width and height are set by the card footprint and are the SAME across the
// Boulder sizes (60+/80+/100+/133+); only the depth budget changes.
box_int_w = 68.5;       // interior width  (across the cards)
box_int_h = 93.0;       // interior height (up the cards)
// The slab's height is set from the SLEEVE, not from the box interior, and
// that is the more trustworthy of the two numbers. box_int_h is a reported
// figure rather than a published spec, but an Ultimate Guard Katana standard
// sleeve is 66 x 91 mm and every deck in the box is that tall. So the rule is
// simply: if your sleeved cards stand up in the box, this does too.
//
// It also puts the slab's top edge level with the top of the cards instead of
// 3 mm below it, which is the point -- the insert stops sinking away from the
// opening and is easier to get a finger to.
// The sleeve is the REFERENCE both slab dimensions are stated against, which
// is what keeps them honest: the height is exactly a sleeve, the width is a
// sleeve plus over_w. Before this they came out of box_int_w - fit_gap_w and
// happened to land on 66 mm, which read as intent and was coincidence -- it
// would have drifted silently the moment either of those was edited.
sleeve_w  = 66.0;       // Ultimate Guard Katana, standard size
sleeve_h  = 91.0;
// ...and then a millimetre wider than the sleeve, deliberately. The slab does
// not have to fit BESIDE a card, only inside the box, and the box is 68.5 mm
// across. Every millimetre here lands in the cavity field, where it widens the
// gaps you get a finger into.
//
// This is the one dimension where the reported box interior is load-bearing:
// the height is bounded by the sleeve, which is a published figure, but the
// width is bounded only by box_int_w. At over_w = 1.0 there is 0.75 mm of
// clearance per side, so a box 1 mm narrower than reported still fits and one
// 1.5 mm narrower does not. Set it back to 0 to sit exactly on the sleeve.
over_w    = 1.0;
box_int_d = 67.5;       // interior depth  (the card stack) -- 100+; reference only
fit_gap_w = box_int_w - sleeve_w - over_w;   // whatever is left over: 1.5 mm
fit_gap_h = box_int_h - sleeve_h;   // whatever is left over: 2.0 mm

/* [Slab] */
slab_depth    = 0;      // 0 = auto/minimum for the chosen profile.
wall          = 2.5;    // OUTER wall. Do not thin this: the lid groove cuts
                        // lid_groove_depth (1.2) into it, leaving only 1.3 mm.
// Divider between two bands. It carries no structural load -- it only separates
// cavities -- so it runs thinner than the perimeter to buy layout space.
// NOT usable for the last band's gap: that divider carries the detent bump,
// whose footprint is 2.30 mm across and would overhang a thinner wall.
div_wall      = 1.6;
// Material behind the deepest cavity. 0.8 is four layers at 0.20 mm, laid
// straight onto the build plate, and nothing loads it in bending -- a die rests
// on it in compression and is pushed out through the hole in it.
floor_t       = 0.8;
// Material above the lid groove. Zero, deliberately: the groove is a DOVETAIL
// -- the lid is trapezoidal and wide at its base, so what stops it lifting out
// is the taper of the groove beside it, not any material on top of it. Running
// the groove all the way to the top face therefore costs nothing, brings the
// lid flush with the frame, and takes 1.4 mm straight off the slab.
cap_t         = 0.0;
corner_relief = 3.0;    // 45 deg chamfer on the four vertical corners
// Solid rail at the top edge, holding the finger scoop. This is the single
// largest lump of material in the part -- 66 x rail x 18.8 of solid -- so it is
// kept only as deep as the scoop needs. scoop_depth (6.0) plus a 2 mm beam
// under it is the floor; below that the beam you hook a finger against when
// lifting the slab out gets too thin to trust.
top_rail      = 7.0;

/* [Layout] */
// The open bay is one undivided space by default. Setting this true splits it
// with a centre rib, which gives the lid a mid-span support -- at the cost of
// turning one usable pocket into two narrow ones. The lid is captured in the
// side grooves along its whole length, so it does not need the rib.
bay_rib   = false;      // centre rib across the open bay
lead_in   = 0.6;        // chamfer at the mouth of each cavity

/* [Push-out holes] */
// A hole through the floor behind every cavity: push a die or a counter stack
// out from behind instead of trying to pick it out. Sized as large as the
// retaining ledge allows, capped at a comfortable fingertip.
// The hole is sized FROM the cavity, not to a fixed number. A flat cap made the
// hole behind a 38.8 mm coin the same size as the one behind a 17.8 mm counter
// well, which left the coin sitting on a 12.4 mm ledge with a fingertip-sized
// hole in the middle of it -- you could push it, but not tip it.
pushout_frac  = 0.80;   // hole diameter as a fraction of the cavity
pushout_ledge = 1.6;    // minimum ledge, per side, measured on the CAVITY. Takes
                        // over on small cavities, where the fraction would leave
                        // too little floor. ~1.2 mm under an actual counter.
pushout_d     = 0;      // optional absolute cap; 0 = none

/* [Pinch notches] */
// Scallops in the divider walls beside each cavity, so a die can be pinched
// out from the side rather than only pushed from behind.
pinch_notch    = true;
notch_arc      = 60;    // DEGREES of circle used for the cutout. 60 = a sixth.
                        // Small values give a long, shallow, gentle sweep;
                        // 180 would be a half-round slot.
notch_bite     = 2.2;   // how far it eats into the divider -- a request, not a
                        // promise: each edge is clamped by notch_min_wall.
notch_min_wall = 1.2;   // material that must survive in the divider being cut
notch_depth    = 4.5;   // how far below the cavity mouth it reaches
notch_ease     = 0.8;   // dish centre raised above the mouth, so the rim is
                        // eased instead of meeting the surface at 90 degrees
notch_keepout  = 1.5;   // solid kept around the detent bump's footing

/* [Finger scoop] */
// Widened as it was made shallower, so the opening stays a comfortable size
// while leaving the same 2 mm beam under it (top_rail - scoop_depth).
scoop_d     = 24.0;
scoop_depth = 5.0;      // how far it bites into the top rail

/* [Sliding lid] */
lid_t              = 1.2;
lid_groove_depth   = 1.2;   // how far the groove bites into each side wall
lid_vert_clearance = 0.3;   // slop above the lid inside the groove
lid_side_clearance = 0.5;   // TOTAL width slop -> 0.25 per side
lid_end_clearance  = 0.5;   // slop at the closed end
// Thumb grip. Cut INTO the lid, never proud of it: the lid's outer face is
// flush with the frame, so anything raised here would be the one thing standing
// above an otherwise flat face -- and the first thing a card stack would catch.
grip_w      = 14.0;   // across the lid
grip_slot_w = 2.2;    // one groove, measured along the direction of travel
grip_depth  = 0.4;    // leaves 0.8 mm of a 1.2 mm lid
grip_pitch  = 3.0;
grip_n      = 3;      // a pad of grooves grips better than one shallow dish
grip_y0     = 8.0;    // first groove, from the lid's open end. Kept clear of
                      // the detent dimple, which now sits near that end.

/* [Detent] */
// The detent is anchored to the BOTTOM WALL, not to a layout divider, and that
// is what makes one lid fit every profile. Anchoring it to the divider between
// the last band and the bay -- as it used to be -- put it at a different y in
// each layout (43.6 / 38.6 / 21.6 mm), so no two lids were the same part.
//
// The bottom wall is the one piece of solid material every layout has in the
// same place. It is only `wall` thick, which is too narrow to seat both the
// bump and the lid's dimple clear of the lid's open end, so a small boss
// thickens it locally. The boss sits at the very bottom edge of the bay and
// costs about 10 x 3 mm of it.
detent_y     = 4.0;    // fixed for every profile
boss_w       = 11.0;
boss_extra   = 3.0;    // how far the boss reaches past the bottom wall
// detent_h MUST exceed lid_vert_clearance or the detent does nothing at all.
// The lid floats that far inside its groove before its wide base wedges in the
// taper, so a bump shorter than the float passes underneath without ever
// touching the lid. The original 0.22 mm bump against 0.3 mm of float was
// exactly that case -- it was not weak, it was inert.
//
// What is left over, detent_h - lid_vert_clearance, is how far the lid has to
// bow to ride over the bump. Over a 61 mm span of 1.2 mm plastic that is a
// light, definite click. It relaxes fully once the dimple swallows the bump,
// because dimple_h + lid_vert_clearance > detent_h.
detent_r  = 1.4;   // bump on the divider wall
detent_h  = 0.60;  // protrusion: 0.3 of float + 0.3 of forced flex
dimple_r  = 1.6;   // mating recess in the lid underside
dimple_h  = 0.45;

/* [Hidden] */
$fa = 2; $fs = 0.4;
eps = 0.01;

// ============================================================================
//  Cavity / band model
// ----------------------------------------------------------------------------
//  cell = [kind, w, h, depth]        kind: "sq" (rect pocket) | "rd" (round well)
//                                    for "rd", w == h == outer diameter
//  band = [ [cell, ...], gap_after, cell_gap ]
//         cell_gap == 0  -> gaps derived to fill the full inner width
//         cell_gap  > 0  -> fixed gap, block centred on the inner width
//
//  Bands stack downward from under the top rail. Whatever height is left
//  between the last band and the bottom wall becomes the open bay.
// ============================================================================

function d6(sz = die_size) =
    ["sq", sz + die_clearance, sz + die_clearance, sz + die_headroom];
function well(dia, dp) =
    ["rd", dia + well_clearance, dia + well_clearance, dp];
function slot(w, h, dp) = ["sq", w, h, dp];

// ------------------------------------------------------------------ profiles ---
//
// TWO VARIANTS, and the question they answer is "do you carry a coin?" rather
// than "which game do you play". The layouts were named after games for three
// releases and it was always slightly a lie -- nothing in either of them is
// game-specific, and people kept picking the wrong one because they picked by
// the name on the box instead of by what they actually carry.
//
//   nocoin   6 dice and an open bay for tokens
//   coin     7 dice and a 38 mm flip-coin well, no bay
//
// MTG and Riftbound players almost always want `nocoin`; Pokemon players almost
// always want `coin`. That is guidance, not a rule.

// All dice, plus an open bay for tokens, markers and spares.
nocoin_bands = [
    [[ d6(), d6(), d6() ], div_wall, 0],
    [[ d6(), d6(), d6() ], wall,     0],
];

// All dice AND a coin. The coin is bigger than it looks: official Pokemon coins
// run 29.8-51.6 mm, the common modern flip coin is the 34 mm "large", and the
// larger authorised collectible is 38 mm. This is built for 38 mm, which
// swallows every size below it. A 51 mm jumbo cannot be housed at all -- not in
// a well, and not loose either. Nothing in a 66 x 91 slab will take one.
//
// A round well's DIAMETER sets the height of the whole band it sits in, so the
// coin's band is 38.8 mm tall and leaves 22.2 mm of the 61 mm interior beside
// it -- exactly enough for one more die rather than dead space. That is where
// the seventh die comes from, and it is why this variant has MORE dice than the
// no-coin one and no bay: the coin costs the bay, not the dice.
coin_bands = [
    [[ d6(), d6(), d6() ], div_wall, 0],
    [[ d6(), d6(), d6() ], div_wall, 0],
    [[ well(coin_d, well_depth), d6() ], wall, 0],
];

// Your own layout -- edit freely, then set variant = "custom".
custom_bands = [
    [[ d6(), d6(), d6() ], div_wall, 0],
    [[ well(ctr_small_d, well_depth), well(ctr_small_d, well_depth) ], wall, 0],
];

bands =
      variant == "nocoin" ? nocoin_bands
    : variant == "coin"   ? coin_bands
    :                       custom_bands;

// ------------------------------------------------------------------ helpers ---
function sum(v, i = 0) = i >= len(v) ? 0 : v[i] + sum(v, i + 1);

function b_cells(b)     = b[0];
function b_gap_after(b) = b[1];
function b_cell_gap(b)  = b[2];
function b_h(b)         = max([for (c = b_cells(b)) c[2]]);
function b_depth(b)     = max([for (c = b_cells(b)) c[3]]);
function b_w_sum(b)     = sum([for (c = b_cells(b)) c[1]]);

function max_depth() = max([for (b = bands) b_depth(b)]);

// ---------------------------------------------------------------- derived ---
groove_h = lid_t + lid_vert_clearance;

slab_w  = box_int_w - fit_gap_w;
slab_h  = box_int_h - fit_gap_h;
D_min   = floor_t + max_depth() + groove_h + cap_t;
D       = max(slab_depth, D_min);

z_top        = D;
z_groove_top = D - cap_t;
z_groove_bot = z_groove_top - groove_h;
z_deep_bot   = z_groove_bot - max_depth();   // floor under the deepest cavity

// ------------------------------------------------------------------ layout ---
function inner_w(w) = w - 2*wall;

function b_gap(b, w) =
    let (n = len(b_cells(b)), iw = inner_w(w))
    b_cell_gap(b) > 0 ? b_cell_gap(b)
                      : (n > 1 ? (iw - b_w_sum(b)) / (n - 1) : 0);

function b_x0(b, w) =
    let (n = len(b_cells(b)), iw = inner_w(w),
         total = b_w_sum(b) + (n - 1) * b_gap(b, w))
    wall + (iw - total) / 2;

function cell_x(b, w, i) =
    b_x0(b, w) + sum([for (k = [0:1:i-1]) b_cells(b)[k][1] + b_gap(b, w)]);

// Bands stack top-down from under the rail.
function band_top(bs, h, rail, k) =
    k == 0 ? h - rail
           : band_top(bs, h, rail, k-1) - b_h(bs[k-1]) - b_gap_after(bs[k-1]);
function band_bot(bs, h, rail, k) = band_top(bs, h, rail, k) - b_h(bs[k]);

function cell_y(bs, h, rail, k, c) =
    band_bot(bs, h, rail, k) + (b_h(bs[k]) - c[2]) / 2;

// Everything below the last band, down to the bottom wall, is the open bay.
function cav_bot(bs, h, rail)  = band_bot(bs, h, rail, len(bs)-1);
function bay_y_top(bs, h, rail) = cav_bot(bs, h, rail) - b_gap_after(bs[len(bs)-1]);
function bay_y_bot()            = wall;
function bay_h(bs, h, rail)     = bay_y_top(bs, h, rail) - bay_y_bot();
function divider_y(bs, h, rail) = (bay_y_top(bs, h, rail) + cav_bot(bs, h, rail)) / 2;

function lid_len(h, rail) = h - rail - lid_end_clearance;

// ------------------------------------------------------------- primitives ---

// Outer footprint with 45 deg corner reliefs, so moulded corner fillets
// in the deck case can never bind against the slab.
module outer_shape(w, h, cr) {
    polygon([[cr,0],[w-cr,0],[w,cr],[w,h-cr],[w-cr,h],[cr,h],[0,h-cr],[0,cr]]);
}

// Trapezoidal prism running along -Y from y=0, profile in the XZ plane.
// Wide at the bottom, narrow at the top -> self-supporting in both the
// groove (as a subtraction) and the lid (as a solid).
module trap_along_y(w_bot, w_top, z0, z1, len) {
    rotate([90, 0, 0])
        linear_extrude(height = len)
            polygon([[-w_bot/2, z0], [w_bot/2, z0], [w_top/2, z1], [-w_top/2, z1]]);
}

// One cavity, hung from the underside of the lid and cut downward.
module cavity(c, x, y) {
    dp = c[3];
    z0 = z_groove_bot - dp;
    if (c[0] == "rd")
        translate([x + c[1]/2, y + c[2]/2, z0]) cylinder(d = c[1], h = dp + eps);
    else
        translate([x, y, z0]) cube([c[1], c[2], dp + eps]);
}

// Push-out hole through the floor beneath a cavity.
module cavity_pushout(c, x, y) {
    dp = c[3];
    z0 = z_groove_bot - dp;
    // Whichever is smaller: the proportional hole, or the largest hole that
    // still leaves pushout_ledge of floor. An absolute cap applies only if set.
    pd = min(c[1]*pushout_frac,        c[2]*pushout_frac,
             c[1] - 2*pushout_ledge,   c[2] - 2*pushout_ledge,
             pushout_d > 0 ? pushout_d : 1e6);
    if (pd >= 4)
        translate([x + c[1]/2, y + c[2]/2, -1]) cylinder(d = pd, h = z0 + 2);
}

// 45 deg lead-in flare at the mouth of a cavity.
module cavity_leadin(c, x, y) {
    if (c[0] == "rd")
        translate([x + c[1]/2, y + c[2]/2, z_groove_bot - lead_in])
            cylinder(d1 = c[1], d2 = c[1] + 2*lead_in, h = lead_in + eps);
    else
        translate([x + c[1]/2, y + c[2]/2, z_groove_bot - lead_in])
            linear_extrude(height = lead_in + eps,
                           scale = [(c[1] + 2*lead_in)/c[1],
                                    (c[2] + 2*lead_in)/c[2]])
                square([c[1], c[2]], center = true);
}

// Pinch notches beside a cavity: one scallop centred on each of its four
// edges. Cut DOWNWARD from the cavity mouth, so no material is left bridging
// over them and the part stays support-free.
//
// These are deliberately not filtered here. The caller clips the whole set to
// the field of divider material between the outer walls, which makes a notch
// vanish by itself wherever it would breach a wall or the top rail -- so a
// profile can be re-laid-out freely without hand-auditing which edges are safe.
// How deep a bite the dividers in THIS layout can afford. Two cavities facing
// each other across a divider each take a bite out of it, so the tightest gap
// anywhere sets the limit for the whole part -- one bite everywhere looks
// deliberate, where per-edge sizing looks like a mistake.
// Each edge is sized against the divider IT is cutting, not against the
// tightest divider on the part -- otherwise one cramped band holds back the
// roomy ones, and a 5.3 mm divider gets the bite a 2.5 mm divider can afford.
//
// A divider between two cavities is bitten from both sides, so each side may
// take half the spare material. A divider facing the open bay, the outer wall
// or the top rail is bitten once: the bay gets the whole allowance, and the
// wall and rail cases are moot because the clip erases those dishes anyway.
function bite_shared(g) = (g - notch_min_wall) / 2;
function bite_solo(g)   =  g - notch_min_wall;

// side: 0 = +X, 1 = -X, 2 = +Y, 3 = -Y
function edge_bite(bs, w, k, i, side) =
    let (n   = len(b_cells(bs[k])),
         gh  = b_gap(bs[k], w),
         lim = side == 0 ? (i < n - 1        ? bite_shared(gh) : notch_bite)
             : side == 1 ? (i > 0            ? bite_shared(gh) : notch_bite)
             : side == 2 ? (k > 0            ? bite_shared(b_gap_after(bs[k-1]))
                                             : notch_bite)
             :             (k < len(bs) - 1  ? bite_shared(b_gap_after(bs[k]))
                                             : bite_solo(b_gap_after(bs[k]))))
    max(0, min(notch_bite, lim));

// A shallow dish taken out of the material lying at +X of the origin.
//
//   plan:   ___..----..___     a `notch_arc` segment of a large circle, so the
//                              sweep is long and gentle rather than a tight bowl
//
// The dish is an ellipsoid whose centre sits notch_ease ABOVE the cavity mouth.
// That matters twice over: the rim is eased rather than a 90 degree lip, and
// since every scrap of material is below the centre, every cut surface faces
// upward -- the notch cannot introduce an overhang.
//
// Clipped to its own side of the edge, so a dish never reaches across a cavity
// and nibbles the divider on the far side.
module notch_dish(bite) {
    // Below this a dish is a scratch, not a grip: skip it rather than litter
    // the model with near-degenerate geometry. Thin dividers (div_wall) hit
    // this on their shared edges, which is the intended trade -- the side
    // edges, cut into far thicker dividers, carry the grip.
    if (bite >= 0.3) {
        rm = bite / (1 - cos(notch_arc / 2));      // radius at the mouth
        c  = notch_depth + notch_ease;             // vertical semi-axis
        R  = rm / sqrt(1 - pow(notch_ease / c, 2));
        intersection() {
            translate([bite - rm, 0, z_groove_bot + notch_ease])
                scale([1, 1, c / R]) sphere(r = R);
            translate([0, -rm - 1, z_groove_bot - notch_depth - 1])
                cube([bite + 1, 2*rm + 2, notch_depth + notch_ease + c + 2]);
        }
    }
}

module cell_notches(bs, w, h, rail, k, i) {
    c  = b_cells(bs[k])[i];
    x  = cell_x(bs[k], w, i);
    y  = cell_y(bs, h, rail, k, c);
    cx = x + c[1]/2;
    cy = y + c[2]/2;
    //        where            rotation   side
    for (e = [[[x + c[1], cy],     0,      0],
              [[x,        cy],   180,      1],
              [[cx, y + c[2]],    90,      2],
              [[cx, y       ],   270,      3]])
        translate([e[0][0], e[0][1], 0]) rotate([0, 0, e[1]])
            notch_dish(edge_bite(bs, w, k, i, e[2]));
}

// -------------------------------------------------------------------- body ---
module insert_body(bs, w, h, rail, scoop) {
    iw = inner_w(w);
    union() {
        difference() {
            linear_extrude(height = D) outer_shape(w, h, corner_relief);

            // Lid channel: everything inside the walls, above the groove floor,
            // stopping at the solid top rail (which is the lid stop).
            translate([wall, -eps, z_groove_bot])
                cube([iw, h - rail + eps, D - z_groove_bot + eps]);

            // Lid groove: carve the two wedges into the side walls.
            translate([w/2, h - rail, 0])
                trap_along_y(iw + 2*lid_groove_depth, iw,
                             z_groove_bot, z_groove_top, h - rail + 1);

            // Cavities, each with a push-out hole through its floor.
            for (k = [0:len(bs)-1], i = [0:len(b_cells(bs[k]))-1]) {
                c = b_cells(bs[k])[i];
                x = cell_x(bs[k], w, i);
                y = cell_y(bs, h, rail, k, c);
                cavity(c, x, y);
                cavity_pushout(c, x, y);
            }

            // Lead-in chamfers, CLIPPED to the cavity block. Unclipped they
            // would eat into the outer walls and destroy the groove ledge
            // that carries the lid.
            intersection() {
                cb = cav_bot(bs, h, rail);
                translate([wall, cb, z_groove_bot - lead_in - 1])
                    cube([iw, h - rail - cb, lead_in + 2]);
                union() {
                    for (k = [0:len(bs)-1], i = [0:len(b_cells(bs[k]))-1]) {
                        c = b_cells(bs[k])[i];
                        cavity_leadin(c, cell_x(bs[k], w, i),
                                      cell_y(bs, h, rail, k, c));
                    }
                }
            }

            // Pinch notches, CLIPPED to the divider field: inside the outer
            // walls, below the top rail (cutting into the rail would leave it
            // bridging over the notch) and clear of the detent bump's footing.
            // render() collapses this subtree before it reaches the preview's
            // CSG normaliser, which otherwise explodes on ~24 clipped dishes.
            if (pinch_notch)
                render() intersection() {
                    translate([wall, wall, z_groove_bot - notch_depth - 1])
                        cube([iw, h - rail - wall, notch_depth + 2*notch_ease + 40]);
                    // No detent keep-out is needed any more: the detent lives
                    // on the bottom wall, far below the lowest cavity edge.
                    difference() {
                        union() {
                            for (k = [0:len(bs)-1],
                                 i = [0:len(b_cells(bs[k]))-1])
                                cell_notches(bs, w, h, rail, k, i);
                        }
                    }
                }

            // Open bay for tokens / markers / spares, optionally split by a rib.
            byb = bay_y_bot();
            byh = bay_h(bs, h, rail);
            if (byh > 4)
                for (s = (bay_rib && iw > 30) ? [0,1] : [0]) {
                    bw = (bay_rib && iw > 30) ? (iw - wall)/2 : iw;
                    translate([wall + s*(bw + wall), byb, z_deep_bot])
                        cube([bw, byh, max_depth() + eps]);
                }

            // Finger scoop through the top rail -- hook a fingertip to lift
            // the whole slab out of the deck box.
            translate([w/2, h + scoop_d/2 - scoop, -1])
                cylinder(d = scoop_d, h = D + 2);
        }

        // Boss thickening the bottom wall, and the detent bump on top of it.
        // Both are at a fixed y, so the lid that mates with them is the same
        // part on every profile.
        translate([w/2 - boss_w/2, 0, 0])
            cube([boss_w, wall + boss_extra, z_groove_bot]);
        translate([w/2, detent_y, z_groove_bot - (detent_r - detent_h)])
            sphere(r = detent_r);
    }
}

// --------------------------------------------------------------------- lid ---
module insert_lid(w, h, rail) {
    iw  = inner_w(w);
    // Match the groove's trapezoid exactly, inset by a uniform clearance.
    lbw = iw + 2*lid_groove_depth - lid_side_clearance;             // at z_groove_bot
    ltw = iw + 2*lid_groove_depth*(1 - lid_t/groove_h)
              - lid_side_clearance;                                 // at +lid_t
    L   = lid_len(h, rail);

    // Radius that makes a cylinder lying across the lid cut a groove
    // grip_slot_w wide and grip_depth deep.
    gr = pow(grip_slot_w/2, 2) / (2*grip_depth) + grip_depth/2;

    difference() {
        translate([w/2, L, 0])
            trap_along_y(lbw, ltw, z_groove_bot, z_groove_bot + lid_t, L);

        // Recessed thumb pad at the open end.
        for (i = [0 : grip_n - 1])
            translate([w/2, grip_y0 + i*grip_pitch,
                       z_groove_bot + lid_t - grip_depth + gr])
                rotate([0, 90, 0]) cylinder(r = gr, h = grip_w, center = true);
        // Mating dimple for the body's detent bump, at the closed position.
        // The lid sits lid_end_clearance further in than it is modelled, hence
        // the offset. No dependence on the layout -- this is why every profile
        // now ships the identical lid.
        translate([w/2, detent_y - lid_end_clearance,
                   z_groove_bot - (dimple_r - dimple_h)])
            sphere(r = dimple_r);
    }
}

// ------------------------------------------------------------------ render ---
if (part == "body")
    insert_body(bands, slab_w, slab_h, top_rail, scoop_depth);

else if (part == "lid")
    translate([0, 0, -z_groove_bot]) insert_lid(slab_w, slab_h, top_rail);

else if (part == "all") {
    insert_body(bands, slab_w, slab_h, top_rail, scoop_depth);
    insert_lid(slab_w, slab_h, top_rail);
}

// ------------------------------------------------------------------- report ---
echo(str("variant = ", variant));
echo(str("slab = ", slab_w, " x ", slab_h, " x ", D, " mm"));
echo(str("deepest cavity = ", max_depth(), ", floor = ", z_deep_bot));
for (k = [0:len(bands)-1])
    echo(str("  band ", k, ": ", len(b_cells(bands[k])), " cells, h = ",
             b_h(bands[k]), ", gap = ", b_gap(bands[k], slab_w),
             ", y = ", band_bot(bands, slab_h, top_rail, k),
             "..", band_top(bands, slab_h, top_rail, k)));
echo(str("bay = ", bay_h(bands, slab_h, top_rail), " tall"));
echo(str("card depth remaining = ", box_int_d - D, " mm"));
