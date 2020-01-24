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
   :ensure t
)

;; Dashboard
(use-package dashboard
  :ensure t
  :config
(setq dashboard-banner-logo-title "Welcome to Ye's Dashboard")
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
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
  ("C-c t s" . centaur-tabs-counsel-switch-group)
  ("C-c t p" . centaur-tabs-group-by-projectile-project)
  :config
  (centaur-tabs-mode t) 
  (setq centaur-tabs-style "wave")
)

(use-package hydra
 :defer t
  :ensure t
)

;;(use-package ivy
;; :defer t
;;  :ensure t
;;  :config
;;  (ivy-mode 1)
;;)
(add-to-list 'load-path "~/.emacs.d/vendor/swiper/") 
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)


(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(use-package ag
  :ensure t
)

(use-package undo-tree
 :defer t
 :ensure t
 :bind
  ("C-x u" . undo-tree-visualizer-diff)
 :config
 (global-undo-tree-mode)
)

(use-package counsel-projectile
:ensure t
:config
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package which-key
   :ensure t
   :config
   (which-key-mode)
)

(use-package focus
:ensure t)

(add-to-list 'load-path "~/.emacs.d/vendor/snails/") 
(require 'snails)
(global-set-key (kbd "C-x p") 'snails)

(use-package rg
:ensure t)
(use-package ripgrep
:ensure t)

(use-package magit
:ensure t
)

(use-package sublimity
:ensure t
:config 
(sublimity-mode 1)
)

(use-package switch-window
:ensure t
:config 
(global-set-key (kbd "C-x o") 'switch-window)
(global-set-key (kbd "C-x 1") 'switch-window-then-maximize)
(global-set-key (kbd "C-x 2") 'switch-window-then-split-below)
(global-set-key (kbd "C-x 3") 'switch-window-then-split-right)
(global-set-key (kbd "C-x 0") 'switch-window-then-delete)

(global-set-key (kbd "C-x 4 d") 'switch-window-then-dired)
(global-set-key (kbd "C-x 4 f") 'switch-window-then-find-file)
(global-set-key (kbd "C-x 4 m") 'switch-window-then-compose-mail)
(global-set-key (kbd "C-x 4 r") 'switch-window-then-find-file-read-only)
(global-set-key (kbd "C-x 4 C-f") 'switch-window-then-find-file)
(global-set-key (kbd "C-x 4 C-o") 'switch-window-then-display-buffer)

(global-set-key (kbd "C-x 4 0") 'switch-window-then-kill-buffer)
)

(use-package visual-regexp
:ensure t
:config
(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
(define-key global-map (kbd "C-c m") 'vr/mc-mark)
)

(use-package goto-line-preview
:ensure t
:config
)
(global-set-key (kbd "M-g M-g")  'goto-line-preview)

(use-package docker
  :ensure t
  :bind ("C-c d" . docker))

(use-package highlight-indent-guides
:ensure t
:init
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
:config
(setq highlight-indent-guides-method 'fill)
)

(when (window-system)
  (set-frame-font "Fira Code"))
(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
               )
             ))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))
