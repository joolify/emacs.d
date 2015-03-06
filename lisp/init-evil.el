(require-package 'evil)
(require-package 'evil-surround)
(require-package 'evil-matchit)
(require-package 'evil-nerd-commenter)
(require-package 'evil-iedit-state)
(require-package 'evil-leader)
(require-package 'evil-org)
(require-package 'evil-paredit)
(require-package 'evil-terminal-cursor-changer)
(require-package 'evil-visualstar)
(require-package 'evil-exchange)

(evil-mode 1)
(global-evil-surround-mode 1)
(evilnc-default-hotkeys)

(add-hook 'emacs-lisp-mode-hook 'evil-paredit-mode)

;; visual-star
(global-evil-visualstar-mode t)

;; terminal-cursor-changer
(unless (display-graphic-p)
  (require 'evil-terminal-cursor-changer))

(setq evil-exchange-key (kbd "zx"))
(setq evil-exchange-cancel-key (kbd "zX"))
(evil-exchange-install)

(provide 'init-evil)
;;; init-evil.el ends here
