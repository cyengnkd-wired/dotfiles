(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(global-linum-mode t)
(global-visual-line-mode t)
(set-face-attribute 'default nil :height 90)

(column-number-mode t)
(global-hl-line-mode t)
(setq visible-bell t)

; Espacamento de barras
(set-fringe-mode 10)

(global-unset-key (kbd "C-z"))
(delete-selection-mode t)

;; rolagem mais suave
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1)) ; 2 linhas por vez
      mouse-wheel-progressive-speed nil ; nao acelera a rolagem
      mouse-wheel-follow-mouse 't ; rola a janela sob o mouse
      scroll-step 1) ; rola 1 linha com teclado

;; backups
(unless (file-exists-p "~/.saves")
  (make-directory "~/.saves"))

(setq backup-directory-alist `(("." . ,(expand-file-name "~/.saves/"))))


;; Pacotes
(require 'package)
(setq package-enable-at-startup nil) ; desabilitar inicio de ativacao
;; MELPA - REPOSITORIO
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize) ; iniciar pacotes
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(doom-xcode))
 '(custom-safe-themes
   '("x" default))
 '(package-selected-packages '(doom-modeline doom-themes shrink-path nerd-icons compat)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'doom-modeline)
(doom-modeline-mode 1)
