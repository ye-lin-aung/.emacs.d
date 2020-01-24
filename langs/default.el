(use-package company
   :ensure t
   :config 
(add-hook 'after-init-hook 'global-company-mode)
)
(use-package auto-complete
   :ensure t
   :config 
(ac-config-default)
)

(use-package company-web
   :ensure t
   :config 
)
(add-to-list 'load-path "~/.emacs.d/vendor/company-inf-ruby/") 
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-inf-ruby))
