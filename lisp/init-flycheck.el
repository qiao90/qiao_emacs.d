(when (maybe-require-package 'flycheck)
  ;; (add-hook 'after-init-hook 'global-flycheck-mode)
  (add-hook 'elpy-mode-hook 'flycheck-mode)
  (delq 'elpy-module-flymake elpy-modules)
  ;; Override default flycheck triggers
  ;; (setq flycheck-check-syntax-automatically '(save idle-change mode-enabled)
  ;;       flycheck-idle-change-delay 0.8)

  ;; (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list))

;; (when (require 'flycheck nil t)
;;   ;;  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (delq 'elpy-module-flymake elpy-modules)
;;   (add-hook 'elpy-mode-hook 'flycheck-mode))

(provide 'init-flycheck)
