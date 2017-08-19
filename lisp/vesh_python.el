;; Python

(require 'python)

(elpy-enable)
(elpy-use-ipython)
;; Forces interpreter args here
;; because elpy-use-ipython sets to `-i' when invoked
;; (setq python-shell-interpreter "ipython3")
(setq python-shell-interpreter-args "--simple-prompt -i")
(add-to-list 'python-shell-completion-native-disabled-interpreters "ipython")

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support

