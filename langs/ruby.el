(add-to-list 'load-path "~/.emacs.d/vendor/inf-ruby") 
(autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

(use-package projectile-rails
:ensure t
:config
(projectile-rails-global-mode)
(define-key projectile-rails-mode-map (kbd "C-c r") 'projectile-rails-command-map)
)
