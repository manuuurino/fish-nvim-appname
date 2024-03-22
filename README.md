# fish-nvim-appname

A simple fish plugin for maintaining multiple Neovim configurations with `NVIM_APPNAME`

Requirements: Neovim v0.9+

## Usage

This creates a new command `nvapp` which takes an `appname` of a folder `named nvim_<appname>` in your `$XDG_CONFIG_HOME` or `$HOME/.config` and passes it into neovim using the `NVIM_APPNAME` environment variable.

```
Usage: nvapp [-b|--binary <binary_path>] [-h|--help] [-c|--clean] [-d|--delete] <nvapp_name> ...

Options:
	   -b|--binary	Specify Neovim binary to use
	   -h|--help	Display this help text
	   -c|--clean	Clean installation files for <nvapp_name>
	   -d|--delete	Delete configuration directory for <nvapp_name>

<nvapp_name> is required and specifies the Neovim application name.
After '--', all following arguments are passed directly to Neovim or the specified binary.
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
