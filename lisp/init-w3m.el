(require-package 'w3m)

(setq w3m-command-arguments '("-cookie" "-F"))
(setq w3m-use-cookies t)
(setq w3m-home-page "http://www.baidu.com/")
;; (require 'mime-w3m)
(setq w3m-default-display-inline-images t)
(setq w3m-default-toggle-inline-images t)

(provide 'init-w3m)
