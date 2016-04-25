					; My .emacs!
;;; Rules:
;;;   1) Don't add anything unless you understand it properly!
;;;   2) Don't get angry -- it's your fault.

;;; =============== Package ===============


(require 'package)

;; List of packages to be installed!
;; (Don't quote the packages)
(setq package-list '(
		     ;; Essential
		     evil
		     ;; Navigation
		     relative-line-numbers
		     vertigo
		     evil-snipe
		     ;; Eyecandy
		     darktooth-theme
		     solarized-theme))

(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
			 ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa-stable" . "http://stable.melpa.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;;; =============== Essential ===============

;;  --------------- Evil ---------------
(require 'evil)
(evil-mode t)

(defun my-jk ()
  (interactive)
  (let* ((initial-key ?j)
         (final-key ?k)
         (timeout 0.5)
         (event (read-event nil nil timeout)))
    (if event
        ;; timeout met
        (if (and (characterp event) (= event final-key))
            (evil-normal-state)
          (insert initial-key)
          (push event unread-command-events))
      ;; timeout exceeded
      (insert initial-key))))

(defun my-kj ()
  (interactive)
  (let* ((initial-key ?k)
         (final-key ?j)
         (timeout 0.5)
         (event (read-event nil nil timeout)))
    (if event
        ;; timeout met
        (if (and (characterp event) (= event final-key))
            (evil-normal-state)
          (insert initial-key)
          (push event unread-command-events))
      ;; timeout exceeded
      (insert initial-key))))

;; These allow me to bash `j' and `k' to escape insert mode
(define-key evil-insert-state-map (kbd "j") 'my-jk)
(define-key evil-replace-state-map (kbd "j") 'my-jk)
(define-key evil-insert-state-map (kbd "k") 'my-kj)
(define-key evil-replace-state-map (kbd "k") 'my-kj)

;; =============== Navigation ===============

;; ---------- Relative Line Numbers ----------
(global-relative-line-numbers-mode)
;; --------------- Vertigo --------------- 
(defun my-spc (jump-key)
  (interactive "k")
  (vertigo--jump (key-binding jump-key) ""))

(define-key evil-normal-state-map (kbd "<SPC>") 'my-spc)
(define-key evil-visual-state-map (kbd "<SPC>") 'my-spc)
(define-key evil-motion-state-map (kbd "<SPC>") 'my-spc)
;; --------------- Evil-Snipe ---------------
(require 'evil-snipe)
(evil-snipe-mode 1)
(setq evil-snipe-repeat-scope 'visible)
(setq evil-snipe-spillover-scope 'visible)

;;; =============== Eyecandy ===============

;; --------------- Fonts ---------------

(set-face-attribute 'default nil :font "Inconsolata-13")
(set-frame-font "Inconsolata-13" nil t)

;; --------------- Themes ---------------

;; Darktooth
(require 'darktooth-theme)
(load-theme 'darktooth t)

;; Solarized
;(require 'solarized-theme)

;;; =============== Tweaks ===============

;; Scrolling
(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Startup Screen
(setq inhibit-startup-screen t)

;; Default frame size
(when window-system (set-frame-width (selected-frame) 82))


(message "init.el has loaded successfully!")
;; init.el ends here
