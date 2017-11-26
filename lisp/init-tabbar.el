;;; tabbar --- sumary
;;; Commentary:
;;; Code:
(require-package 'tabbar)
(require 'tabbar)

(global-set-key (kbd "M-<left>") 'tabbar-backward)
(global-set-key (kbd "M-<right>") 'tabbar-forward)
;;(global-set-key (kbd "M-<up>") 'tabbar-forward-group)
;;(global-set-key (kbd "M-<down>") 'tabbar-backward-group)

(tabbar-mode 1)
(provide 'init-tabbar)
;;; init-tabbar.el ends here
