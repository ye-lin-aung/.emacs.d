(use-package olivetti
  :ensure t)

(use-package typo
  :ensure t)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
)

(use-package poet-theme
  :ensure t
  :hook org-mode
  :config
   (olivetti-mode 1)        ;; Centers text in the buffer
   (flyspell-mode 1)        ;; Catch Spelling mistakes
   (typo-mode 1)            ;; Good for symbols like em-dash

   (blink-cursor-mode 0)    ;; Reduce visual noise
   (linum-mode 0)           ;; No line numbers for prose

   (setq org-bullets-bullet-list
        '("◉" "○"))
   (org-bullets-mode 1)
   (add-hook 'text-mode-hook
               (lambda ()
                (variable-pitch-mode 1)))

)
