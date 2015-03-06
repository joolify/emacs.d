(require-package 'google-this)
(require-package 'google-translate)

(google-this-mode 1)
(global-set-key "\C-ct" 'google-translate-at-point)
(global-set-key "\C-cT" 'google-translate-query-translate)

(provide 'init-google)
