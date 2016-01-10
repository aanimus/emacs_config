;;;PATH
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setenv "PATH" (concat (getenv "PATH") ":/Applications/Julia-0.4.1.app/Contents/Resources/julia/bin/"))
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/Applications/Julia-0.4.1.app/Contents/Resources/julia/bin/")

;;;BACKUP DIR
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
            `((".*" ,temporary-file-directory t)))

;;;PACKAGE MANAGER
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives
	       '("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(setq inhibit-splash-screen t)

;;;GUI
(load "~/.emacs.d/myGui.el")

;;;KEYS END OF LINE, BEGIN OF LINE
(global-set-key (kbd "<s-right>") 'end-of-line )
(global-set-key (kbd "<s-left>") 'beginning-of-line )

(defun my-c-mode-hook ()
  (setq c-basic-offset 4
        c-indent-level 4
        c-default-style "linux"))
(add-hook 'c-mode-common-hook 'my-c-mode-hook)

;;;Company Mode auto complete
(autoload 'company-mode "company" nil t)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "TAB") 'company-complete)

;;;company cheaders
(with-eval-after-load 'company
   (add-to-list 'company-backends 'company-c-headers))

;;;YASNIPPET
(yas-global-mode 1)

;;;IRONY auto
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;;;IRONY hook
;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
