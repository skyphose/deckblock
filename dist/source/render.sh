#!/bin/sh
# render every variant to stl/<variant>/ plus a preview png.
# usage:  ./render.sh            (both variants)
#         ./render.sh coin       (just one)
set -e
VARIANTS="${*:-nocoin coin}"
for g in $VARIANTS; do
    mkdir -p "stl/$g"
    for p in body lid; do
        openscad --backend=manifold --export-format binstl \
            -o "stl/$g/${g}_$p.stl" -D "variant=\"$g\"" -D "part=\"$p\"" \
            deckblock.scad
    done
    openscad --backend=manifold -D "variant=\"$g\"" -D 'part="none"' \
        --camera=72,44,10,32,0,20,330 --imgsize=1200,820 --colorscheme=Tomorrow \
        -o "preview_$g.png" preview.scad
    echo "  -> stl/$g/ + preview_$g.png"
done
