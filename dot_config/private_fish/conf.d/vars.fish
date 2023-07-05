
set -gx RUSTUP_HOME $HOME/.rustup
set -gx CARGO_HOME $HOME/.cargo-home

set PATH $PATH $HOME/bin $HOME/WebKit/Tools/Scripts $HOME/.cargo-home/bin $HOME/.local/bin /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin $HOME/go/bin $HOME/.local/share/flatpak/exports/bin

if not set -q container
    set PATH $PATH $HOME/toolbox
end

#set -gx EDITOR "org.gnu.emacs -nw"
set -gx EDITOR "f-spawn flatpak enter org.gnu.emacs flatpak-spawn --directory=\"\$PWD\" emacsclient"
#set -gx ALTERNATE_EDITOR "jed"

set -gx GST_INSPECT_NO_COLORS 1

set -gx DEBUGINFOD_URLS https://debuginfod.fedoraproject.org/

# eval (pipenv --completion)

#set -e SSH_AGENT_PID # unset
#fenv source '$HOME/ssh_gpg_support.sh'

direnv hook fish | source

gpgconf --launch gpg-agent
eval (ssh-agent -c) > /dev/null
set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)

alias ls="exa"
alias df="lfs"
