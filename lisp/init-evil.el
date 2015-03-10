(require-package 'evil)
(require-package 'evil-surround)
(require-package 'evil-tabs)
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

;; evil-nerd-commenter
(evilnc-default-hotkeys)
(eval-after-load 'evil-nerd-commenter
  '(define-key  evil-normal-state-map "\C-cc" nil))

(add-hook 'emacs-lisp-mode-hook 'evil-paredit-mode)

;; visual-star
(global-evil-visualstar-mode t)

;; terminal-cursor-changer
(unless (display-graphic-p)
  (require 'evil-terminal-cursor-changer))

(setq evil-exchange-key (kbd "zx"))
(setq evil-exchange-cancel-key (kbd "zX"))
(evil-exchange-install)

;;  (define-key evil-normal-state-map " " 'helm-mini)

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

;; Don't move back the cursor one position when exiting insert mode
(setq evil-move-cursor-back nil)

;; Change box colors depending on evil state
(setq evil-emacs-state-cursor '("pink" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

;; Evil-tabs
(global-evil-tabs-mode t)

;; Select last yanked text
(evil-leader/set-key "V" 'exchange-point-and-mark)

(provide 'init-evil)
;;; init-evil.el ends here
