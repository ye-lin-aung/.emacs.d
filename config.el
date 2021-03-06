(set-face-attribute 'default nil :height 130)

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
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-global-mode)
;;  (setq projectile-completion-system 'helm)
)

;; all-the-icons (Optional) 
(use-package all-the-icons
   :ensure t

)

(use-package all-the-icons-dired
   :ensure t
   :config
   (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
)

;; Dashboard
(use-package dashboard
  :ensure t
  :config
(setq dashboard-banner-logo-title "Welcome to Ye's Dashboard")
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-navigator-buttons
      `(;; line1
        ((,(all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
         "Homepage"
         "Browse homepage"
         (lambda (&rest _) (browse-url "homepage")))
        ("★" "Star" "Show stars" (lambda (&rest _) (show-stars)) warning)
        ("?" "" "?/h" #'show-help nil "<" ">"))
         ;; line 2
        ((,(all-the-icons-faicon "linkedin" :height 1.1 :v-adjust 0.0)
          "Linkedin"
          ""
          (lambda (&rest _) (browse-url "homepage")))
         ("⚑" nil "Show flags" (lambda (&rest _) (message "flag")) error))))
(setq dashboard-startup-banner "~/.emacs.d/wall.png")
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
  (setq centaur-tabs-set-icons t)
  (centaur-tabs-mode t) 
  (setq centaur-tabs-set-bar 'under)
  (setq centaur-tabs-style "bar")
)
(add-hook 'term-mode-hook 'centaur-tabs-local-mode)
(add-hook 'eshell-mode-hook 'centaur-tabs-local-mode)

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
(define-key global-map (kbd "C-c i") 'vr/replace)
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
(setq highlight-indent-guides-method 'character)
)

;; Fira code
;; This works when using emacs --daemon + emacsclient
(when(display-graphic-p)
(add-hook 'after-make-frame-functions (lambda (frame) (set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")))
;; This works when using emacs without server/client
(set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")
(set-face-attribute 'default nil :height 150)
;; I haven't found one statement that makes both of the above situations work, so I use both for now

(defconst fira-code-font-lock-keywords-alist
  (mapcar (lambda (regex-char-pair)
            `(,(car regex-char-pair)
              (0 (prog1 ()
                   (compose-region (match-beginning 1)
                                   (match-end 1)
                                   ;; The first argument to concat is a string containing a literal tab
                                   ,(concat "	" (list (decode-char 'ucs (cadr regex-char-pair)))))))))
          '(("\\(www\\)"                   #Xe100)
            ("[^/]\\(\\*\\*\\)[^/]"        #Xe101)
            ("\\(\\*\\*\\*\\)"             #Xe102)
            ("\\(\\*\\*/\\)"               #Xe103)
            ("\\(\\*>\\)"                  #Xe104)
            ("[^*]\\(\\*/\\)"              #Xe105)
            ("\\(\\\\\\\\\\)"              #Xe106)
            ("\\(\\\\\\\\\\\\\\)"          #Xe107)
            ("\\({-\\)"                    #Xe108)
            ("\\(\\[\\]\\)"                #Xe109)
            ("\\(::\\)"                    #Xe10a)
            ("\\(:::\\)"                   #Xe10b)
            ("[^=]\\(:=\\)"                #Xe10c)
            ("\\(!!\\)"                    #Xe10d)
            ("\\(!=\\)"                    #Xe10e)
            ("\\(!==\\)"                   #Xe10f)
            ("\\(-}\\)"                    #Xe110)
            ("\\(--\\)"                    #Xe111)
            ("\\(---\\)"                   #Xe112)
            ("\\(-->\\)"                   #Xe113)
            ("[^-]\\(->\\)"                #Xe114)
            ("\\(->>\\)"                   #Xe115)
            ("\\(-<\\)"                    #Xe116)
            ("\\(-<<\\)"                   #Xe117)
            ("\\(-~\\)"                    #Xe118)
            ("\\(#{\\)"                    #Xe119)
            ("\\(#\\[\\)"                  #Xe11a)
            ("\\(##\\)"                    #Xe11b)
            ("\\(###\\)"                   #Xe11c)
            ("\\(####\\)"                  #Xe11d)
            ("\\(#(\\)"                    #Xe11e)
            ("\\(#\\?\\)"                  #Xe11f)
            ("\\(#_\\)"                    #Xe120)
            ("\\(#_(\\)"                   #Xe121)
            ("\\(\\.-\\)"                  #Xe122)
            ("\\(\\.=\\)"                  #Xe123)
            ("\\(\\.\\.\\)"                #Xe124)
            ("\\(\\.\\.<\\)"               #Xe125)
            ("\\(\\.\\.\\.\\)"             #Xe126)
            ("\\(\\?=\\)"                  #Xe127)
            ("\\(\\?\\?\\)"                #Xe128)
            ;;            ("\\(;;\\)"                    #Xe892)
            ("\\(;;\\)"                    #Xe892)
            ("\\(/\\*\\)"                  #Xe12a)
            ("\\(/\\*\\*\\)"               #Xe12b)
            ("\\(/=\\)"                    #Xe12c)
            ("\\(/==\\)"                   #Xe12d)
            ("\\(/>\\)"                    #Xe12e)
            ("\\(//\\)"                    #Xe12f)
            ("\\(///\\)"                   #Xe130)
            ("\\(&&\\)"                    #Xe131)
            ("\\(||\\)"                    #Xe132)
            ("\\(||=\\)"                   #Xe133)
            ("[^|]\\(|=\\)"                #Xe134)
            ("\\(|>\\)"                    #Xe135)
            ("\\(\\^=\\)"                  #Xe136)
            ("\\(\\$>\\)"                  #Xe137)
            ("\\(\\+\\+\\)"                #Xe138)
            ("\\(\\+\\+\\+\\)"             #Xe139)
            ("\\(\\+>\\)"                  #Xe13a)
            ("\\(=:=\\)"                   #Xe13b)
            ("[^!/]\\(==\\)[^>]"           #Xe13c)
            ("\\(===\\)"                   #Xe13d)
            ("\\(==>\\)"                   #Xe13e)
            ("[^=]\\(=>\\)"                #Xe13f)
            ("\\(=>>\\)"                   #Xe140)
            ("\\(<=\\)"                    #Xe141)
            ("\\(=<<\\)"                   #Xe142)
            ("\\(=/=\\)"                   #Xe143)
            ("\\(>-\\)"                    #Xe144)
            ("\\(>=\\)"                    #Xe145)
            ("\\(>=>\\)"                   #Xe146)
            ("[^-=]\\(>>\\)"               #Xe147)
            ("\\(>>-\\)"                   #Xe148)
            ("\\(>>=\\)"                   #Xe149)
            ("\\(>>>\\)"                   #Xe14a)
            ("\\(<\\*\\)"                  #Xe14b)
            ("\\(<\\*>\\)"                 #Xe14c)
            ("\\(<|\\)"                    #Xe14d)
            ("\\(<|>\\)"                   #Xe14e)
            ("\\(<\\$\\)"                  #Xe14f)
            ("\\(<\\$>\\)"                 #Xe150)
            ("\\(<!--\\)"                  #Xe151)
            ("\\(<-\\)"                    #Xe152)
            ("\\(<--\\)"                   #Xe153)
            ("\\(<->\\)"                   #Xe154)
            ("\\(<\\+\\)"                  #Xe155)
            ("\\(<\\+>\\)"                 #Xe156)
            ("\\(<=\\)"                    #Xe157)
            ("\\(<==\\)"                   #Xe158)
            ("\\(<=>\\)"                   #Xe159)
            ("\\(<=<\\)"                   #Xe15a)
            ("\\(<>\\)"                    #Xe15b)
            ("[^-=]\\(<<\\)"               #Xe15c)
            ("\\(<<-\\)"                   #Xe15d)
            ("\\(<<=\\)"                   #Xe15e)
            ("\\(<<<\\)"                   #Xe15f)
            ("\\(<~\\)"                    #Xe160)
            ("\\(<~~\\)"                   #Xe161)
            ("\\(</\\)"                    #Xe162)
            ("\\(</>\\)"                   #Xe163)
            ("\\(~@\\)"                    #Xe164)
            ("\\(~-\\)"                    #Xe165)
            ("\\(~=\\)"                    #Xe166)
            ("\\(~>\\)"                    #Xe167)
            ("[^<]\\(~~\\)"                #Xe168)
            ("\\(~~>\\)"                   #Xe169)
            ("\\(%%\\)"                    #Xe16a)
            ;; ("\\(x\\)"                   #Xe16b) This ended up being hard to do properly so i'm leaving it out.
            ("[^:=]\\(:\\)[^:=]"           #Xe16c)
            ("[^\\+<>]\\(\\+\\)[^\\+<>]"   #Xe16d)
            ("[^\\*/<>]\\(\\*\\)[^\\*/<>]" #Xe16f))))

(defun add-fira-code-symbol-keywords ()
  (font-lock-add-keywords nil fira-code-font-lock-keywords-alist))

(add-hook 'prog-mode-hook
          #'add-fira-code-symbol-keywords))

(use-package multi-term
:ensure t
:config
(setq multi-term-program "/home/linuxbrew/.linuxbrew/bin/zsh")
:bind
("C-c u j" . multi-term-next)
("C-c u k" . multi-term-prev)
)

(defalias 'ff 'find-file)
(defalias 'ffo 'find-file-other-window)
;; New Eshell
(global-set-key (kbd "C-c u $") 
(defun eshell-new()
  "Open a new instance of eshell."
  (interactive)
  (eshell 'N))
)

(use-package ibuffer-vc
:ensure t)

(use-package avy
:ensure t
:config
(global-set-key (kbd "C-;") 'avy-goto-char))

(use-package elscreen
:ensure t
:config
(elscreen-start)
(elscreen-toggle-display-tab)
)

(use-package lsp-mode
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  :init
 (setq read-process-output-max (* 1024 1024)) ;; 1mb
 (setq gc-cons-threshold 100000000)
 (setq lsp-idle-delay 0.500)
 (setq lsp-keymap-prefix "C-c l")

;;  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
;;         (prog-mode . lsp)
         ;; if you want which-key integration
;;         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; optionally
(use-package lsp-ui
:ensure t
 :commands lsp-ui-mode)
(use-package company-lsp 
:ensure t
:commands company-lsp)

;; if you are ivy user
(use-package treemacs
:ensure t)



(use-package lsp-ivy
:ensure t
 :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs 
:ensure t
:commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
;;(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration

(use-package eshell-up
:ensure t
)
(defalias 'up 'eshell-up)
(defalias 'pk 'eshell-up-peek)

(use-package esh-autosuggest
  :hook (eshell-mode . esh-autosuggest-mode)
  ;; If you have use-package-hook-name-suffix set to nil, uncomment and use the
  ;; line below instead:
  ;;:hook (eshell-mode-hook . esh-autosuggest-mode)
  :ensure t)

(require 'cl)
(use-package telephone-line
:ensure t
:config
(telephone-line-mode 1)
(setq telephone-line-primary-left-separator 'telephone-line-cubed-left
      telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-left
      telephone-line-primary-right-separator 'telephone-line-cubed-right
      telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-right)
(setq telephone-line-height 12
      telephone-line-evil-use-short-tag t)
)

(use-package perspective
:ensure t
:config

(persp-mode)
)

(use-package counsel-projectile
:ensure t
:config 
(counsel-projectile-mode)
)
(use-package persp-projectile
  :after (perspective)
  :ensure t
  :bind
)
(global-set-key (kbd "C-x b") 'persp-ivy-switch-buffer)

(use-package zoom
:ensure t
:config 
(zoom-mode t)
(defun size-callback ()
  (cond ((> (frame-pixel-width) 1280) '(0.8 . 0.75))
        (t                            '(0.8 . 0.5))))

(custom-set-variables
 '(zoom-size 'size-callback))
(global-set-key (kbd "C-x +") 'zoom)
)

(use-package multiple-cursors
:ensure t
)
(global-set-key (kbd "C-c u m") 'mc/edit-lines)

(use-package hydra
:ensure t
:config
(defhydra hydra-zoom (global-map "<f2>")
  "zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out"))
(defhydra hydra-flycheck (global-map "<f2>")
  "flycheck"
  ("n" flycheck-next-error)
  ("p" flycheck-previous-error))
)
(use-package corral
:ensure t
  :config
  (defhydra hydra-corral (:columns 4)
    "Corral"
    ("(" corral-parentheses-backward "Back")
    (")" corral-parentheses-forward "Forward")
    ("[" corral-brackets-backward "Back")
    ("]" corral-brackets-forward "Forward")
    ("{" corral-braces-backward "Back")
    ("}" corral-braces-forward "Forward")
    ("." hydra-repeat "Repeat"))
  (global-set-key (kbd "C-c n") #'hydra-corral/body))

(use-package eaf
  :load-path "~/.emacs.d/vendor/emacs-application-framework" ; Set to "/usr/share/emacs/site-lisp/eaf" if installed from AUR
  :custom
  (eaf-find-alternate-file-in-dired t)
  :config
  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  (eaf-bind-key take_photo "p" eaf-camera-keybinding))

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))

(use-package mini-frame
:ensure t
:config (custom-set-variables
 '(mini-frame-show-parameters
   '((top . 130)
     (width . 0.5)
     (left . 0.5)))))
;;(mini-frame-mode)
