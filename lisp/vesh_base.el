;;; package --- Boiler plates, not changing mostly
;;; Commentary:
;;; Code:

;;;
;;; MELPA and bootstrap `use-package'
;;;

(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
;; (setq use-package-verbose t)

;;;
;;; Basic / startup / misc
;;;

(setq inhibit-splash-screen t)
(setq initial-scratch-message "")
(setq column-number-mode t)
(setq ring-bell-function #'ignore)
(setq backup-directory-alist `((".*" . ,"~/.emacs.d/backups/")))
(setq auto-save-file-name-transforms `((".*" ,"~/.emacs.d/autosaves/" t)))
;;; comment out while testing `init.el'
;; (desktop-save-mode 1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
;; (delete-selection-mode 1)
(when (and (eq system-type 'darwin) (not window-system)) (menu-bar-mode 0))
(if (functionp 'tool-bar-mode) (tool-bar-mode 0))
;; (add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; (setq initial-frame-alist '((width . 80) (height . 75)))
(when window-system (set-face-attribute 'default nil :height 160))
(use-package help+ :ensure t)

;;;
;;; Themes
;;;

;;; Doom -- best till now for GUI mode
(when window-system
  (use-package doom-themes
    :ensure t
    :config
    (setq doom-themes-enable-bold t)
    (setq doom-themes-enable-italic t)
    (load-theme 'doom-one t)
    (doom-themes-visual-bell-config)
    ;;; corrects (and improves) org-mode's native fontification.
    (doom-themes-org-config)
    ;;; TODO: Instead of depending on windown-system,
    ;;; hook this up when all-the-icons is loaded, how?
    ;;;
    ;;; all-the-icons fonts must be installed!
    (doom-themes-neotree-config)
    (global-hl-line-mode 1)
    (set-face-background 'hl-line "#303030")))

;;; Theme for terminal
(when (not window-system) (load-theme 'tango-dark))

;;;
;;; Keyboard
;;;

;;; To use `cmd' as `meta' in mac osx default terminal,
;;; use Karabiner key map `cmd-x' to `option-x' and
;;; with terminal settings of use `option' as `meta'.
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta))
;;; Key bindings
(global-set-key (kbd "M-RET") 'cua-mode)
(global-set-key (kbd "M-S-<left>") 'windmove-left)
(global-set-key (kbd "M-S-<right>") 'windmove-right)
(global-set-key (kbd "M-S-<up>") 'windmove-up)
(global-set-key (kbd "M-S-<down>") 'windmove-down)

;;;
;;; Mouse
;;;

;;; Wheel scroll when run from terminal
(when (not window-system)
  (xterm-mouse-mode)
  (global-set-key [mouse-4] '(lambda () (interactive) (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda () (interactive) (scroll-up 1))))
;;; Less "jumpy" mouse wheel scroll
(setq mouse-wheel-scroll-amount '(5 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)

;;;
;;; Nyan-cat chasing mouse -- just make sense and love it
;;;

;;; No nyan in terminal mode.
;;; Nyan compete with spaceline buffer-id section
;;; and even win in terminal mode, weired.
(when window-system
  (use-package nyan-mode
    :ensure t
    :config
    (scroll-bar-mode -1)
    (with-no-warnings
      (setq nyan-minimum-window-width 2)
      (setq nyan-animate-nyancat t))
    (nyan-mode)))

;;;
;;; PATH and other environment variables by sourcing .bashrc or .profile
;;;

(when (memq window-system '(mac ns)) (exec-path-from-shell-initialize))
(let ((evars '("DYLD_LIBRARY_PATH" "JAVA_HOME" "HADOOP_HOME"
               "PYTHONPATH" "NODE_PATH" "EVAR2"))
      ($evars nil) ($eargs nil) ($shcmd "") ($evals nil)) ; temp for easy read
  (setq $evars (mapcar (lambda (x) (concat "$" x)) evars))
  (setq $eargs (mapconcat 'identity $evars "\"\\n\""))
  (setq $shcmd (concat ". ~/.bashrc; echo -e " $eargs))
  (setq $evals (split-string (shell-command-to-string $shcmd) "\n"))
  (-zip-with (lambda (evar eval) (setenv evar eval)) evars $evals))
(setenv "LANG" "ko_KR.UTF-8")


;;;
;;; Better mode lines
;;;

;;; Spaceline + all-the-icons = spaceline-all-the-icons
(when window-system
  (use-package all-the-icons
    :ensure t)
  (require 'spaceline-config)
  (with-no-warnings
    ;; (spaceline-spacemacs-theme) ; for new mode line items
    (spaceline-helm-mode)
    (spaceline-info-mode))
  (use-package spaceline-all-the-icons
    :ensure t
    :config
    (with-no-warnings
      ;;; Adjust on/off, t/nil, ... for space for nyan
      (setq spaceline-all-the-icons-mode-icon-p t)
      (setq spaceline-all-the-icons-separator-type 'none)
      (setq spaceline-all-the-icons-flycheck-alternate t)
      (setq spaceline-all-the-icons-secondary-separator "")
      (setq spaceline-all-the-icons-hide-long-buffer-path t)
      (spaceline-toggle-all-the-icons-buffer-size-off)
      (spaceline-toggle-all-the-icons-projectile-off)
      (spaceline-toggle-all-the-icons-region-info-off)
      (spaceline-toggle-all-the-icons-hud-off)
      (spaceline-toggle-all-the-icons-time-off)
      ;;; These are somewhat precious for nyan
      (spaceline-toggle-all-the-icons-buffer-path-off)
      (spaceline-toggle-all-the-icons-vc-icon-off)
      (spaceline-toggle-all-the-icons-vc-status-off))
    (spaceline-all-the-icons-theme))) ; for new mode line items

;;; Smart mode line -- for terminal
(when (not window-system)
  (use-package smart-mode-line
    :ensure t
    :config
    (with-no-warnings
      (setq sml/no-confirm-load-theme t)
      (setq sml/theme 'respectful))
    (sml/setup)))

;;;
;;; Helm, Projectile - cruise control
;;;

(use-package helm
  :ensure t
  :init (let ((ad-redefinition-action 'accept)))
  :bind (("C-c h" . helm-command-prefix)
         ("M-x" . helm-M-x)
         ("C-x b" . helm-mini)
         ("C-x C-f" . helm-find-files))
  :config (helm-mode 1))
;;; helm defined this key? prone to unwanted exit emacs .
(global-unset-key (kbd "C-x c"))
;; (projectile-global-mode)
;; (setq projectile-completion-system 'helm)
;; (helm-projectile-on)

;;;
;;; Whitespace trimming
;;;

;;; can `use-package' for a local file,
;;; but do not use `ensure' for those.
(use-package ws-trim
  :functions global-ws-trim-mode
  :config
  (global-ws-trim-mode t)
  (set-default 'ws-trim-level 1)
  (with-no-warnings
    (setq ws-trim-global-modes '(guess (not message-mode eshell-mode)))))

;;;
;;; Neotree
;;;

(use-package neotree
  :ensure t
  :config
  ;; (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq neo-theme 'nerd)
  (setq neo-toggle-window-keep-p t)
  (setq neo-window-width 30)
  (setq neo-window-fixed-size nil)
  (global-set-key [f8] 'neotree-toggle)
  (global-set-key (kbd "C-x t") 'neotree-toggle))

;;;
;;; org-mode
;;;

(use-package org
  :ensure t
  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c b" . org-iswitchb)))
;;; this will grow much ...

;;;
;;; Etc packages nowhere belongs and easy to config
;;;

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))
(use-package
  browse-url :ensure t)

(provide 'vesh_base)
;;; vesh_base.el ends here
