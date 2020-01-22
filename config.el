(print "Welcome")
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

;; dependencies page-break-links
(use-package page-break-lines
 :defer t
  :ensure t
  :config
  )
  
;; projectile (Optional)
(use-package projectile
 :defer t
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
)

;; all-the-icons (Optional)
(use-package all-the-icons
   :defer t
   :ensure t
)

;; Dashboard
(use-package dashboard
  :ensure t
  :init
  (dashboard-setup-startup-hook))

(use-package emojify 
  :ensure t
  :config
  (global-emojify-mode)
)

;; Try is useful when i need to test many things
(use-package try
   :ensure t
)

(use-package centaur-tabs
  :ensure t
  :demand
  :bind 
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward)
  :config
  (centaur-tabs-mode t) 
  (setq centaur-tabs-style "wave")
)
