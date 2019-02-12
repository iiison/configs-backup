# neovim config

1. Clone repo into wherever your neovim config is (Linux: `$HOME/.config/nvim/`)
2. Run `:PlugInstall` in neovim
3. `/dance`

## Requirements

* Python for deoplete
* node.js for ternjs and livedown (`$ npm install -g tern livedown`)

In addition, these are useful to have:

* eslint (for neomake in javascript files) (`$ npm install -g eslint`)
  * Configure neomake to use a different linter, e.g. jscs
* scss-lint (same, for scss files) (`$ gem install scss_lint`)
