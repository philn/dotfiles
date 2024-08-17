
set -gx RUSTUP_HOME $HOME/.rustup
set -gx CARGO_HOME $HOME/.cargo-home

if not set -q container
    set PATH $HOME/toolbox
end

set PATH $PATH $HOME/bin $HOME/.cargo-home/bin $HOME/.local/bin /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin $HOME/go/bin $HOME/.local/share/flatpak/exports/bin $HOME/WebKit/Tools/Scripts

set -gx EDITOR "jed"
set -gx VISUAL "f-spawn flatpak enter org.gnu.emacs flatpak-spawn --directory=\"\$PWD\" emacsclient"

set -gx GST_INSPECT_NO_COLORS 1

set -gx DEBUGINFOD_URLS https://debuginfod.fedoraproject.org/

set -gx HOMEBREW_NO_ANALYTICS 1

if set -q fish_private_mode
    set -gx FISH_PRIVATE_MODE 1
end
# eval (pipenv --completion)

#set -e SSH_AGENT_PID # unset
#fenv source '$HOME/ssh_gpg_support.sh'

gpgconf --launch gpg-agent
eval (ssh-agent -c) > /dev/null
set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)

alias ls="eza"
alias df="dysk"
