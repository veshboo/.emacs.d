;;; package --- Java related
;;; Commentary:
;;; Code:

;;;
;;; JDEE -- will not use, prefer eclim
;;;

;; (setq jdee-server-dir "~/Tools")

;;; Groovy
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
(add-to-list 'auto-mode-alist '("\\.groovy\\'" . groovy-mode))
(add-to-list 'auto-mode-alist '("\\.gradle\\'" . groovy-mode))

;;; Gradle
(require 'gradle-mode)
(add-hook 'java-mode-hook '(lambda() (gradle-mode 1)))

;;;
;;; eclim
;;;

(require 'eclim)
(require 'eclimd)
(add-hook 'java-mode-hook 'eclim-mode)

;; regular auto-complete initialization
(require 'auto-complete-config)
(ac-config-default)

;; add the emacs-eclim source
(require 'ac-emacs-eclim)
(ac-emacs-eclim-config)

(provide 'vesh_java)
;;; vesh_java.el ends here
