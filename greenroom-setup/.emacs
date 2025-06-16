;; Blake's Incredible .emacs Init File
;; ~/.emacs

;; 1) Default to text-mode when no other mode matches
(setq-default major-mode 'text-mode)

;; 2) Show line numbers everywhere
(when (fboundp 'global-display-line-numbers-mode)
  (global-display-line-numbers-mode))

;; 3) Hide the toolbar
(tool-bar-mode -1)

;; 4) Disable the startup “splash” so you get the full buffer
(setq inhibit-startup-screen t)

;; 5) Load a pleasant theme: uncomment the one you prefer
(load-theme 'misterioso t)
;; (load-theme 'tango t)

;; 6) Set default font size to 12 pt (height is in 1/10 pt)
(set-face-attribute 'default nil :height 120)

;; 7) Default frame appearance & size
(setq initial-frame-alist
      '((tool-bar-lines       . 0)          ; no toolbar
        (vertical-scroll-bars . right)      ; scrollbar on the right
        (width                . 80)         ; 80 chars wide
        (height               . 70)         ; 60 lines tall
        (left                 . 0)          ; top-left corner
        (top                  . 0)))
;; Apply same settings to every new frame
(setq default-frame-alist initial-frame-alist)

;; Make sure scroll-bar-mode is on
(scroll-bar-mode 1)

;; 8) Never insert literal TAB characters
(setq-default indent-tabs-mode nil)

;; 9) Treat “.h” files as C++ headers
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; 10) Make both Delete keys do forward-delete
(global-set-key [delete]       'delete-char)
(global-set-key (kbd "<kp-delete>") 'delete-char)

;; 11) Bind C-z to undo (instead of iconify)
(global-set-key (kbd "C-z")    'undo)

;; 12) Bind Alt-w (Opt-w) to copy (kill-ring-save)
(global-set-key (kbd "M-w")    'kill-ring-save)

;; Super-w (Start/Win + w) copies the region
(global-set-key (kbd "s-w") 'kill-ring-save)

;; 13) Always ensure files end with a newline
(setq require-final-newline t)

;; 14) Don’t auto-create new lines past EOF
(setq next-line-add-newlines nil)

;; 15) Wrap text at column 80 by default
(setq-default fill-column 80)

;; An absolute must-have in my (mikerb) book
(define-key ctl-x-map "\C-b" 'electric-buffer-list)

(define-key esc-map "g" 'goto-line)

(global-set-key "\M-t" 'beginning-of-buffer)
(global-set-key "\M-b" 'end-of-buffer)
(global-set-key "\M-i" 'overwrite-mode)

(defun scroll-one-line-ahead ()
  "Scroll ahead one line."
  (interactive)
  (scroll-up 1))

(defun scroll-one-line-behind ()
  "Scroll behind one line."
  (interactive)
  (scroll-down 1))

;; Useful for toggling between .h and .cpp files of a C++ class
(global-set-key (kbd "M-o") 'ff-find-other-file)

(global-set-key [M-down] 'scroll-one-line-ahead)
(global-set-key [M-up]   'scroll-one-line-behind)
