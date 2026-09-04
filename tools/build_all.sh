#!/bin/sh
# Render body + lid for every profile into a directory, then check them.
#   sh tools/build_all.sh [outdir]
set -e
ROOT=$(cd "$(dirname "$0")/.." && pwd)
OUT=${1:-${TMPDIR:-/tmp}/insert-build}
OPENSCAD=${OPENSCAD:-openscad}
export OPENSCADPATH="$ROOT"
mkdir -p "$OUT"

for g in mtg pokemon riftbound; do
    for p in body lid; do
        "$OPENSCAD" -q -o "$OUT/${p}_${g}.stl" --export-format binstl \
            -D "game=\"$g\"" -D "part=\"$p\"" "$ROOT/dice_insert.scad" 2>&1 \
            | grep -iE "^ERROR|WARNING: Assert" || true
    done
done

echo "== mesh"
python3 "$ROOT/tools/meshcheck.py" "$OUT"/*.stl || true
echo "== unsupported area"
python3 "$ROOT/tools/overhang.py" "$OUT"/*.stl || true
echo "== one lid for every profile?"
md5 -q "$OUT"/lid_mtg.stl "$OUT"/lid_pokemon.stl "$OUT"/lid_riftbound.stl
