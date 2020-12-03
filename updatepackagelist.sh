#!/usr/bin/env bash

comm -23 <(pacman -Qeq | sort) <(pacman -Qmeq | sort) > $HOME/Dotfiles/pacman.txt
(pacman -Qmeq | sort) > $HOME/Dotfiles/aur.txt
