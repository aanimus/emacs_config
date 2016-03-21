;;;PATH
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setenv "PATH" (concat (getenv "PATH") ":/Applications/Julia-0.4.1.app/Contents/Resources/julia/bin/"))
(setenv "PATH" (concat (getenv "PATH") ":~/Developer/utils"))
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "~/Developer/utils")
(add-to-list 'exec-path "/Applications/Julia-0.4.1.app/Contents/Resources/julia/bin/")

;;;BACKUP DIR
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
            `((".*" ,temporary-file-directory t)))

;;;PACKAGE MANAGER
(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(
			   ("melpa" . "https://melpa.org/packages/")
			   ("marmalade" . "http://marmalade-repo.org/packages/"))))
(package-initialize)

(setq inhibit-splash-screen t)

;;;GUI
(load "~/.emacs.d/my_gui.el")

;;;KEYS END OF LINE, BEGIN OF LINE
(global-set-key (kbd "<s-right>") 'end-of-line )
(global-set-key (kbd "<s-left>") 'beginning-of-line )

;;;C brackets
(defun my-c-mode-hook ()
  (setq c-basic-offset 4
        c-indent-level 4
        c-default-style "linux"))
(add-hook 'c-mode-common-hook 'my-c-mode-hook)

;;ruby indent
(setq ruby-indent-level 4)

;;;JS
(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))
(add-to-list 'load-path "~/.emacs.d/node_modules/tern/emacs")
(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))

;;;Company Mode auto complete
(autoload 'company-mode "company" nil t)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "C-SPC") 'company-complete)

;;;YASNIPPET
(yas-global-mode 1)

;;;NEO-TREE
;;;f8 for neotree
(add-to-list 'load-path "~/.emacs.d/neotree/")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

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

;;;COMPANY-BACKENDS
(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-irony)
  (add-to-list 'company-backends 'company-tern)
  (add-to-list 'company-backends 'company-sourcekit)
  (add-to-list 'company-backends 'merlin-company-backend)
  (global-set-key (kbd "C-c C-SPC") 'company-yasnippet))

;;;company-c-headers
(require 'company-c-headers)
(global-set-key (kbd "C-x C-SPC") 'company-c-headers )
(add-to-list 'company-c-headers-path-system "/usr/local/Cellar/llvm/3.6.2/include/c++/v1")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;OCAML
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Add opam emacs directory to the load-path
(setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
;; Load merlin-mode
(require 'merlin)
;; Start merlin on ocaml files
(add-hook 'tuareg-mode-hook 'merlin-mode t)
(add-hook 'caml-mode-hook 'merlin-mode t)
;; Enable auto-complete
;;;(setq merlin-use-auto-complete-mode 'easy)
;; Use opam switch to lookup ocamlmerlin binary
(setq merlin-command 'opam)

;;;EVIL-MODE
(evil-mode 1)

;;;EVIL-MC
(add-to-list 'load-path "~/.emacs.d/evil-mc")
(require 'evil-mc) 

;;;tab for CS3110
(setq-default indent-tabs-mode nil)
(setq tab-width 4)

(global-set-key (kbd "C-x c") 'clipboard-kill-region)
(global-set-key (kbd "C-x v") 'clipboard-yank)

;;;LOCATE BINDING C-c l
(add-hook 'merlin-mode-hook
          (lambda () (local-set-key (kbd "C-c l") 'merlin-locate) ))

;;;undo/redo
(global-set-key (kbd "s-z") 'undo-tree-undo)
(global-set-key (kbd "s-r") 'undo-tree-redo)

;;;buffer kill
(global-set-key (kbd "s-k") 'kill-this-buffer)

;;;copy/paste
(global-set-key (kbd "s-c") 'clipboard-kill-ring-save)
(global-set-key (kbd "s-v") 'clipboard-yank)

(defun locate-symbol-at-point ()
  "locates symbol at current point"
  (interactive)
  (cond ((bound-and-true-p irony-mode) (rtags-find-symbol-at-point))
        ((bound-and-true-p merlin-mode) (merlin-locate))
        (t (message "cannot locate in this mode"))))

(defun show-symbol-type-at-point ()
  "shows type for symbol at current point"
  (interactive)
  (cond ((bound-and-true-p irony-mode) (rtags-symbol-type))
        ((bound-and-true-p merlin-mode) (merlin-type-enclosing))
        (t (message "cannot find symbol type for this mode."))))


(defun show-symbol-info-at-point ()
  "shows type for symbol at current point"
  (interactive)
  (cond ((bound-and-true-p irony-mode) (rtags-print-symbol-info))
        ((bound-and-true-p merlin-mode) (merlin-type-enclosing))
        (t (message "cannot find symbol info for this mode."))))

(defun show-symbol-summary-at-point ()
  "shows type for symbol at current point"
  (interactive)
  (cond ((bound-and-true-p irony-mode) (rtags-display-summary))
        ((bound-and-true-p merlin-mode) (merlin-type-enclosing))
        (t (message "cannot find symbol summary for this mode."))))

;;;EVIL keybindings
(define-key evil-normal-state-map (kbd "gl") 'locate-symbol-at-point)
(define-key evil-normal-state-map (kbd "gt") 'show-symbol-type-at-point)
(define-key evil-normal-state-map (kbd "g[") 'show-symbol-info-at-point)
(define-key evil-normal-state-map (kbd "g]") 'show-symbol-summary-at-point)


;;g p --> rtags prev
;;g o --> rtags next


;;;highlight paren
(highlight-parentheses-mode)
;;;ido
(ido-mode 'buffers)

;;;cmake-ide
;(add-to-list 'load-path "~/.emacs.d/cmIDE/cmake-ide/")
;(require 'cmake-ide)
;(cmake-ide-setup)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;Other stuff:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1b1e54d9e0b607010937d697556cd5ea66ec9c01e555bb7acea776471da59055" "47ac4658d9e085ace37e7d967ea1c7d5f3dfeb2f720e5dec420034118ba84e17" "beeb5ac6b65fcccfe434071d4624ff0308b5968bf2f0c01b567d212bcaf66054" "705f3f6154b4e8fac069849507fd8b660ece013b64a0a31846624ca18d6cf5e1" "e87a2bd5abc8448f8676365692e908b709b93f2d3869c42a4371223aab7d9cf8" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:foreground "#f9f9f9" :background "#6666e6" :box nil))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666676" :box nil)))))
