# fish-nvim-appname

A simple fish plugin for maintaining multiple Neovim configurations with `NVIM_APPNAME`

Requirements: Neovim v0.9+

## Usage

This creates a new command `nvapp` which takes an `appname` of a folder `named nvim_<appname>` in your `$XDG_CONFIG_HOME` or `$HOME/.config` and passes it into neovim using the `NVIM_APPNAME` environment variable.

```
Usage:
    nvapp [-h|--help] <nvapp_name> [--binary <binary_path>] [--delete] [--purge] ...

Options:
    -h, --help      Display this help text
    <nvapp_name>    The name of the neovim app in $XDG_CONFIG_HOME
                    (E.g.: ~/.config/<nvapp_name>)
    --binary <path> Specify Neovim binary to use
    --delete        Delete configuration directory for <nvapp_name>
    --purge         Clean installation files for <nvapp_name>
    ...             Any additional arguments passed to neovim
```

## Installation

Install using [Fisher](https://github.com/jorgebucaran/fisher):

```sh
fisher install manuuurino/fish-nvim-appname
```

## Acknowledgements

This plugin is based on the [zsh-nvim-appname](https://github.com/mehalter/zsh-nvim-appname/) project by Michael Halter ([mehalter](https://github.com/mehalter)), adapted for the Fish shell with additional features.

## License

[GPL-3.0](LICENSE)
