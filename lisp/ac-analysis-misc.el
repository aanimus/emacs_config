(require 'rtags)

(add-hook 'c++-mode-hook
          (lambda ()
            (setq-local is-cpp-buffer t)
            (message "c++ mode")))

(defun show-symbol-info-at-point ()
  "shows type for symbol at current point"
  (interactive)
  (cond ((eq major-mode 'c++-mode) (rtags-print-symbol-info))
        ((eq major-mode 'merlin-mode) (merlin-type-enclosing))
        ((eq major-mode 'go-mode) (godoc-at-point))
        (t (message "cannot find symbol info for this mode."))))

(defun locate-symbol-at-point ()
  "locates symbol at current point"
  (interactive)
  (cond ((eq major-mode 'c++-mode) (rtags-find-symbol-at-point))
        ((eq major-mode 'merlin-mode) (merlin-locate))
        ((eq major-mode 'go-mode) (godef-jump))
        (t (message "cannot locate in this mode"))))

(defun show-symbol-type-at-point ()
  "shows type for symbol at current point"
  (interactive)
  (cond ((eq major-mode 'c++-mode) (rtags-symbol-type))
        ((eq major-mode 'merlin-mode) (merlin-type-enclosing))
        ((eq major-mode 'go-mode) (godef-describe))
        (t (message "cannot find symbol type for this mode."))))

(defun show-symbol-summary-at-point ()
  "shows type for symbol at current point"
  (interactive)
  (cond ((eq major-mode 'c++-mode) (rtags-display-summary))
        ((eq major-mode 'merlin-mode) (merlin-type-enclosing))
        ((eq major-mode 'go-mode) (godef-describe))
        (t (message "cannot find symbol summary for this mode."))))

;;;Keybindings
(evil-leader/set-key "ri" 'show-symbol-info-at-point)
(evil-leader/set-key "rj" 'locate-symbol-at-point)
(evil-leader/set-key "rt" 'show-symbol-type-at-point)
(evil-leader/set-key "rs" 'show-symbol-summary-at-point)
