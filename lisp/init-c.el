(require-package 'irony)
(require-package 'google-c-style)

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'c-mode-common-hook 'google-set-c-style)

  ;; replace the `completion-at-point' and `complete-symbol' bindings in
    ;; irony-mode's buffers by irony-mode's asynchronous function
    (defun my-irony-mode-hook ()
      (define-key irony-mode-map [remap completion-at-point]
        'irony-completion-at-point-async)
      (define-key irony-mode-map [remap complete-symbol]
        'irony-completion-at-point-async))
    (add-hook 'irony-mode-hook 'my-irony-mode-hook)

    ;; Only needed on Windows
    (when (eq system-type 'windows-nt)
      (setq w32-pipe-read-delay 0))

(provide 'init-c)
;;; init-c.el ends here
