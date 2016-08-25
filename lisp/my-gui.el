
;;;LINUM
(global-linum-mode 1)
(setq linum-format "%4d ")
(linum-relative-toggle)
(custom-set-variables
 '(linum-relative-current-symbol ""))

;;;MENU BAR
(menu-bar-mode -1)

(condition-case nil
  (tool-bar-mode -1)
  (error nil))
(condition-case nil
  (scroll-bar-mode -1)
  (error nil))

;;;window system settings
(when t

  (require 'powerline)
  (powerline-default-theme)

  (load-theme 'atom-one-dark t)

  ;(when (eq system-type 'darwin)
  ;  (add-to-list 'default-frame-alist '(alpha 97 97))
  ;  (set-frame-parameter (selected-frame) 'alpha '(97 97)))
  
  (custom-set-faces
   '(mode-line ((t (:foreground "#f9f9f9" :background "#ffa000" :box nil))))
   '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666676" :box nil))))))

;;;FONT
(condition-case nil
    (progn
      (add-to-list 'default-frame-alist
		   '(font . "Inconsolata-15:weight=regular"))
      ;(set-face-attribute 'default t
					;                   :font "Inconsolata-15:weight=regular"))
      )
      (message "kitteh")
  (error nil))
(setq-default line-spacing 2)

;;;LINUM COLOR
(set-face-attribute 'linum nil :foreground "#446")

;;;SCROLL STEP
(setq scroll-step 1)

;;;colors.
(set-face-attribute 'font-lock-type-face nil :foreground "#FF6670")
(set-face-attribute 'font-lock-constant-face nil :foreground "#60ADEB")
(set-face-attribute 'font-lock-function-name-face nil :foreground "#8888EE")
(set-face-attribute 'font-lock-keyword-face nil :foreground "#8888ff")
(set-face-attribute 'font-lock-preprocessor-face nil :foreground "#aa88ff")
(set-face-attribute 'font-lock-string-face nil :foreground "#ddcc66")
(set-face-attribute 'font-lock-variable-name-face nil :foreground "#FF9457")
(set-face-attribute 'font-lock-warning-face nil :foreground "#ff7777")


(setq fgnd "#eebbee")
(setq backgnd "#0a0a19")
(add-to-list 'default-frame-alist '(background-color . backgnd))
(set-face-attribute 'default nil
                    :foreground fgnd
                    :background backgnd)
(set-face-attribute 'fringe nil
                    :background backgnd)

(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))
