(defconst chezmoi-packages
  '(
    chezmoi)
  "The list of Lisp packages required by the chezmoi layer.")


(defun chezmoi/init-chezmoi ()
  (use-package chezmoi
    :init
    (spacemacs/declare-prefix "f d" "chezmoi")

    (spacemacs/set-leader-keys
      "f d s" #'chezmoi-write
      "f d g" #'chezmoi-magit-status
      "f d d" #'chezmoi-diff
      "f d e" #'chezmoi-ediff
      "f d f" #'chezmoi-find
      "f d i" #'chezmoi-write-files-from-target
      "f d o" #'chezmoi-open-target)


    ;; I find this hook useful for my emacs config files generated through org-tangle.
    ;; (add-hook 'org-babel-post-tangle-hook #'(lambda () (let ((file (buffer-file-name)))
    ;;                                                 (when (string-match-p (expand-file-name "~/.local/share/chezmoi") file)
    ;;                                                   (if (= 0 (shell-command (concat "chezmoi apply --source-path " file)))
    ;;                                                       (message (concat "Chezmoi: Wrote to target " file))
    ;;                                                     (message "Chezmoi: Failed to write file"))))))
    ))
