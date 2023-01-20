
# PapasLauncher

This repository is the source code of a FlipLine Studios flash games launcher made in bash for deb based systems (mostly ubuntu).
## Copyright

I do not own any of these games, they all are propriety of [FlipLine Studio](https://www.flipline.com/). Since they were available for free on the internet, I assumed it would be fine using them for that project. If any copyright infringement is issued, please contact me, and we'll sort things out.
## Installation

To install this launcher, clone this repo in any directory.

```bash
  https://github.com/Frexom/PapasLauncher
  cd PapasLauncher
```

Then, install it by running: 

```bash
  sudo chmod +x ./configure.sh
  ./configure.sh
```

The script will download flashplayer-projector if you don't have it, and move the game in your ~/PapasLauncher directory

## Run Locally

To play FlipLine games, just type 
```bash
  papas
```
in the terminal, and play with autocompletion.


Here are the available commands:

```bash
  papas random
```
Will run a random flipline game.

```bash
  papas play <tab><tab>
```

Will show the available games, then just select one and press enter!
## Authors

- [@frexom](https://www.github.com/ferxom) (The owner of this repo)
