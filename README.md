My dotfiles managed by [chezmoi](https://www.chezmoi.io/).

Need manual checkouts, maybe with submodules?:

- ~/.tmux/plugins : https://github.com/tmux-plugins/tpm
- ~/.local/share/omf : https://github.com/oh-my-fish/oh-my-fish

Emacs/chezmoi integration:

```bash
cd ~/.var/app/org.gnu.emacs/data/
ln -s ~/.local/share/chezmoi/ .
```
