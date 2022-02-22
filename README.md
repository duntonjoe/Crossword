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
  * Script is able to handle and properly load save states.
  * Remember you can always do `mv crossword.sh /usr/bin/crossword`. Now it can be invoked via just typing `crossword` in bash.
