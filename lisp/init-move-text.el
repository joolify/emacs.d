(require-package 'move-text)

(move-text-default-bindings)

(global-set-key "ä" 'move-text-up)
(global-set-key "ö" 'move-text-down)

(provide 'init-move-text)
