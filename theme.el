(unless (package-installed-p 'gruvbox-theme)
    (package-refresh-contents)
    (package-install 'gruvbox-theme))

(unless (package-installed-p 'dracula-theme)
    (package-refresh-contents)
    (package-install 'dracula-theme))

(unless (package-installed-p 'nord-theme)
    (package-refresh-contents)
    (package-install 'nord-theme))

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)
  
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(load-theme 'doom-dark+ t)
