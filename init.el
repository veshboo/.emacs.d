;;; package -- Emacs init script
;;; Commentary:
;;; Code:
;(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load "vesh_base")
(load "vesh_prog")
(load "vesh_java")
(load "vesh_python")
(load "vesh_octave")
;;; TODO: Running emacs as server
;; (server-start)
;;; Custom set
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
'(ac-modes '(emacs-lisp-mode lisp-mode lisp-interaction-mode c-mode
                             cc-mode c++-mode java-mode scheme-mode
                             ecmascript-mode javascript-mode js-mode
                             js-jsx-mode js2-mode js2-jsx-mode
                             css-mode makefile-mode sh-mode xml-mode
                             web-mode))
 '(conda-anaconda-home "/Users/mini/miniconda3")
 '(ecb-options-version "2.50")
 '(eclim-executable "/Applications/Eclipse.app/Contents/Eclipse/eclim")
 '(eclimd-default-workspace "~/.emacs.d/workspace")
 '(eclimd-executable "/Applications/Eclipse.app/Contents/Eclipse/eclimd")
 '(gradle-executable-path "/usr/local/bin/gradle")
 '(jdee-server-dir "~/.local/jars")
 '(magit-log-arguments '("--graph" "--color" "--decorate" "-n256"))
 '(package-selected-packages
   (quote
    (zone-nyan zenburn-theme xterm-color xcscope virtualenvwrapper
               virtualenv use-package ucs-utils spacemacs-theme
               spaceline-all-the-icons smart-mode-line python-mode
               py-autopep8 pandoc-mode pandoc nyan-mode markdown-mode
               magit jdee helm-projectile helm-open-github gradle-mode
               font-utils exec-path-from-shell eproject elpy ein ecb
               django-manage conda browse-at-remote ac-emacs-eclim))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here
