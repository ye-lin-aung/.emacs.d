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

(use-package web-mode
:ensure t
:config
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
)

(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g b" . dumb-jump-back)
         ("M-g i" . dumb-jump-go-prompt)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
  :ensure)

(use-package vimish-fold
:ensure t
:config
(vimish-fold-global-mode 1)
(global-set-key (kbd "C-c v f") #'vimish-fold)
(global-set-key (kbd "C-c v v") #'vimish-fold-delete))

(use-package helm
:ensure t)
(use-package helm-dash
:ensure t)
