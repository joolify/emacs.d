(require 'cl)

(defun my:align-by-space(BEG END)
  (interactive "r")
  (align-regexp BEG END "\\(\\s-*\\) " 1 0 1)
  )

;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))


(defun close-all-buffers ()
  (interactive)
  (loop for buffer being the buffers
     do (kill-buffer buffer)))

(provide 'init-snippets)
