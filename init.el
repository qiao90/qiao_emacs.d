;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time

;;(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
;;(defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Temporarily reduce garbage collection during startup
;;----------------------------------------------------------------------------
(defconst sanityinc/initial-gc-cons-threshold gc-cons-threshold
  "Initial value of `gc-cons-threshold' at start-up time.")
(setq gc-cons-threshold (* 128 1024 1024))
(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold sanityinc/initial-gc-cons-threshold)))
		  
;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)
;;(require 'init-compat)
(require 'init-utils)
;;(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
;; Calls (package-initialize)
(require 'init-elpa)      ;; Machinery for installing required packages
;;(require 'init-exec-path) ;; Set up $PATH

;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-preload-local.el"
;;----------------------------------------------------------------------------
;;(require 'init-preload-local nil t)

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

(require-package 'wgrep)
(require-package 'project-local-variables)
(require-package 'diminish)
(require-package 'scratch)
(require-package 'mwe-log-commands)

(require-package 'magit)
(require 'magit)

(require-package 'sr-speedbar)
(require 'sr-speedbar)

(require-package 'function-args)
(require 'function-args)
;; (fa-config-default)
(add-hook 'c++-mode-hook '(lambda ()
                            (local-set-key (kbd "C-M-k") 'moo-jump-local)))
(add-hook 'c-mode-hook '(lambda ()
                            (local-set-key (kbd "C-M-k") 'moo-jump-local)))

;; this variables must be set before load helm-gtags
;; you can change to any prefix key of your choice
(setq helm-gtags-prefix-key "\C-cg")

(require 'init-helm)
(require 'init-helm-gtags)
(require 'init-helm-projectile)
;; (require 'init-ggtags)
(require 'init-cedet)
(require-package 'ecb)
(require 'ecb)

(windmove-default-keybindings)

;;ido/ibuffer or helm only one can be selected
;;(require 'init-ido)
;;(require 'init-ibuffer)

;; (require 'init-flycheck)
(require 'init-recentf)
(require 'init-hippie-expand)
(require 'init-company)
(require 'init-yasnippet)

(require 'init-color-theme)
(require 'init-hideshow)
(require 'init-indent)
(require 'init-tabbar)
(require 'init-editing)

(require 'init-revive)
;; (desktop-save-mode 1)
;;(require 'init-sessions)
;;(require 'init-fonts)


;;(require 'init-paredit
(require 'init-smartparens)

(require 'init-python-mode)
(require 'init-w3m)
;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
;;(require 'init-locales)


(require-package 'zygospore)
;; Package zygospore
(global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows)

;;only for c/c++ programs 
;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))
(global-set-key (kbd "M-?") 'pop-global-mark)

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

(add-hook 'after-init-hook
          (lambda ()
            (message "init completed in %.2fms"
                     (sanityinc/time-subtract-millis after-init-time before-init-time))))

;; (setq enable-local-variables :safe)

(provide 'init)
