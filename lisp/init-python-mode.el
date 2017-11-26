;; (setq auto-mode-alist
;;       (append '(("SConstruct\\'" . python-mode)
;; 		("SConscript\\'" . python-mode))
;;               auto-mode-alist))

;; (require-package 'pip-requirements)

(require-package 'elpy)
(require 'elpy)

(add-hook 'python-mode-hook '(lambda ()
                               (elpy-mode)
                               (elpy-enable)))


(require-package 'py-autopep8)
(require 'py-autopep8)

;; For elpy
(setq elpy-rpc-python-command "python3")
;; For interactive shell
(setq python-shell-interpreter "python3")


(add-hook 'elpy-mode-hook '(lambda ()
                             (py-autopep8-enable-on-save)
                             ;; (elpy-use-ipython)
                             ))

(provide 'init-python-mode)
