;;; package --- Programming general
;;; Commentary:
;;; Programming related but not limited to specific language
;;; Code:

;; TAGS
(defun create-tags (dir-name)
  "Create tags file in DIR-NAME directory."
  (interactive "DDirectory: ")
  (shell-command
   (format "ctags -f TAGS -e -R --extra=+fq --exclude=db --exclude=test --exclude=.git --exclude=public --exclude=node_modules %s" (directory-file-name dir-name))))

(use-package flycheck
  :init (global-flycheck-mode)
  :config (setq flycheck-flake8rc ".flake8"))

;; C
(defvar c-default-style)
(defvar c-basic-offset)
(setq-default c-basic-offset 4)
(setq c-default-style "linux" c-basic-offset 4)

;; Javascript
(defvar js-indent-level)
(setq js-indent-level 2)

;;; XXX js3-mode
;; (autoload 'js3-mode "js3-mode" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))

;;; Markdown and gfm-mode for *.md simply
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
;;; Tried multimarkdown/supermarkdown/kramed/pandoc ...
;;; as markdown-command for latex math support. Settled with pandoc
(defvar markdown-command)
(setq markdown-command "pandoc -s -t html --mathjax --css ~/gh-dashed.css")

;;; ECB - minibuffer completion bug
;; (require 'ecb)

;;; ANSI color and control
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  "Colorize compilation buffer with ansi color coded."
  (read-only-mode 1)
  (defvar compilation-filter-start)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (read-only-mode 0))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; TODO: Eproject?

;; Avoid flycheck error messages irritating minibuffer too much
;; (defun flycheck-display-error-messages-unless-error-buffer (errors)
;;   (unless (get-buffer-window flycheck-error-list-buffer)
;;     (flycheck-display-error-messages errors)))
;; (defun flycheck-display-error-messages-unless-error-buffer (errors)
;;   (unless (get-buffer-window flycheck-error-list-buffer)
;;     (flycheck-display-error-messages 'flycheck-detected-errors)))
;; (defun flycheck-display-error-messages-unless-error-buffer (errors)
;;   (unless (get-buffer-window flycheck-error-message-buffer)
;;     (flycheck-display-error-messages errors)))
;; (setq flycheck-display-errors-function
;;       #'flycheck-display-error-messages-unless-error-buffer)

(provide 'vesh_prog)
;;; vesh_prog.el ends here
