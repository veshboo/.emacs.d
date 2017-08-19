;(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load "vesh_base")
;;(load "vesh_shell")
(load "vesh_prog")
;;(load "vesh_java")
(load "vesh_python")
;;;;;;;;;;;;
;; Custom ;;
;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-modes
   (quote
    (emacs-lisp-mode lisp-mode lisp-interaction-mode c-mode cc-mode c++-mode go-mode java-mode scheme-mode ecmascript-mode javascript-mode js-mode js-jsx-mode js2-mode js2-jsx-mode coffee-mode css-mode makefile-mode sh-mode xml-mode web-mode)))
 '(ecb-options-version "2.50")
 '(ecb-source-path (quote ("/Users/vesh/Works/spring/woowa/spring-practice")))
 '(eclim-executable "/Applications/Eclipse.app/Contents/Eclipse/eclim")
 '(eclimd-default-workspace "~/.emacs.d/workspace")
 '(eclimd-executable "/Applications/Eclipse.app/Contents/Eclipse/eclimd")
 '(gradle-executable-path "/usr/local/bin/gradle")
 '(magit-log-arguments (quote ("--graph" "--color" "--decorate" "-n256")))
 '(package-selected-packages
   (quote
    (django-manage ein python-mode flycheck elpy virtualenv virtualenvwrapper auto-complete gradle-mode helm-projectile projectile helm ecb ac-emacs-eclim eclim js2-mode js3-mode eproject magit-gh-pulls magithub xterm-color xcscope markdown-mode magit groovy-mode exec-path-from-shell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                        ;;
;; Fixup unwanted overridings made so far ;;
;;                                        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(global-hl-line-mode 1)
;; (set-face-background 'highlight "#005000")
;; (set-face-foreground 'highlight nil)
(when (not window-system)
  (load-theme 'tango-dark)
  (enable-theme 'tango-dark)
  (set-face-attribute 'default nil :height 120))
