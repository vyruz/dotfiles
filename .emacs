(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq backup-directory-alist
      `((".*" . ,"~/.emacs.d/backups")))
(setq auto-save-file-name-transforms
      `((".*" ,"~/.emacs.d/backups")))

;; (add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(unless (package-installed-p 'sbt-mode)
  (package-refresh-contents) (package-install 'sbt-mode))

;; remote editing on intern01
(defun devm ()
  (interactive)
  (find-file "/lucas.woodruff@10.69.22.198:"))

(setq column-number-mode t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(load-theme 'monokai t)
(show-paren-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(require 'auto-install)
(crosshairs-mode 1)
(setq col-highlight-vline-face-flag  t
      col-highlight-face             hl-line-face)

;; ace jump mode major function
;;
(add-to-list 'load-path "/full/path/where/ace-jump-mode.el/in/")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-c l") 'ace-jump-line-mode)


;;
;; enable a more powerful jump back function from ace jump mode
;;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;; ;;If you use viper mode :
;; (define-key viper-vi-global-user-map (kbd "SPC") 'ace-jump-mode)
;; ;;If you use evil
;; (define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)

(add-hook 'python-mode-hook 'column-enforce-mode)
(add-hook 'org-mode-hook 'column-enforce-mode)
