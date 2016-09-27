;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Boiler plates, not changing mostly               ;;
;; Better not depend on packages (elpa, melpa, ...) ;;
;; Some local self contained lisps are OK           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Startup UI
(if (functionp 'tool-bar-mode) (tool-bar-mode 0))
(setq inhibit-splash-screen t)
(setq initial-scratch-message "")
(setq column-number-mode t)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; Key bindings
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)
(global-set-key (kbd "M-RET") 'cua-mode)
;; Less "jumpy" mouse wheel scroll
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)
;; Some conditionally
(when (not window-system)
  (xterm-mouse-mode))
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta))
;; Local lisps
(add-to-list 'load-path "~/.emacs.d/lisp/")
;; Autosave and files backup files in ~/.emacs.d/.
(setq backup-directory-alist `((".*" . ,"~/.emacs.d/backups/")))
(setq auto-save-file-name-transforms `((".*" ,"~/.emacs.d/autosaves/" t)))
;; No tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
;; Whitespace trim
(require 'ws-trim)
(global-ws-trim-mode t)
(set-default 'ws-trim-level 1)
(setq ws-trim-global-modes '(guess (not message-mode eshell-mode)))
