;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Boiler plates, not changing mostly               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Startup UI
(if (functionp 'tool-bar-mode) (tool-bar-mode 0))
(setq inhibit-splash-screen t)
(setq initial-scratch-message "")
(setq column-number-mode t)
(setq initial-frame-alist '((width . 132) (height . 54)))
(setq ring-bell-function #'ignore)

;; Key bindings
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)
(global-set-key (kbd "M-RET") 'cua-mode)
;; Windmove
(global-set-key (kbd "M-S-<left>") 'windmove-left)
(global-set-key (kbd "M-S-<right>") 'windmove-right)
(global-set-key (kbd "M-S-<up>")    'windmove-up)
(global-set-key (kbd "M-S-<down>") 'windmove-down)
;; Less "jumpy" mouse wheel scroll
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)

;; Some conditionally
(when (not window-system)
  (xterm-mouse-mode)
  (global-set-key [mouse-4] '(lambda () (interactive) (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda () (interactive) (scroll-up 1)))
  (setq mouse-sel-mode t))
;; -- Disable for muscle memory
;; XXX: darwin and in window-system
(when (and (eq system-type 'darwin) (eq window-system 'ns))
  (setq mac-command-modifier 'meta))

;; Autosave and files backup files in ~/.emacs.d/.
(setq backup-directory-alist `((".*" . ,"~/.emacs.d/backups/")))
(setq auto-save-file-name-transforms `((".*" ,"~/.emacs.d/autosaves/" t)))

;;
(delete-selection-mode 1)

;; No tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Whitespace trim
(require 'ws-trim)
(global-ws-trim-mode t)
(set-default 'ws-trim-level 1)
(setq ws-trim-global-modes '(guess (not message-mode eshell-mode)))

;; Helm and Projectile
(helm-mode 1)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
(require 'magit-gh-pulls)
(add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Using shell, term, eshell ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Eshell path
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Enviroment variables from .bashrc or .profile
(when (not window-system)
  (let ((evars (split-string (shell-command-to-string ". ~/.bashrc; echo $JAVA_HOME v_v $NODE_PATH v_v $HADOOP_HOME") " v_v " t)))
    (setenv "JAVA_HOME" (pop evars))
    (setenv "NODE_PATH" (pop evars))
    (setenv "HADOOP_HOME" (pop evars))))
