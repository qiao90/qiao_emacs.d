;; WAITING: haskell-mode sets tags-table-list globally, breaks tags-completion-at-point-function
;; TODO Default sort order should place [a-z] before punctuation

;;(setq tab-always-indent 'complete)  ;; use 't when company is disabled
(add-to-list 'completion-styles 'initials t)
;; Stop completion-at-point from popping up completion buffers so eagerly
(setq completion-cycle-threshold 5)
;;If an integer, cycling is used so long as there are not more completion candidates than this numbe


(when (maybe-require-package 'company)
  (add-hook 'after-init-hook 'global-company-mode)
  (after-load 'company
    (diminish 'company-mode "CMP")
    (define-key company-mode-map (kbd "M-/") 'company-complete)
	(define-key company-active-map (kbd "M-/") 'company-select-next)
;; the following four define-key's may not be needed if in the front of the file 
;; tab-always-indent has been set to complete
	(define-key c-mode-map  [(tab)] 'company-complete)
	(define-key c++-mode-map  [(tab)] 'company-complete)
;;  (define-key c-mode-map  [(control tab)] 'company-complete)
;;  (define-key c++-mode-map  [(control tab)] 'company-complete)
    ;;(setq-default company-backends '((company-capf company-dabbrev-code) company-dabbrev))
    ;; (delete 'company-semantic company-backends)
    ;; (global-set-key (kbd "M-C-/") 'company-complete)
    (global-set-key (kbd "M-C-/") 'hippie-expand)
  (when (maybe-require-package 'company-quickhelp)
;;    (after-load 'company-quickhelp
;;      (define-key company-quickhelp-mode-map (kbd "M-h") nil))
    (add-hook 'after-init-hook 'company-quickhelp-mode))
  (when (maybe-require-package 'company-c-headers)
    (after-load 'company-c-headers
      (add-to-list 'company-backends 'company-c-headers))))
  (defun sanityinc/local-push-company-backend (backend)
    "Add BACKEND to a buffer-local version of `company-backends'."
    (set (make-local-variable 'company-backends)
         (append (list backend) company-backends))))


;; Suspend page-break-lines-mode while company menu is active
;; (see https://github.com/company-mode/company-mode/issues/416)
(after-load 'company
  (after-load 'page-break-lines-mode
    (defvar sanityinc/page-break-lines-on-p nil)
    (make-variable-buffer-local 'sanityinc/page-break-lines-on-p)

    (defun sanityinc/page-break-lines-disable (&rest ignore)
      (when (setq sanityinc/page-break-lines-on-p (bound-and-true-p page-break-lines-mode))
        (page-break-lines-mode -1)))

    (defun sanityinc/page-break-lines-maybe-reenable (&rest ignore)
      (when sanityinc/page-break-lines-on-p
        (page-break-lines-mode 1)))

    (add-hook 'company-completion-started-hook 'sanityinc/page-break-lines-disable)
    (add-hook 'company-completion-finished-hook 'sanityinc/page-break-lines-maybe-reenable)
    (add-hook 'company-completion-cancelled-hook 'sanityinc/page-break-lines-maybe-reenable)))



(provide 'init-company)
