# Crossword
Script to facilitate solving daily crosswords.

# Installation:
  * Install "dialog" package with whatever package manager you use. 
  * Run `pip3 install --user cursewords` to grab the cursewords solver. (https://github.com/thisisparker/cursewords)
  * Pull down this script.
  * Execute `chmod +x crossword.sh` if permissions are wrong. 
  * Run the script!

# Notes:
  * All .puz files are saved to `$HOME/crosswords/` by default. You can change this via `$PuzzDir` on line 29.
  * If you save state and quit a puzzle, you will have to directly re-open it with cursewords. Re-running the script
    will over-write the existing copy and wipe any state. (will be fixed in subsequent version)
  * Remember you can always do `mv crossword.sh /usr/bin/crossword`. Now it can be invoked via just typing `crossword` in bash.
