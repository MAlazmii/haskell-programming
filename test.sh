#!/bin/sh
set -eu
cd "$(dirname "$0")"
command -v ghc >/dev/null || { echo "GHC is required to run these tests" >&2; exit 1; }
mkdir -p build
ghc -Wall -iexercises/repeat-encoding -iexercises/stock-transactions -iexercises/maze -outputdir build -main-is Exercises tests/Exercises.hs -o build/tests
build/tests
