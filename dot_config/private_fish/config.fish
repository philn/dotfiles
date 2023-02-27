starship init fish | source

if status is-interactive

    set -gx ATUIN_NOBIND "true"
    atuin init fish | source
    bind \cr _atuin_search

    # Auto-start zellij in interactive, non-toolbox shells.
    if not set -q container
        # eval (zellij setup --generate-auto-start fish | string collect)
        if not set -q ZELLIJ
            zellij attach -c (prompt_hostname)
            if test "$ZELLIJ_AUTO_EXIT" = "true"
                kill $fish_pid
            end
        end
    end
end

# https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md#bobthefish
function fish_right_prompt; end
set -g theme_use_abbreviated_branch_name yes
set -g theme_color_scheme nord
set -g theme_display_git_untracked no
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
