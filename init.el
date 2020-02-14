;; display graphics
(when(display-graphic-p)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1))


;; remove everythig \o/ from default configs
;; load packages

(package-initialize)
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "https://melpa.org/packages/") t
))

;; enable ido mode
(require 'ido)
(ido-mode t)

;; change user name and email of your preferences
(setq user-full-name "Ye Lin Aung")
(setq user-mail-address "hello.yelinaung@gmail.com")

;; marking text and respect clipboards
(delete-selection-mode t)
(transient-mark-mode t)

;; show empty lines
(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

;; 2 space tabs -_-
(setq tab-width 2
      indent-tabs-mode nil)

;; a good yes or no than y or n
(defalias 'yes-or-no-p 'y-or-n-p)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("a22f40b63f9bc0a69ebc8ba4fbc6b452a4e3f84b80590ba0a92b4ff599e53ad0" default))
 '(package-selected-packages
   '(org-download helm-rg restclient highlight-parentheses avy yaml-mode yaml flycheck helm-ag ibuffer-vc multi-term helm-dash vimish-fold dumb-jump web-mode projectile-rails cider highlight-indent-guides docker sublimity magit switch-window ripgrep helm rg ag focus which-key company-web company auto-complete counsel-projectile undo-tree centaur-tabs org-bullets typo typo-mode olivetti poet-theme emojify use-package quelpa projectile dashboard all-the-icons))
 '(zoom-size 'size-callback))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Literate org configurations
(require 'org)
(defun load-config()
  "Load the actual configuration in literate 'org-mode' elisp."
  (interactive)
  (org-babel-load-file "~/.emacs.d/config.org")
  (org-babel-load-file "~/.emacs.d/theme.org")
  (org-babel-load-file "~/.emacs.d/org.org")
  (org-babel-load-file "~/.emacs.d/langs/ruby.org")
  (org-babel-load-file "~/.emacs.d/langs/yaml.org")
  (org-babel-load-file "~/.emacs.d/langs/default.org")

)

;; Added backup folders to saves
(setq backup-directory-alist `(("." . "~/.saves")))

;; Disable that annoying sound that windows beep!
(setq visible-bell 1)


;;(global-set-key (kbd "C-x C-b") 'ibuffer)
(load-config)
(load "package")

;; Zone Mode
(require 'zone)
(zone-when-idle 120)
