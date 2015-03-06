(require-package 'ace-jump-mode)
(require-package 'ace-isearch)
(require-package 'ace-jump-buffer)
(require-package 'ace-window)

(global-ace-isearch-mode +1)

(custom-set-variables
 '(ace-isearch-input-length 4)
 '(ace-isearch-input-idle-delay 0.3)
 '(ace-isearch-submode 'ace-jump-char-mode)
 '(ace-isearch-use-ace-jump 'printing-char))

(ace-isearch-set-ace-jump-after-isearch-exit t)

(global-set-key (kbd "M-å") 'ace-jump-buffer)

(global-set-key (kbd "C-x o") 'ace-window)


;; (define-key swoop-map (kbd "C-s") 'swoop-action-goto-line-next)
;; (define-key swoop-map (kbd "C-r") 'swoop-action-goto-line-prev)

(provide 'init-ace)
;;; init-ace.el ends here
