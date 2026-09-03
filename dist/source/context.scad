// Listing explainer: what the insert is for. The slab occupies only ~20 mm of
// the case's ~67 mm depth; the deck shown above it is what still fits behind.
// NOT a printable part.
//   openscad -D 'game="mtg"' -D 'part="none"' -o context.png context.scad
include <dice_insert.scad>

deck_lift = 86;     // deck exploded away so it does not hide the insert
ct = 3.5;
ox = -(box_int_w - slab_w) / 2;
oy = -(box_int_h - slab_h) / 2;

// The deck case, ghosted.
%translate([ox - ct, oy - ct, -ct])
    difference() {
        cube([box_int_w + 2*ct, box_int_h + 2*ct, box_int_d + ct]);
        translate([ct, ct, ct]) cube([box_int_w, box_int_h, box_int_d + 1]);
    }

// The deck that still fits behind the insert: 47.3 mm of double-sleeved cards.
deck_t = box_int_d - D - 1.0;
for (i = [0 : 15])
    color(i % 2 ? "#e6ebf1" : "#ccd5de")
        translate([ox + 1.5, oy + 1.0, deck_lift + i * deck_t / 16])
            cube([box_int_w - 3, box_int_h - 2, deck_t / 16 - 0.35]);

color("#7d99ad") insert_body(bands, slab_w, slab_h, top_rail, scoop_depth);
color("#d8a13a", 0.95) translate([0, 0, 40]) insert_lid(slab_w, slab_h, top_rail);

for (k = [0:len(bands)-1], i = [0:len(b_cells(bands[k]))-1]) {
    c  = b_cells(bands[k])[i];
    x  = cell_x(bands[k], slab_w, i);
    y  = cell_y(bands, slab_h, top_rail, k, c);
    z0 = z_groove_bot - c[3];
    if (c[0] == "sq")
        color("#efe7d6") translate([x + c[1]/2, y + c[2]/2, z0 + die_size/2])
            cube(die_size, center = true);
    else
        for (n = [0 : floor(c[3]/3) - 1])
            color(n % 2 ? "#c8524b" : "#e8e8e4")
                translate([x + c[1]/2, y + c[2]/2, z0 + n*3])
                    cylinder(d = c[1] - well_clearance, h = 2.7);
}
