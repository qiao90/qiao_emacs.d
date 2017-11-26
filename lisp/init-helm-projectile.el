;; Package: projejctile
(require-package 'projectile)
(require-package 'helm-projectile)

(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)

(require 'helm-projectile)
(helm-projectile-on)
(setq projectile-completion-system 'helm)
(setq projectile-indexing-method 'alien)

(provide 'init-helm-projectile)