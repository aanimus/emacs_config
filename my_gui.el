
(global-linum-mode 1)
(setq linum-format "%4d ")
(menu-bar-mode -1)

(condition-case nil
  (tool-bar-mode -1)
  (error nil))
(condition-case nil
  (scroll-bar-mode -1)
  (error nil))

;;;window system settings
(when window-system

  (require 'powerline)
  (powerline-default-theme)

  (custom-set-faces
   '(mode-line ((t (:foreground "#f9f9f9" :background "#ffa000" :box nil))))
   '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666676" :box nil)))))

  (load-theme 'atom-one-dark t))

;;;FONT
(condition-case nil
    (progn
      (add-to-list 'default-frame-alist
		   '(font . "Inconsolata-15:weight=bold"))
      (set-face-attribute 'default t :font "Inconsolata-15:weight=bold"))
(error nil))
(setq-default line-spacing 2)

;;;LINUM COLOR
(set-face-attribute 'linum nil :foreground "#446")

;;;SCROLL STEP
(setq scroll-step 1)

;;;colors.
(set-face-attribute 'font-lock-type-face nil :foreground "#C678DD")
(set-face-attribute 'font-lock-constant-face nil :foreground "#60ADEB")
(set-face-attribute 'font-lock-function-name-face nil :foreground "#8888EE")
(set-face-attribute 'font-lock-keyword-face nil :foreground "#8888ff")
(set-face-attribute 'font-lock-preprocessor-face nil :foreground "#aa88ff")
(set-face-attribute 'font-lock-string-face nil :foreground "#ddcc66")
(set-face-attribute 'font-lock-variable-name-face nil :foreground "#ee7777")
(set-face-attribute 'font-lock-warning-face nil :foreground "#ff7777")
