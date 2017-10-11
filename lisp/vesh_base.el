;;; package --- Boiler plates, not changing mostly
;;; Commentary:
;;; Code:

;; MELPA
(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-verbose t)

;;;
;;; Basic/Startup UI
;;;

(if (functionp 'tool-bar-mode) (tool-bar-mode 0))
(setq inhibit-splash-screen t)
(setq initial-scratch-message "")
(setq column-number-mode t)
;; (add-to-list 'initial-frame-alist '(fullscreen . maximized))
(setq initial-frame-alist '((width . 80) (height . 75)))
(setq ring-bell-function #'ignore)
(when (not window-system)
  (load-theme 'tango-dark)
  (enable-theme 'tango-dark))
(when window-system
  (set-face-attribute 'default nil :height 180))

;;;
;;; Keyboard
;;;

;; Mac OS X darwin and in window-system
(when (and (eq system-type 'darwin) (eq window-system 'ns))
  (setq mac-command-modifier 'meta))
;; Key bindings
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)
(global-set-key (kbd "M-RET") 'cua-mode)
;; Windmove
(global-set-key (kbd "M-S-<left>") 'windmove-left)
(global-set-key (kbd "M-S-<right>") 'windmove-right)
(global-set-key (kbd "M-S-<up>") 'windmove-up)
(global-set-key (kbd "M-S-<down>") 'windmove-down)

;;;
;;; Mouse
;;;

;; Wheel scrol when run from terminal
(when (not window-system)
  (xterm-mouse-mode)
  (global-set-key [mouse-4] '(lambda () (interactive) (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda () (interactive) (scroll-up 1))))
;; Less "jumpy" mouse wheel scroll
(setq mouse-wheel-scroll-amount '(5 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)

;;; Rich UI
(use-package spacemacs-dark-theme)
;;; Too much?
;; (when window-system
;;   (use-package all-the-icons)
;;   (use-package spaceline-config)
;;   ;; (spaceline-spacemacs-theme)
;;   (use-package spaceline-all-the-icons
;;     :after spaceline
;;     :config
;;     (progn
;;       (spaceline-all-the-icons-theme)
;;       (spaceline-helm-mode)
;;       (spaceline-info-mode))))
;;; More tidy than default mode-line, less luxury than all-the-icons
(use-package smart-mode-line
  :init
  (progn
    (setq sml/theme 'dark)
    (setq sml/no-confirm-load-theme t))
  :config (sml/setup))
;;; Eye-toy nyan
(use-package nyan-mode
  :init (progn (when window-system (scroll-bar-mode -1)))
  :config (nyan-mode))

;;; PATH and other environment variables by sourcing .bashrc or .profile
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
(let ((evars '("DYLD_LIBRARY_PATH"
               "JAVA_HOME" "HADOOP_HOME"
               "PYTHONPATH" "NODE_PATH")))
  (setq echovars (mapcar (lambda (x) (concat "$" x)) evars))
  (setq echoargs (mapconcat 'identity echovars "\"\\n\""))
  (setq shellcmd (concat ". ~/.bashrc; echo -e " echoargs))
  (setq evals (split-string (shell-command-to-string shellcmd) "\n"))
  (-zip-with (lambda (evar eval) (message "%s=%s" evar eval)) evars evals)
  (-zip-with (lambda (evar eval) (setenv evar eval)) evars evals))
(setenv "LANG" "ko_KR.UTF-8")

;;; Autosave and files backup files in ~/.emacs.d/.
(setq backup-directory-alist `((".*" . ,"~/.emacs.d/backups/")))
(setq auto-save-file-name-transforms `((".*" ,"~/.emacs.d/autosaves/" t)))
;;; |Delete selection|_ not including  point _
(delete-selection-mode 1)
;;; No tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
;;; Whitespace trimming
(use-package ws-trim
  :config
  (progn
    (global-ws-trim-mode t)
    (set-default 'ws-trim-level 1)
    (defvar ws-trim-global-modes)
    (setq ws-trim-global-modes '(guess (not message-mode eshell-mode)))))

;;;
;;; Helm, Ido, Projectile - cruise control
;;;

(use-package helm
  :diminish helm-mode
  :init (let ((ad-redefinition-action 'accept)))
  :bind (("C-c h" . helm-command-prefix)
         ("M-x" . helm-M-x)
         ("C-x b" . helm-mini)
         ("C-x C-f" . helm-find-files))
  :config (helm-mode 1))
(global-unset-key (kbd "C-x c")) ;; Prone to un-wanted exit emacs
;;;
;; (projectile-global-mode)
;; (setq projectile-completion-system 'helm)
;; (helm-projectile-on)

(use-package magit
  :bind (("C-x g" . magit-status)))

(use-package browse-url)

(provide 'vesh_base)
;;; vesh_base.el ends here
