function nvapp \
    --description 'Wrapper function for nvim with additional functionalities' \
    --argument-names nvapp_name

    argparse --ignore-unknown 'binary=' h/help purge delete -- $argv[2..-1]

    if set --query _flag_help
        echo \
            "Usage:
    nvapp [-h|--help] <nvapp_name> [--binary <binary_path>] [--delete] [--purge] ...

Options:
    -h, --help      Display this help text
    <nvapp_name>    The name of the neovim app in $XDG_CONFIG_HOME
                    (E.g.: ~/.config/<nvapp_name>)
    --binary <path> Specify Neovim binary to use
    --delete        Delete configuration directory for <nvapp_name>
    --purge         Clean installation files for <nvapp_name>
    ...             Any additional arguments passed to neovim"

        return 0
    end

    if test -z "$nvapp_name"
        echo "Error: Must specify <nvapp_name>."
        return 1
    end

    set --query _flag_binary; or set _flag_binary nvim

    function prompt_confirm
        echo "Confirm? (y/N)"
        read --line confirm
        return (test "$confirm" = "y" -o "$confirm" = "Y")
    end

    set --query XDG_CONFIG_HOME; or set --local XDG_CONFIG_HOME $HOME/.config

    if set --query _flag_purge; or set --query _flag_delete
        set --query XDG_DATA_HOME; or set --local XDG_DATA_HOME $HOME/.local/share
        set --query XDG_CACHE_HOME; or set --local XDG_CACHE_HOME $HOME/.cache
        set --query XDG_STATE_HOME; or set --local XDG_STATE_HOME $HOME/.local/state

        set paths "$XDG_DATA_HOME/$nvapp_name" "$XDG_CACHE_HOME/$nvapp_name" "$XDG_STATE_HOME/$nvapp_name"

        set_color yellow
        echo "WARNING: Deleting installation files for '$nvapp_name': $paths"
        set_color normal
        if prompt_confirm
            for path in $paths
                rm -rf $path
            end
        else
            echo "Cancelled."
            return 0
        end
    end

    set --local nvim_config_directory "$XDG_CONFIG_HOME/$nvapp_name"

    if set --query _flag_delete
        set_color yellow
        echo "WARNING: Deleting configuration directory for '$nvapp_name': $nvim_config_directory"
        set_color normal
        if prompt_confirm
            rm -rf "$nvim_config_directory"
        else
            echo "Cancelled."
            return 0
        end
    else if test -d "$nvim_config_directory"
        NVIM_APPNAME="$nvapp_name" $_flag_binary $argv[2..-1]
    else
        echo "Error: Configuration directory '$nvim_config_directory' doesn't exist."
        return 1
    end
end
