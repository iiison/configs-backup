# configs-backup
my configuration backup

zsh location: ~/.zshrc

neovim: ~/.config/nvim/

plist: ~/Library/Preferences/com.googlecode.iterm2.plist


## If neovim throws error in start-up. Please verify:
- if you have `pyvim` and `neovim` installed via python.
- if deoplete is installed correctly.

follow these commands to install pip dependencies:
```sh
pip uninstall -y neovim pynvim msgpack greenlet
pip install neovim pynvim msgpack greenlet
```
