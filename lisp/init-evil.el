(require-package 'evil)
(require-package 'evil-surround)
(require-package 'evil-matchit)
(require-package 'evil-nerd-commenter)

(evil-mode 1)
(global-evil-surround-mode 1)
(evilnc-default-hotkeys)

(provide 'init-evil)
;;; init-evil.el ends here
