;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Using shell, term, eshell ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Eshell path
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
;; Enviroment variables from .bashrc or .profile
(let ((ev (shell-command-to-string ". ~/.bashrc; echo -n $JAVA_HOME")))
  (setenv "JAVA_HOME" ev))
(let ((ev (shell-command-to-string ". ~/.bashrc; echo -n $HADOOP_HOME")))
  (setenv "HADOOP_HOME" ev))
