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
;;; TODO: Running emacs as server --daemon 옵션으로 실행하자. 당분간.
;; (server-start)
;;; Custom set
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-modes
   (quote
    (emacs-lisp-mode lisp-mode lisp-interaction-mode ecmascript-mode javascript-mode js-mode js-jsx-mode js2-mode js2-jsx-mode css-mode sh-mode xml-mode web-mode)))
 '(conda-anaconda-home "/Users/mini/miniconda3")
 '(custom-safe-themes
   (quote
    ("d507c9e58cb0eb8508e15c8fedc2d4e0b119123fab0546c5fd30cadd3705ac86" "611e38c2deae6dcda8c5ac9dd903a356c5de5b62477469133c89b2785eb7a14d" "5900bec889f57284356b8216a68580bfa6ece73a6767dfd60196e56d050619bc" "b81bfd85aed18e4341dbf4d461ed42d75ec78820a60ce86730fc17fc949389b2" "365d9553de0e0d658af60cff7b8f891ca185a2d7ba3fc6d29aadba69f5194c7f" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "8ed752276957903a270c797c4ab52931199806ccd9f0c3bb77f6f4b9e71b9272" default)))
 '(ecb-options-version "2.50")
 '(eclim-executable "/Applications/Eclipse.app/Contents/Eclipse/eclim")
 '(eclimd-default-workspace "~/.emacs.d/workspace")
 '(eclimd-executable "/Applications/Eclipse.app/Contents/Eclipse/eclimd")
 '(gradle-executable-path "/usr/local/bin/gradle")
 '(jdee-server-dir "~/.local/jars")
 '(magit-log-arguments (quote ("--graph" "--color" "--decorate" "-n256")))
 '(mode-line-in-non-selected-windows nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (powerline help+ neotree doom-themes spaceline-config monokai-theme gist org zone-nyan zenburn-theme xterm-color xcscope virtualenvwrapper virtualenv use-package ucs-utils spacemacs-theme spaceline-all-the-icons smart-mode-line python-mode py-autopep8 pandoc-mode pandoc nyan-mode markdown-mode magit jdee helm-projectile helm-open-github gradle-mode font-utils exec-path-from-shell eproject elpy ein ecb django-manage conda browse-at-remote ac-emacs-eclim)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here
