
;;;Company Mode initialize
(autoload 'company-mode "company" nil t)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "C-SPC") 'company-complete)


;;;company-c-headers
(require 'company-c-headers)
(global-set-key (kbd "C-x C-SPC") 'company-c-headers )
(add-to-list 'company-c-headers-path-system "/usr/local/Cellar/llvm/3.6.2/include/c++/v1")


;;;COMPANY-BACKENDS
(require 'rtags)
(require 'company-sourcekit)
(require 'company-go)
(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-go)
  ;(add-to-list 'company-backends 'company-irony)
  (add-to-list 'company-backends 'company-rtags)
  (add-to-list 'company-backends 'company-sourcekit)
  (add-to-list 'company-backends 'merlin-company-backend)
  (add-to-list 'company-backends 'company-css)
  (add-to-list 'company-backends 'company-tern)
  (global-set-key (kbd "C-c C-SPC") 'company-yasnippet))


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


