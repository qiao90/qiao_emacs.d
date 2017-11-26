
(require-package 'revive)
(require 'revive)

(define-key ctl-x-map "S" 'save-current-configuration)
(define-key ctl-x-map "F" 'resume)
(define-key ctl-x-map "K" 'wipe)
(setq revive:configuration-file (expand-file-name ".revive.el" user-emacs-directory))

(provide 'init-revive)
