#!/bin/sh
# Build everything needed to upload to Printables / MakerWorld into dist/.
#   ./prep_release.sh
set -e

OUT=dist
NAME=BoulderInsert
GAMES="mtg pokemon riftbound"

rm -rf "$OUT"
mkdir -p "$OUT/models-stl" "$OUT/models-3mf" "$OUT/images" "$OUT/source"

label() {
    case "$1" in
        mtg)       echo "MTG" ;;
        pokemon)   echo "Pokemon" ;;
        riftbound) echo "Riftbound" ;;
        *)         echo "$1" ;;
    esac
}

echo "== models"
for g in $GAMES; do
    L=$(label "$g")
    # Numbered so they sort into the order you should print them.
    for spec in "body:1-body" "lid:2-lid"; do
        p=${spec%%:*}; n=${spec##*:}
        openscad --backend=manifold --export-format binstl \
            -o "$OUT/models-stl/${NAME}_${L}_${n}.stl" \
            -D "game=\"$g\"" -D "part=\"$p\"" dice_insert.scad 2>/dev/null
        openscad --backend=manifold --export-format 3mf \
            -o "$OUT/models-3mf/${NAME}_${L}_${n}.3mf" \
            -D "game=\"$g\"" -D "part=\"$p\"" dice_insert.scad 2>/dev/null
    done
    echo "  $L"
done

echo "== cleaning and validating meshes"
python3 tools/meshcheck.py --strip "$OUT"/models-stl/*.stl

echo "== images"
for g in $GAMES; do
    openscad --backend=manifold -D "game=\"$g\"" -D 'part="none"' \
        --camera=72,44,10,32,0,20,330 --imgsize=1600,1200 --colorscheme=Tomorrow \
        -o "$OUT/images/1-$(label $g).png" preview.scad 2>/dev/null
done
openscad --backend=manifold -D 'game="mtg"' -D 'part="none"' \
    --camera=33,44,60,68,0,28,430 --imgsize=1600,1200 --colorscheme=Tomorrow \
    -o "$OUT/images/2-fits-in-case.png" context.scad 2>/dev/null
openscad --backend=manifold -D 'game="mtg"' -D 'part="body"' \
    --camera=33,44,10,208,0,20,300 --imgsize=1600,1200 --colorscheme=Tomorrow \
    -o "$OUT/images/3-push-out-holes.png" dice_insert.scad 2>/dev/null
echo "  $(ls "$OUT/images" | wc -l | tr -d ' ') images"

echo "== source and docs"
cp dice_insert.scad preview.scad context.scad render.sh "$OUT/source/"
cp LICENSE.txt "$OUT/LICENSE.txt"
cp dist_README.txt "$OUT/README.txt"

echo
echo "dist/ ready:"
find "$OUT" -type f | sort | sed 's/^/  /'
