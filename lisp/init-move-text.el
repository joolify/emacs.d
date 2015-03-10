(require-package 'move-text)

(global-set-key (kbd "C-ä") 'move-text-up)
(global-set-key (kbd "C-ö") 'move-text-down)
(move-text-default-bindings)


(provide 'init-move-text)
