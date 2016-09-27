(load "vesh_base")
(load "vesh_melpa")
(load "vesh_prog")
(load "vesh_shell")
(load "vesh_vcs")
;;;;;;;;;;;;
;; Custom ;;
;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(magit-log-arguments (quote ("--graph" "--color" "--decorate" "-n256")))
 '(package-selected-packages
   (quote
    (js2-mode js3-mode eproject jdee magit-gh-pulls magithub xterm-color xcscope markdown-mode magit groovy-mode gradle-mode exec-path-from-shell))))
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
(global-hl-line-mode 1)
(set-face-background 'highlight "#663")
(set-face-foreground 'highlight nil)
(set-face-attribute 'default nil :height 120)
