(require-package 'helm)
(require-package 'helm-flycheck)
(require-package 'helm-google)
(require-package 'helm-projectile)
(require-package 'helm-ag)
(require-package 'helm-spotify)
(require-package 'ac-helm)
(load "/Users/joel-hem/\.emacs\.d/elpa/helm-20150222.2156/helm-config")


(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

;; helm-auto-complete
(global-set-key (kbd "C-:") 'ac-complete-with-helm)
(define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm)

;; helm-M-x
(global-set-key (kbd "M-x") 'helm-M-x)

;; helm-show-kill-ring
(global-set-key (kbd "C-x y") 'helm-show-kill-ring)

;; helm-mini
(global-set-key (kbd "C-x b") 'helm-mini)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

;; helm-buffers-list
(global-set-key (kbd "C-x C-b") #'helm-bufferslist)

;; helm-recentf
(global-set-key (kbd "C-x C-r") #'helm-recentf)

;; helm-filtered-bookmarks
(global-set-key (kbd "C-x r l") #'helm-filtered-bookmarks)

;; helm-find-files
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; helm-ff-do-grep
(when (executable-find "ack-grep")
  (setq helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
        helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f"))

;; helm-semantic-or-imenu
(setq helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match    t)

;; helm-man-woman
(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

;; helm-occur
(global-set-key (kbd "C-c h o") 'helm-occur)

;; helm-apropos
(setq helm-apropos-fuzzy-match t)

;; helm-all-mark-rings
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)

;; helm-register
(global-set-key (kbd "C-c h x") 'helm-register)

;; helm-flycheck
(eval-after-load 'flycheck
  '(define-key flycheck-mode-map (kbd "C-c ! h") 'helm-flycheck))

;; helm-google
(global-set-key (kbd "C-h C--") 'helm-google)


;; Configuration
(require 'helm-config)
(helm-mode t)
(helm-adaptative-mode t)

;; helm-projectile
(setq projectile-completion-system 'helm)
(setq helm-projectile-sources-list (cons 'helm-source-projectile-files-list
                                         (remove 'helm-source-projectile-files-list
                                              helm-projectile-sources-list)))
(helm-projectile-on)

(define-key projectile-mode-map (kbd "C-c p /")
  #'(lambda ()
      (interactive)
      (helm-ag (projectile-project-root))))


(provide 'init-helm)
;;; init-helm.el ends here
