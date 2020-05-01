# Dotfiles!

Deployed using GNU stow. Each folder in this repo acts as a package to be installed. Stow manages these as symlinks starting from your home folder.

I also use each branch for the small differences between systems if need be, master being for Arch on my personal laptop.

### Example
The directory ranger contains configs (from Luke Smith's dotfiles) for ranger, under ranger/.config/ranger. Running `stow ranger` will "install" those configs according to the file structure inside the ranger package. After running, you should see ~/.config/ranger contains symlinks to the dotfiles. Stow will manage these in a very intuitive manner, and version control makes dotfiles much easier to manage.

### Installation
1. Clone into this in your home directory (~/Dotfiles)
1. Install stow (e.g. sudo pacman -S stow)
1. If existing configs are present, remove or back them up elsewhere. Stow will not continue if the folder exists
1. Stow the desired packages individually using `stow <package name>`

