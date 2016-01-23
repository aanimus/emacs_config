(set-frame-parameter nil 'fullscreen 'fullboth) ;fullscreen

(global-linum-mode 1)
(setq linum-format "%4d ")
(menu-bar-mode -1)

(condition-case nil
  (tool-bar-mode -1)
  (error nil))
(condition-case nil
  (scroll-bar-mode -1)
  (error nil))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("47ac4658d9e085ace37e7d967ea1c7d5f3dfeb2f720e5dec420034118ba84e17" default))
   (quote
    ("705f3f6154b4e8fac069849507fd8b660ece013b64a0a31846624ca18d6cf5e1" "47ac4658d9e085ace37e7d967ea1c7d5f3dfeb2f720e5dec420034118ba84e17" default))))

;;;window system settings
(when window-system

  (load-theme 'atom-one-dark t)

  (add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline/")
  (require 'powerline)

  (custom-set-faces
   '(mode-line ((t (:foreground "#f9f9f9" :background "#6666e6" :box nil))))
   '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666676" :box nil)))))
  )

;;;FONT
(add-to-list 'default-frame-alist
	     '(font . "Inconsolata-16"))
(set-face-attribute 'default t :font "Inconsolata-16")

;;;LINUM COLOR
(set-face-attribute 'linum nil :foreground "#667066")
