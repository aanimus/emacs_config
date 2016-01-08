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

;;;brackets
(setq c-default-style "linux"
      c-basic-offset 4)

;;Company Mode auto complete
(autoload 'company-mode "company" nil t)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "TAB") 'company-complete)
