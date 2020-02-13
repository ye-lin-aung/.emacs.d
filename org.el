(add-to-list 'load-path "~/.emacs.d/vendor/ob-restclient/") 
(org-babel-do-load-languages
 'org-babel-load-languages (quote ((emacs-lisp . t)
                                    (sqlite . t)
				    (sql .t)
                                    (R . t)
				    (restclient . t)
                                    (ruby . t)
                                    (python . t))))

(use-package olivetti
  :ensure t)

(use-package typo
  :ensure t)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
)

;;(use-package poet-theme
;;  :ensure t
;;  :hook org-mode
;;  :config
;;   (olivetti-mode 1)        ;; Centers text in the buffer
;;   (flyspell-mode 1)        ;; Catch Spelling mistakes
;;   (blink-cursor-mode 0)    ;; Reduce visual noise
;;   (linum-mode 0)           ;; No line numbers for prose
;;   (setq org-bullets-bullet-list
;;        '("◉" "○"))
;;   (org-bullets-mode 1)
;;   (add-hook 'text-mode-hook
;;               (lambda ()
;;                (variable-pitch-mode 1)))

;;)

(use-package org-download
:ensure t 
:config
(add-hook 'dired-mode-hook 'org-download-enable)
)
