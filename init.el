(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
    )
(require 'cl)
(defvar zilongshanren/packages '(
				 company
				 hungry-delete
				 monokai-theme
				 swiper
				 counsel
				 smartparens
				 js2-mode
				 nodejs-repl
				 exec-path-from-shell
				 )  "Default packages")

(setq package-selected-packages zilongshanren/packages)

(defun zilongshanren/packages-installed-p ()
    (loop for pkg in zilongshanren/packages
          when (not (package-installed-p pkg)) do (return nil)
          finally (return t)))

(unless (zilongshanren/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg zilongshanren/packages)
      (when (not (package-installed-p pkg))
        (package-install pkg))))

;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;(load-theme 'monokai)
(hungry-delete-mode t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(electric-indent-mode 1)
(setq inhibit-splash-screen t)
()
;- turn off tool-bar
;- turn off scroll-bar
;- show linum-mode
;- turn off splash screen
;- save your config
;- define a function to quickly open your config file.

(global-linum-mode t)
(global-hungry-delete-mode t)
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)

(setq-default cursor-type 'bar)
(setq make-backup-files nil)
(require 'org)
(setq org-src-fontify-natively t)
(require 'recentf)
(load-theme 'monokai t)
(recentf-mode 1)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(delete-selection-mode t)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(global-company-mode t)
(global-hl-line-mode)
(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
;; config js2-mode for js files
(setq auto-mode-alist(append '(("\\.js\\'" . js2-mode))auto-mode-alist))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("6c62b1cd715d26eb5aa53843ed9a54fc2b0d7c5e0f5118d4efafa13d7715c56e" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "dark gray")))))
