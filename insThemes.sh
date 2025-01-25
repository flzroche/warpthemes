#!/usr/bin/env bash

warp_formula="/opt/homebrew/Library/Taps/caskroom/homebrew-cask/Casks/w/warp.rb"
themes_dir="$HOME/.warp/themes"

if [ -f "$warp_formula" ]; then
  echo -e "OK! Warp is already installed."
  if [ -d "$themes_dir" ]; then
    cp ./themes/standard/*.* ~/.warp/themes/standard/ && echo -e "\nCopy Themes Complate!"
  else
    echo -e "\n~/.warp/themes/ Directory: does not exist.\n\n Do you wish to continue?(y/n)"
    read -p "input: " answer
    if [ "$answer" = "y" ]; then
      cp ./themes/standard/*.* ~/.warp/themes/standard/ && echo -e "\nCopy Themes Complate!"
    else
      echo -e "Exit process."
      exit 1
    fi
  fi
else
  echo -e "Warp is not installed. Please choose an installation method:"
  echo -e "  1. Homebrew"
  echo -e "  2. Manual installation"
  read -p "Enter your choice: " choice

  case $choice in
    1)
      echo -e "Installing Warp using Homebrew..."
      brew install --cask warp
      ;;
    2)
      echo -e "Please follow the official Warp installation instructions:"
      echo -e "  https://www.warp.dev/"
      ;;
    *)
      echo -e "Invalid choice."
      ;;
  esac
fi

