;;
;; Version control systems
;;

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
(require 'magit-gh-pulls)
(add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)
