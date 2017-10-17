;;; package -- Python
;;; Commentary:
;;; Code:

(use-package python
  :mode ("\\.py\\'" . python-mode)
  :config
  (defun vesh/no-hilight-indent ()
    (highlight-indentation-mode 0))
  (add-hook 'python-mode-hook 'vesh/no-hilight-indent))

;;; To enable/disable auto fix PEP8 on save
;;; M-x py-autopep8-enable-on-save or py-autopep8-disable-on-save
(use-package py-autopep8)

(use-package elpy
  :config
  (elpy-enable)
  (with-no-warnings
    ;; (require 'elpy)
    (elpy-use-ipython "ipython"))
  ;;; Forces interpreter args here
  ;;; because elpy-use-ipython sets to `-i' when invoked
  (setq python-shell-interpreter-args "--simple-prompt -i")
  (add-to-list 'python-shell-completion-native-disabled-interpreters "ipython")
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;;; XXX what happen using conda without virtualenvwrapper
;; (require 'virtualenvwrapper)
;; (venv-initialize-interactive-shells) ;; if want interactive shell support
;; (venv-initialize-eshell) ;; if you want eshell support

(use-package conda
  :config
  (progn
    (conda-env-initialize-interactive-shells)
    (conda-env-initialize-eshell)
    (conda-env-autoactivate-mode t)
    (custom-set-variables
     '(conda-anaconda-home "/Users/mini/miniconda3"))))

(use-package ein)

;;;
;;; 2 or 4 space indent, explicitly
;;;

(defun py-set-indent-offset (offset)
  "Set python indent offset to OFFSET."
  (interactive "nOffset: ")
  (setq python-indent-offset offset))

(provide 'vesh_python)
;;; vesh_python.el ends here
