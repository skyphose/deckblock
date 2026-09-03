#!/bin/sh
# Render every game profile to stl/<game>/ plus a preview PNG.
# Usage:  ./render.sh            (all profiles)
#         ./render.sh pokemon    (just one)
set -e
GAMES="${*:-mtg pokemon riftbound}"
for g in $GAMES; do
    mkdir -p "stl/$g"
    for p in body lid; do
        openscad --backend=manifold --export-format binstl \
            -o "stl/$g/${g}_$p.stl" -D "game=\"$g\"" -D "part=\"$p\"" \
            dice_insert.scad
    done
    openscad --backend=manifold -D "game=\"$g\"" -D 'part="none"' \
        --camera=72,44,10,32,0,20,330 --imgsize=1200,820 --colorscheme=Tomorrow \
        -o "preview_$g.png" preview.scad
    echo "  -> stl/$g/ + preview_$g.png"
done
