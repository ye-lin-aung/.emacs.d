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
 '(compilation-message-face 'default)
 '(custom-safe-themes
   '("dde8c620311ea241c0b490af8e6f570fdd3b941d7bc209e55cd87884eb733b0e" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "55c2069e99ea18e4751bd5331b245a2752a808e91e09ccec16eb25dadbe06354" "a2cde79e4cc8dc9a03e7d9a42fabf8928720d420034b66aecc5b665bbf05d4e9" "615123f602c56139c8170c153208406bf467804785007cdc11ba73d18c3a248b" "361f5a2bc2a7d7387b442b2570b0ef35198442b38c2812bf3c70e1e091771d1a" "6bacece4cf10ea7dd5eae5bfc1019888f0cb62059ff905f37b33eec145a6a430" "1ed5c8b7478d505a358f578c00b58b430dde379b856fbcb60ed8d345fc95594e" "d71aabbbd692b54b6263bfe016607f93553ea214bc1435d17de98894a5c3a086" "7f6d4aebcc44c264a64e714c3d9d1e903284305fd7e319e7cb73345a9994f5ef" "9b01a258b57067426cc3c8155330b0381ae0d8dd41d5345b5eddac69f40d409b" "a83f05e5e2f2538376ea2bfdf9e3cd8b7f7593b16299238c1134c1529503fa88" "8f97d5ec8a774485296e366fdde6ff5589cf9e319a584b845b6f7fa788c9fa9a" "1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" "a22f40b63f9bc0a69ebc8ba4fbc6b452a4e3f84b80590ba0a92b4ff599e53ad0" default))
 '(eaf-find-alternate-file-in-dired t t)
 '(highlight-changes-colors '("#FD5FF0" "#AE81FF"))
 '(highlight-tail-colors
   '(("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100)))
 '(magit-diff-use-overlays nil)
 '(mini-frame-show-parameters '((top . 130) (width . 0.5) (left . 0.5)))
 '(package-selected-packages
   '(elixir-mode telega org-download helm-rg restclient highlight-parentheses avy yaml-mode yaml flycheck helm-ag ibuffer-vc multi-term helm-dash vimish-fold dumb-jump web-mode projectile-rails cider highlight-indent-guides docker sublimity magit switch-window ripgrep helm rg ag focus which-key company-web company auto-complete counsel-projectile undo-tree centaur-tabs org-bullets typo typo-mode olivetti poet-theme emojify use-package quelpa projectile dashboard all-the-icons))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(weechat-color-list
   '(unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))
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
(add-hook 'before-save-hook 'my-prog-nuke-trailing-whitespace)

(defun my-prog-nuke-trailing-whitespace ()
  (when (derived-mode-p 'prog-mode)
    (delete-trailing-whitespace)))

;;(global-set-key (kbd "C-x C-b") 'ibuffer)
(load-config)
(load "package")

;; Zone Mode
;;(require 'zone)
;;(zone-when-idle 120)
(global-linum-mode)
