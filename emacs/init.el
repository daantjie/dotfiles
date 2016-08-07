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
		     helm
		     helm-swoop
		     evil
		     evil-leader
		     evil-mc
		     evil-exchange
		     ;; Languages
		     haskell-mode
		     lua-mode
		     ;; Navigation
		     relative-line-numbers
		     vertigo
		     evil-snipe
		     ;; Networking
		     ;;jabber
		     ;; Eyecandy
		     darktooth-theme
		     solarized-theme
		     ;; Org Mode
		     evil-org))

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

; =============== Essential ===============

;;  --------------- Helm ---------------

(require 'helm-config)
(require 'helm-swoop)

;;  --------------- Evil ---------------
(require 'evil)
(evil-mode t)

(defun my-jk ()
  (interactive)
  (let* ((initial-key ?j)
         (final-key ?k)
         (timeout 0.05)
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
         (timeout 0.05)
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

;; ---------- Evil-MC ----------
(require 'evil-mc)
(global-evil-mc-mode 1)

;; ---------- Evil-Exchange ----------
(require 'evil-exchange)
(evil-exchange-install)

;; =============== Languages ===============

;; ---------- Haskell-Mode ----------
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; ---------- Lua-Mode ----------
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;; =============== Navigation ===============

;; ---------- Relative Line Numbers ----------
(global-relative-line-numbers-mode)

;; --------------- Vertigo ---------------
(require 'vertigo)

;; (defun vertigo-spc (jump-key)
;;   (interactive "k")
;;   (vertigo-set-digit-argument nil)
;;   (setq unread-command-events (listify-key-sequence jump-key)))

;; (evil-beginning-of-line)
;; (evil-end-of-line)

(evil-define-motion vertigo-j (count)
  :type line
  :jump t
  (vertigo--jump #'evil-next-line "Jump down: "))

(evil-define-motion vertigo-k (count)
  :type line
  :jump t
  (vertigo--jump #'evil-previous-line "Jump up: "))

(define-key evil-normal-state-map (kbd "<SPC>")
  #'vertigo-alt-run-command-with-digit-argument)
(define-key evil-visual-state-map (kbd "<SPC>")
  #'vertigo-alt-run-command-with-digit-argument)
(define-key evil-motion-state-map (kbd "<SPC>")
  #'vertigo-alt-run-command-with-digit-argument)

(define-key evil-normal-state-map (kbd "j") #'vertigo-j)
(define-key evil-visual-state-map (kbd "j") #'vertigo-j)
(define-key evil-motion-state-map (kbd "j") #'vertigo-j)

(define-key evil-normal-state-map (kbd "k") #'vertigo-k)
(define-key evil-visual-state-map (kbd "k") #'vertigo-k)
(define-key evil-motion-state-map (kbd "k") #'vertigo-k)

(define-key evil-normal-state-map (kbd "g j") #'evil-next-visual-line)
(define-key evil-visual-state-map (kbd "g j") #'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "g j") #'evil-next-visual-line)

(define-key evil-normal-state-map (kbd "g k") #'evil-previous-visual-line)
(define-key evil-visual-state-map (kbd "g k") #'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "g k") #'evil-previous-visual-line)

;; --------------- Evil-Snipe ---------------
(require 'evil-snipe)
(evil-snipe-mode 1)
(setq evil-snipe-repeat-scope 'visible)
(setq evil-snipe-spillover-scope 'visible)

;;;;; =============== Eyecandy ===============
;;
;;;; --------------- Fonts ---------------
;;(set-face-attribute 'default nil :font "Inconsolata-13")
;;(set-frame-font "Inconsolata-13" nil t)
(add-to-list 'default-frame-alist '(font . "Inconsolata-13"))
;; --------------- Themes ---------------
;; Darktooth
;;(defun daio/load-theme ()
;;  (interactive)
;;  (require 'darktooth-theme)
;;  (load-theme 'darktooth t))
;;
;;(add-hook 'after-init-hook #'daio/load-theme)

(if (daemonp)
    (add-hook 'after-make-frame-functions
        (lambda (frame)
            (select-frame frame)
            (load-theme 'darktooth t)))
    (load-theme 'darktooth t))

;; Solarized
;(require 'solarized-theme)

;;; =============== Org mode ===============

;; --------------- Evil-Org ---------------
(require 'evil-org)

;;; =============== Networking

;; (require 'epa-file)
;; (epa-file-enable)

;; ---------- Jabber ----------
;; ;; Define a list of my jabber.el accounts
;; (setq jabber-account-list '(
;;                             ("account@chat.facebook.com"
;;                              (:network-server . "chat.facebook.com")
;;                              (:connection-type . starttls)
;;                              (:port . 5222)
;;                              (:password . nil))))

;; ;; Disable jabber.el presence notifications
;; (remove-hook 'jabber-alert-presence-hooks
;;              'sr-jabber-alert-presence-func)

;; ;; Connect to all my jabber.el accounts on startup
;; (jabber-connect-all)

;;; =============== Tweaks ===============
;; NO MORE INCESSANT BEEPING! ARGH!
 (setq ring-bell-function (lambda ()
                            (call-process
			     "mpg123"
			     nil
			     0
			     nil
			     "/home/daniel/.emacs.d/boris.mp3")))

;; ♬ hello darkness, my old friend... ♬
(defun serenade ()
  (interactive)
  (call-process "mpg123" nil 0 nil
		"/home/daniel/.emacs.d/serenade.mp3"))


(require 'darktooth-theme)
(load-theme 'darktooth t)
;; Disable the mouse!
;; (dolist (k '([mouse-1] [down-mouse-1] [drag-mouse-1] [double-mouse-1] [triple-mouse-1]
;;              [mouse-2] [down-mouse-2] [drag-mouse-2] [double-mouse-2] [triple-mouse-2]
;;              [mouse-3] [down-mouse-3] [drag-mouse-3] [double-mouse-3] [triple-mouse-3]
;;              [mouse-4] [down-mouse-4] [drag-mouse-4] [double-mouse-4] [triple-mouse-4]
;;              [mouse-5] [down-mouse-5] [drag-mouse-5] [double-mouse-5] [triple-mouse-5]))
;;   (global-unset-key k))
;; (mouse-wheel-mode -1)
;; (mouse-avoidance-mode 'banish)

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
