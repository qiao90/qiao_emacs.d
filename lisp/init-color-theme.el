(require-package 'color-theme)
(require-package 'solarized-theme)

(require 'color-theme)
(color-theme-initialize)
(require 'solarized-theme)
(load-theme 'solarized-dark t)
;;(color-theme-hober)


(provide 'init-color-theme)
