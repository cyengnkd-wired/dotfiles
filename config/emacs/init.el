(setq inhibit-startup-message t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(global-linum-mode t)
(global-visual-line-mode t)

(set-face-attribute 'default nil :height 110)

(column-number-mode t)


(setq visible-bell t)


(set-fringe-mode 10)


(load-theme 'manoj-dark t)

(global-unset-key (kbd "C-z"))
(delete-selection-mode t)


(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))
      mouse-wheel-progressive-speed nil 
      mouse-wheel-follow-mouse 't
      scroll-step 1)


(unless (file-exists-p "~/.saves")
  (make-directory "~/.saves"))

(setq backup-directory-alist `(("." . ,(expand-file-name "~/.saves/"))))


(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize) 
