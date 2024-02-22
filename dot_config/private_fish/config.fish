starship init fish | source

if status is-interactive

    # BlackBox and Prompt don't set WAYLAND_DISPLAY, preventing pass -c to work.
    if set -q TERM_PROGRAM
        set -gx WAYLAND_DISPLAY "wayland-0"
    end
    if set -q PTYXIS_PROFILE
        set -gx WAYLAND_DISPLAY "wayland-0"
    end

    set -gx ATUIN_NOBIND "true"
    atuin init fish | source
    bind \cr _atuin_search

    bind \cl 'wipe --duration 1200; commandline -f repaint'

    # Brew likely won't work in containers.
    if not set -q container
        eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    end

    direnv hook fish | source
end


# https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md#bobthefish
function fish_right_prompt; end
set -g theme_use_abbreviated_branch_name yes
set -g theme_color_scheme nord
set -g theme_display_git_untracked no
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
