;;;;;;;;;;;;;;;;;
;; Programming ;;
;;;;;;;;;;;;;;;;;

;; TAGS
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "ctags -f TAGS -e -R --extra=+fq --exclude=db --exclude=test --exclude=.git --exclude=public --exclude=node_modules %s" (directory-file-name dir-name)))
  )

;; C
(setq-default c-basic-offset 4)
(setq c-default-style "linux" c-basic-offset 4)

;; Javascript
(setq js-indent-level 2)

;; XXX js3-mode
;;(autoload 'js3-mode "js3-mode" nil t)
;;(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))

;; Markdown and gfm-mode for *.md simply
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
;; marked (from npm) as markdown-command
(setq markdown-command "marked")

;; ECB - minibuffer completion bug
;;(require 'ecb)

;; ANSI color and control
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; TODO: Eproject?

