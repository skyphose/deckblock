// Visual preview only -- not a printable part.
//   openscad -D 'game="pokemon"' -o preview_pokemon.png preview.scad
include <dice_insert.scad>

explode      = 78;   // lid parked beside the body, in +X
show_content = true;

color("#7d99ad") insert_body(bands, slab_w, slab_h, top_rail, scoop_depth);
color("#d8a13a", 0.95) translate([explode, 0, 0])
    insert_lid(slab_w, slab_h, top_rail);

// Mock contents: a die in every square pocket, a counter stack in every well.
if (show_content)
    for (k = [0:len(bands)-1], i = [0:len(b_cells(bands[k]))-1]) {
        c  = b_cells(bands[k])[i];
        x  = cell_x(bands[k], slab_w, i);
        y  = cell_y(bands, slab_h, top_rail, k, c);
        z0 = z_groove_bot - c[3];
        if (c[0] == "sq")
            color("#efe7d6")
                translate([x + c[1]/2, y + c[2]/2, z0 + die_size/2])
                    cube(die_size, center = true);
        else
            // stack of 3 mm discs filling the well
            for (n = [0 : floor(c[3]/3) - 1])
                color(n % 2 ? "#c8524b" : "#e0e0dc")
                    translate([x + c[1]/2, y + c[2]/2, z0 + n*3])
                        cylinder(d = c[1] - well_clearance, h = 2.7);
    }
