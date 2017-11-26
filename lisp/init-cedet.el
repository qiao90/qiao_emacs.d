(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-idle-summary-mode 1)

;;(global-semantic-stickyfunc-mode 1)     ;;与tabbar有冲突，都要是在第一行显示.

(semantic-mode 1)

(defun alexott/cedet-hook ()
  (local-set-key "\C-c\C-j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-s" 'semantic-ia-show-summary))

(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'c-mode-hook 'alexott/cedet-hook)
(add-hook 'c++-mode-hook 'alexott/cedet-hook)

;; (defconst cedet-user-include-dirs
;;   (list "/home/qiao/apue.2e/include/"))

;; (require 'semantic-c nil 'noerror)
;; (let ((include-dirs cedet-user-include-dirs))
;;   (mapc (lambda (dir)
;;           (semantic-add-system-include dir 'c++-mode)
;;           (semantic-add-system-include dir 'c-mode))
;;         include-dirs))

(semantic-add-system-include "/usr/local/include/opencv2/" 'c++-mode)

(add-hook 'c-mode-hook (lambda ()
                         (setq semantic-c-dependency-system-include-path
                               (list "/usr/include"
                                     "/home/qiao/apue.2e/include/"
                                     "/home/qiao/linux/lanchat/code/libapue/"
                                     "/home/qiao/linux/tetris/inc/"))))

;; Enable EDE only in C/C++
(require 'ede)
(global-ede-mode)

(provide 'init-cedet)
