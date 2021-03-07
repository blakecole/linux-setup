
;; Blake's Incredible .emacs Init File

;; Set default mode as text mode (if no extension like .cpp)
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'text-mode-hook-identify)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Display line numbers
(global-linum-mode t)

;; Hide toolbar at top of screen
(tool-bar-mode -1)

;; Recover 'welcome screen' dead-space at bottom of buffer
(setq inhibit-startup-screen t)

(load-theme 'misterioso)
;;(load-theme 'tango)

;; Set default font size (120/10 = 12 pt)
(set-face-attribute 'default nil :height 130)

;; Set default window size
(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '(
              (tool-bar-lines . 0)
	      (vertical-scroll-bars . right)
              (width . 80) ; chars
              (height . 52) ; lines
              (left . 8)
              (top . 42)))
      
      (setq default-frame-alist
            '(
              (tool-bar-lines . 0)
	      (vertical-scroll-bars . right)
              (width . 80)
              (height . 66)
              (left . 50)
              (top . 10))))
  (progn
    (setq initial-frame-alist '( (tool-bar-lines . 0)))
    (setq default-frame-alist '( (tool-bar-lines . 0)))))

;;(split-window-right)
;;(add-to-list 'default-frame-alist '(width . 168))'

;; Prevent extraneous tabs
(setq-default indent-tabs-mode nil)

;; Open Header files (.h) in C++ mode (default: C mode)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)
(global-set-key [home] 'beginning-of-buffer)

;; Always end a file with a newline
(setq require-final-newline t)

;; Stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

;; Set the fill column width - used in auto-filling
(setq fill-column 80)

;; An absolute must-have in my book
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
