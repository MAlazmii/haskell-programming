# Haskell programming exercises

| Folder | Contents | Status |
| --- | --- | --- |
| `exercises/repeat-encoding` | Repeat encoder and decoder | Historical partial implementation |
| `exercises/stock-transactions` | Transaction formatting and cash-flow reports | Original implementation, valid-input examples |
| `exercises/maze` | Maze display and keyboard movement | Portable sample launcher; path-finding remains incomplete |

## Run

Requires GHC. From the repository root:

```sh
sh test.sh
runghc exercises/maze/Main.hs
runghc exercises/maze/Main.hs exercises/maze/maze.txt
```

Use `w`, `a`, `s`, `d` followed by Enter to move. End input with Ctrl-D to stop. The supplied `maze.txt` is a new demonstration fixture, not the missing original `maze2.txt`. A custom maze must have an open start at zero-based `(1,1)`; `#` is a wall.

The launcher replaces the original machine-specific Windows path and `main = error "Not implemented"`. Movement now rejects out-of-bounds positions and handles empty input and EOF. The original `get_path`/`front` algorithm still only explores right and down, ignores its target and is not a general maze solver.

`Assignment1.hs` was renamed from `Assignment1 (4).hs` to match its module. Its source is otherwise preserved. Known limits: `length_char` counts matching characters throughout the remaining input rather than just the leading run; repeated separated characters therefore encode incorrectly. Counts outside 0–9 are incomplete, malformed simple encodings are partial, and the complex decoder fails on uncounted literal characters. The tests deliberately cover only its supported simple examples. Stock reports likewise expect valid transaction formats and in-range day indices.

GHC was unavailable during local consolidation. The test script provides nine runtime checks; the included CI workflow is intended to execute them. Until that job runs, Haskell compilation and runtime validation remain unverified.

See [provenance](PROVENANCE.md) and [file mapping](PROVENANCE.json). Original lecturer comments are preserved and no new blanket license is applied.
