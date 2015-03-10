(when (maybe-require-package 'flycheck)
  (add-hook 'after-init-hook 'global-flycheck-mode)
  (require-package 'flycheck-pos-tip)

  ;; Override default flycheck triggers
  (setq flycheck-check-syntax-automatically '(save idle-change mode-enabled)
        flycheck-idle-change-delay 0.8)

  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)

  ;; flycheck errors on a tooltip (doesnt work on console)
  (when (display-graphic-p (selected-frame))
    (eval-after-load 'flycheck
      '(custom-set-variables
        '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages))))
  )


(provide 'init-flycheck)
