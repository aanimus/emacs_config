(add-to-list 'load-path "~/.emacs.d/lisp")

;;;BACKUP DIR
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;;PACKAGE MANAGER
(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(("melpa" . "https://melpa.org/packages/")
                           ("org" . "http://orgmode.org/elpa/")
			   ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("gnu" . "http://elpa.gnu.org/packages/"))))
(package-initialize)

;;;ORG
(require 'evil-org)
(add-to-list 'load-path "~/.emacs.d/org-mode/lisp")
(add-to-list 'load-path "~/.emacs.d/org-mode/contrib/lisp")
(require 'org)

(defun org-remove-headlines (backend)
  "Remove headlines with :no_title: tag."
  (org-map-entries (lambda () (delete-region (point-at-bol) (point-at-eol)))
                   "ign"))
(add-hook 'org-export-before-processing-hook #'org-remove-headlines)

;;;exec path from shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "RUST_SRC_PATH"))

;;;No splash screen
(setq inhibit-splash-screen t)

;;;GUI
(load "my-gui")

;;;KEYS END OF LINE, BEGIN OF LINE
(global-set-key (kbd "<s-right>") 'end-of-line )
(global-set-key (kbd "<s-left>") 'beginning-of-line )

;;;C brackets
(defun my-c-mode-hook ()
  (setq c-basic-offset 4
        c-indent-level 4
        c-default-style "gnu"))
(add-hook 'c-mode-common-hook 'my-c-mode-hook)

;;;JS
(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))
(add-to-list 'load-path "~/.emacs.d/node_modules/tern/emacs")
(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))

;;;Compile key
(global-set-key (kbd "C-c c") 'compile)

;;;YASNIPPET
(yas-global-mode 1)

;;;RUST RACER
(add-hook 'rust-mode-hook 'racer-mode t)
(setq racer-rust-src-path "/Users/serge-olivieramega/Developer/Open/rustc-1.7.0/src/")

;;;FLYCHECK swift
(setq flycheck-swift-sdk-path "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS9.3.sdk")
(with-eval-after-load 'flycheck
  (add-to-list 'flycheck-checkers 'swift))

(add-hook 'go-mode-hook
          (lambda ()
            (setq tab-width 4)
            (setq standard-indent 4)))

;;;EVIL-LEADER
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")

;;;FIND
(defun find-file-here ()
  "locates file in current directory"
  (interactive)
  (find-file "."))
(evil-leader/set-key "f" 'find-file-here)

;;;buffer kill
(evil-leader/set-key "kl" 'kill-this-buffer)

;;;compile
(evil-leader/set-key "cc" 'compile)

;;;EVIL-MODE
(evil-mode 1)

;;;EVIL-MC
(add-to-list 'load-path "~/.emacs.d/evil-mc")
(require 'evil-mc)

(load "autocompletion.el")
(load "ac-analysis-misc.el")
(load "switch-screen.el")

(add-hook 'web-mode-hook (lambda () (setq web-mode-markup-indent-offset 2)))

;;;tab for CS3110
(setq-default indent-tabs-mode nil)

;;;copy/paste
(global-set-key (kbd "s-c") 'clipboard-kill-ring-save)
(global-set-key (kbd "s-v") 'clipboard-yank)

;;;EVIL kbd evil-mc
(global-evil-mc-mode 1)

;;;Key Chord
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map (kbd "jj") 'evil-force-normal-state)
(key-chord-mode 1)

;;;highlight paren
(global-highlight-parentheses-mode)

;;;ido
(ido-mode 'buffers)

;;;Org Mode
(add-hook 'org-mode-hook
          (lambda ()
            (toggle-truncate-lines -1)
            (visual-line-mode 1)))

(setq custom-file "~/.emacs.d/lisp/custom.el")
(load custom-file)
