;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default

   dotspacemacs-distribution 'spacemacs

   dotspacemacs-configuration-layer-path '()

   dotspacemacs-configuration-layers '(
                                       python
                                       pythonjavascript
                                       html
                                       php
                                       yaml
                                       vimscript
                                       colors
                                       common-lisp
                                       coq
                                       emacs-lisp
                                       erc
                                       evil-snipe
                                       haskell
                                       idris
                                       git
                                       latex
                                       markdown
                                       org
                                       ranger
                                       selectric
                                       (shell :variables
                                              shell-default-shell 'eshell
                                              shell-default-height 30
                                              shell-default-position 'bottom)
                                       slack
                                       syntax-checking)

   dotspacemacs-additional-packages '(anaphora
                                      buttercup
                                      cask-mode
                                      company-pollen
                                      dash-functional
                                      evil-lispy
                                      evil-numbers
                                      evil-paredit
                                      eyebrowse
                                      f
                                      feature-mode
                                      geiser
                                      icicles
                                      lentic
                                      lispy
                                      minesweeper
                                      nameless
                                      paredit
                                      pollen-mode
                                      s
                                      sage-shell-mode
                                      scribble-mode
                                      smex
                                      speed-type
                                      spray
                                      sx
                                      tree-mode
                                      vertigo
                                      w3m)

   dotspacemacs-excluded-packages '(eval-sexp-fu)

   dotspacemacs-delete-orphan-packages t))
;; **************************
;; END OF dotspacemacs/layers
;; **************************

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update t
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '(recents projects) ;Possible values are: `recents' `bookmarks' `projects'.
   dotspacemacs-startup-recent-list-size 5
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(monokai
                         darktooth
                         spacemacs-dark
                         solarized-light
                         solarized-dark
                         leuven
                         zenburn)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '(;;"Unifont"
                               ;;:size 18
                               "Inconsolata"
                               :size 18
                               ;; "Fira Code"
                               ;; :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.2)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-command-key ":"
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-mode-line-unicode-symbols nil
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers 'relative
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup 'all
   dotspacemacs-themes '(monokai ; <SPC> T n
                         ;; solarized-light
                         farmhouse-light
                         )))
;; ************************
;; END OF dotspacemacs/init
;; ************************

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq-default evil-search-module 'evil-search)
  (let ((default-directory  "/home/daniel/.emacs.d/private/site-lisp"))
    (normal-top-level-add-subdirs-to-load-path))
  (load-file (let ((coding-system-for-read 'utf-8))
               (shell-command-to-string "agda-mode locate")))
  (require 'reddit)
  (load-file "~/.emacs.d/private/site-lisp/emacs-farmhouse-theme/farmhouse-theme-common.el")
  (load-file "~/.emacs.d/private/site-lisp/emacs-farmhouse-theme/farmhouse-light-theme.el"))
;; ****************************
;; END OF dotspacemacs/user-init
;; ****************************

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (setq-default evil-escape-key-sequence "jk"
                inferior-lisp-program "/usr/bin/sbcl"
                geiser-active-implementations '(chicken guile racket)
                nameless-global-aliases '(("" . "bedlam"))
                recentf-max-saved-items 50
                TeX-master nil
                intero-package-version "0.1.20"
                web-mode-markup-indent-offset 2
                web-mode-css-indent-offset 2
                web-mode-code-indent-offset 2
                org-agenda-files '("/keybase/private/daantjie/organiser.org")
                org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
                                    (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|"
                                              "CANCELLED(c@/!)"
                                              "PHONE"
                                              "MEETING"
                                              "EMAIL")))



  (load-file "~/.emacs.d/private/site-lisp/bedlam/bedlam.el")
  (load-file "~/.emacs.d/private/site-lisp/evil-hardcore/evil-hardcore.el")
  (load-file "~/.emacs.d/private/site-lisp/proof-general/generic/proof-site.el")

  (yas-global-mode)

  (defun daio/bind (keys f-sym)
    (global-set-key (kbd keys) f-sym))

  (daio/bind "C-c C-e" 'bedlam-eval-and-replace)
  (daio/bind "C-*" 'bedlam-eval-and-replace)
  (daio/bind "C-%" 'bedlam-insert-date)
  ;; (daio/bind "C-h" 'spacemacs/toggle-holy-mode)

  ;; (evil-hardcore-global-mode)

  (defun daio/new-private-package (name)
    (find-file (f-join (f-long user-emacs-directory) "private" "site-lisp" name)))

  (defun ido-find-file-recentf ()
    "Use `ido-completing-read' to \\[find-file] a recent file"
    (interactive)
    (if (find-file (ido-completing-read "Find recent file: " recentf-list))
        (message "Opening file...")
      (message "Aborting")))

  (spacemacs/set-leader-keys "fr" 'ido-find-file-recentf)
  (spacemacs/set-leader-keys "ff" 'ido-find-file)
  (spacemacs/set-leader-keys "bb" 'ido-switch-buffer)
  (spacemacs/set-leader-keys ":" 'helm-M-x) ;; smex is too slow

  ;; Modes

  (defun daio/prettify-scheme ()
    (push '("\\<#?!\\sw+\\>" . font-lock-type-face)
          scheme-font-lock-keywords-2))

  (defun daio/insert-script-usage (s)
    (interactive "MUsage: ")
    (setq s (concat "#  Usage: " s "  #"))
    (let ((pre (concat (make-string (length s) ?\#)
                       "\n")))
      (insert pre s "\n" pre)))

  (bedlam-add-hooks                     ; LISPS
      (emacs-lisp-mode-hook
       lisp-mode-hook
       (scheme-mode-hook
        :+ (daio/prettify-scheme))
       slime-repl-mode-hook)
    (paredit-mode
     evil-paredit-mode))

  ;; Since the default remove highlight doesn't work with `evil-search',
  ;; I've redefined it. Hopefully the proper highlighting will be used
  ;; in the future, and I'll remove this hack.
  (defun daio/no-hl ()
    "Removes highlighting on search terms in the same way that
    `evil-ex-search-abort' would."
    (interactive)
    (evil-ex-delete-hl 'evil-ex-search))

  (spacemacs/set-leader-keys "sc" #'daio/no-hl)

  (defun daio/insert-single-quotes ()
    (interactive)
    (insert "‘’")
    (backward-char))
  (daio/bind "C-`" 'daio/insert-single-quotes)

  (defun daio/eval-sexp-at-point (arg)
    (interactive "p")
    (forward-char)
    (eval-last-sexp nil)
    (backward-char))

  (daio/bind "C-x C-e" 'daio/eval-sexp-at-point)

  ;; Macrostep bindings
  (daio/bind "C-c C-x" 'macrostep-expand)
  (daio/bind "C-c C-l" 'macrostep-collapse)
  (daio/bind "C-c C-a" 'macrostep-collapse-all)

  ;; I often want to rename the file that I'm in ATM;
  ;; therefore this is essential.
  (defun daio/rename-file-and-buffer (new-name)
    "Renames both current buffer and file it's visiting to NEW-NAME."
    (interactive "sNew name: ")
    (let ((name (buffer-name))
          (filename (buffer-file-name)))
      (if (not filename)
          (message "Buffer '%s' is not visiting a file!" name)
        (if (get-buffer new-name)
            (message "A buffer named '%s' already exists!" new-name)
          (progn
            (rename-file filename new-name 1)
            (rename-buffer new-name)
            (set-visited-file-name new-name)
            (set-buffer-modified-p nil))))))
  (spacemacs/set-leader-keys "fm" #'daio/rename-file-and-buffer)

  ;; XXX should be in a lexical file
  (defun daio/file-jumper (filename)
    (lexical-let ((filename filename))
      (lambda ()
        (interactive)
        (find-file filename))))

  (spacemacs/set-leader-keys
    "oo" (daio/file-jumper "/keybase/private/daantjie/organiser.org"))

  (setq org-refile-targets '((org-agenda-files . (:maxlevel . 6))))

  ;; XXX should be a minor mode (called ð, no doubt)
  (defun daio/org-meta-return (orig)
    (evil-force-normal-state)
    (org-end-of-line)
    (funcall orig)
    (evil-append 1))
  (advice-add 'org-meta-return :around 'daio/org-meta-return)
  ;; Do not dim blocked tasks
  (setq org-agenda-dim-blocked-tasks nil)

  ;; Compact the block agenda view
  (setq org-agenda-compact-blocks t)

  ;; Custom agenda command definitions
  (setq org-agenda-custom-commands
        (quote (("N" "Notes" tags "NOTE"
                 ((org-agenda-overriding-header "Notes")
                  (org-tags-match-list-sublevels t)))
                ("h" "Habits" tags-todo "STYLE=\"habit\""
                 ((org-agenda-overriding-header "Habits")
                  (org-agenda-sorting-strategy
                   '(todo-state-down effort-up category-keep))))
                (" " "Agenda"
                 ((agenda "" nil)
                  (tags "REFILE"
                        ((org-agenda-overriding-header "Tasks to Refile")
                         (org-tags-match-list-sublevels nil)))
                  (tags-todo "-CANCELLED/!"
                             ((org-agenda-overriding-header "Stuck Projects")
                              (org-agenda-skip-function 'bh/skip-non-stuck-projects)
                              (org-agenda-sorting-strategy
                               '(category-keep))))
                  (tags-todo "-HOLD-CANCELLED/!"
                             ((org-agenda-overriding-header "Projects")
                              (org-agenda-skip-function 'bh/skip-non-projects)
                              (org-tags-match-list-sublevels 'indented)
                              (org-agenda-sorting-strategy
                               '(category-keep))))
                  (tags-todo "-CANCELLED/!NEXT"
                             ((org-agenda-overriding-header (concat "Project Next Tasks"
                                                                    (if bh/hide-scheduled-and-waiting-next-tasks
                                                                        ""
                                                                      " (including WAITING and SCHEDULED tasks)")))
                              (org-agenda-skip-function 'bh/skip-projects-and-habits-and-single-tasks)
                              (org-tags-match-list-sublevels t)
                              (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                              (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
                              (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
                              (org-agenda-sorting-strategy
                               '(todo-state-down effort-up category-keep))))
                  (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
                             ((org-agenda-overriding-header (concat "Project Subtasks"
                                                                    (if bh/hide-scheduled-and-waiting-next-tasks
                                                                        ""
                                                                      " (including WAITING and SCHEDULED tasks)")))
                              (org-agenda-skip-function 'bh/skip-non-project-tasks)
                              (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                              (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
                              (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
                              (org-agenda-sorting-strategy
                               '(category-keep))))
                  (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
                             ((org-agenda-overriding-header (concat "Standalone Tasks"
                                                                    (if bh/hide-scheduled-and-waiting-next-tasks
                                                                        ""
                                                                      " (including WAITING and SCHEDULED tasks)")))
                              (org-agenda-skip-function 'bh/skip-project-tasks)
                              (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                              (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
                              (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
                              (org-agenda-sorting-strategy
                               '(category-keep))))
                  (tags-todo "-CANCELLED+WAITING|HOLD/!"
                             ((org-agenda-overriding-header (concat "Waiting and Postponed Tasks"
                                                                    (if bh/hide-scheduled-and-waiting-next-tasks
                                                                        ""
                                                                      " (including WAITING and SCHEDULED tasks)")))
                              (org-agenda-skip-function 'bh/skip-non-tasks)
                              (org-tags-match-list-sublevels nil)
                              (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                              (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)))
                  (tags "-REFILE/"
                        ((org-agenda-overriding-header "Tasks to Archive")
                         (org-agenda-skip-function 'bh/skip-non-archivable-tasks)
                         (org-tags-match-list-sublevels nil))))
                 nil))))

  (setq bh/hide-scheduled-and-waiting-next-tasks t)

  (defun bh/skip-non-archivable-tasks ()
    "Skip trees that are not available for archiving"
    (save-restriction
      (widen)
      ;; Consider only tasks with done todo headings as archivable candidates
      (let ((next-headline (save-excursion (or (outline-next-heading) (point-max))))
            (subtree-end (save-excursion (org-end-of-subtree t))))
        (if (member (org-get-todo-state) org-todo-keywords-1)
            (if (member (org-get-todo-state) org-done-keywords)
                (let* ((daynr (string-to-int (format-time-string "%d" (current-time))))
                       (a-month-ago (* 60 60 24 (+ daynr 1)))
                       (last-month (format-time-string "%Y-%m-" (time-subtract (current-time) (seconds-to-time a-month-ago))))
                       (this-month (format-time-string "%Y-%m-" (current-time)))
                       (subtree-is-current (save-excursion
                                             (forward-line 1)
                                             (and (< (point) subtree-end)
                                                  (re-search-forward (concat last-month "\\|" this-month) subtree-end t)))))
                  (if subtree-is-current
                      subtree-end ; Has a date in this month or last month, skip it
                    nil))  ; available to archive
              (or subtree-end (point-max)))
          next-headline))))

  (defun daio/wrap-end (char)
    (interactive "c")
    (save-excursion
      (insert char)
      (end-of-line)
      (insert char)))

  (daio/bind "M-*" 'daio/wrap-end)

  ;; Default behaviour for `s' is overridden by both `evil-surround' and
  ;; `evil-snipe' -- so I map it to `-'.
  (defun daio/normalize-org-header-size ()
    "Stop the org-level headers from increasing in height relative to the other text."
    (dolist (face '(org-level-1
                    org-level-2
                    org-level-3
                    org-level-4
                    org-level-5
                    org-level-6
                    org-level-7
                    org-level-8))
      (set-face-attribute face nil :font "Inconsolata" :weight 'normal :height 1.0)))
  (add-hook 'org-mode-hook #'daio/normalize-org-header-size)
  ;; The `:after' keyword is necessary!
  (advice-add 'spacemacs/cycle-spacemacs-theme :after #'daio/normalize-org-header-size)
  (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
  (global-fci-mode 1)

  (defun daio/normalise-font-latex-verbatim-face ()
    "Set the verbatim font in latex to something readable."
    (set-face-attribute 'font-latex-verbatim-face nil
                        :font "Inconsolata"
                        :weight 'normal
                        :height 1.0))

;;; MAKING ELISP BETTER

  (gv-define-setter plist-get (val plist prop) `(plist-put ,plist ,prop ,val))

;;; compact display
  (defun daio/pretty-functional ()
    (interactive)
    (mapc (lambda (pair)
            (let ((regexp (car pair))
                  (symbol (cdr pair)))
              (font-lock-add-keywords 'emacs-lisp-mode
                                      `((,regexp
                                         (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                                                   ,symbol)
                                                   nil)))))))
          '(("(\\(-compose\\)[ \t\n\r]" . ?\∘)
            ("(\\(-partial\\)[ \t\n\r]" . ?\»)
            ("(\\(-rpartial\\)[ \t\n\r]" . ?\«)
            ("(\\(lambda\\)[ \t\n\r]" . ?\↦)
            ("(\\(-not\\)[ \t\n\r]" . ?\¬)
            ("(\\(funcall\\)[ \t\n\r]" . ?\⇈)
            ("(\\(apply\\)[ \t\n\r]" . ?\⇊))))

  (defun daio/read-last-sexp-and-set-to (sym)
    (interactive "SSymbol: ")
    (set sym (read (thing-at-point 'sexp))))

  ;; (daio/bind "C-$" 'daio/read-last-sexp-and-set-to)

  (defmacro daio/with-sparse-keymap (&rest body)
    (declare (indent 0))
    (let ((mapvar (make-symbol "*map*")))
      `(let ((,mapvar (make-sparse-keymap)))
         ,@body
         ,mapvar)))

  (defun daio/haskell-o ()
    (interactive)
    (end-of-line)
    (haskell-indentation-newline-and-indent)
    (evil-insert 1))

  (defvar daio/haskell-mode-map
    (let ((map (make-sparse-keymap)))
      (evil-define-key 'normal map "o" 'daio/haskell-o)
      (daio/bind "M-s-." 'daio/insert-angle-pair)
      map))

  (evil-leader/set-key-for-mode 'haskell-mode "i" 'hindent-reformat-buffer)

  (define-minor-mode daio/haskell-mode
    "Shadowings for Haskell Mode"
    :lighter "ð"
    :keymap daio/haskell-mode-map)

  (defun daio/geiser-eval-sexp-at-point (arg)
    (interactive "p")
    (forward-char)
    (geiser-eval-last-sexp nil)
    (backward-char))

  (defvar daio/geiser-mode-map
    (let ((map (make-sparse-keymap)))
      (daio/bind "C-x C-c" 'daio/geiser-eval-sexp-at-point)
      map))

  (define-minor-mode daio/geiser-mode
    "Shadowings for Geiser/Scheme Mode"
    :lighter "ð"
    :keymap daio/geiser-mode-map)

  (defun daio/insert-angle-pair ()
    (interactive)
    (insert "<>")
    (backward-char))

  (bedlam-add-hooks
      (haskell-mode-hook)
    (daio/haskell-mode
     intero-mode
     haskell-indentation-mode))

  (bedlam-add-hooks
      (latex-mode-hook)
    (electric-pair-mode
     daio/normalise-font-latex-verbatim-face))

  (defun daio/line-length () (length (thing-at-point 'line t)))

  (defun daio/flush-right (&optional n)
    (interactive)
    (let ((n (or n 80)))
      (while (> n (daio/line-length))
        (save-excursion
          (beginning-of-line)
          (insert " ")))))

  (daio/bind "C-$" 'daio/flush-right)

  (defun daio/kill-to-bol ()
    (interactive)
    (kill-region
     (save-excursion (beginning-of-line) (point))
     (point)))

  (daio/bind "C-M-^" 'daio/kill-to-bol)

  (defun daio/inserter (keys insert)
    (daio/bind keys (lambda ()
                      (interactive)
                      (insert insert))))

  (defun daio/parse-inserter-binding (binding)
    (if (consp (cadr binding))
        ))

  (defmacro daio/inserters (bindings))

  (daio/inserters
   ("C-s"
    ("l" ?\λ)
    ("f" ?\ƒ)
    ("-" ?\→)
    ("a" ?\α)
    ("y" ?\ψ)
    ("o" ?\◊)
    ("." ?\•)))

  ;; XXX should be in a lexical file
  (defun daio/bind-char (keys char)
    (lexical-let ((char char))
      (daio/bind keys (lambda () (interactive) (insert char)))))

  (daio/bind-char "C-s-l" "\u03bb")     ; λ lambda
  (daio/bind-char "C-s-f" "\u0192")     ; ƒ function
  ;; (daio/bind-char "C-s--" "\u2192") ; → right arrow
  (daio/bind-char "C-s-a" "\u03b1")     ; α alpha
  (daio/bind-char "C-s-y" "\u03c8")     ; ψ psi

  (daio/bind-char "s-C-o" ?\◊)
  (daio/bind-char "s-C-." ?\•)
  (daio/bind-char "s-C-[" ?\［)
  (daio/bind-char "s-C-]" ?\］)
  (daio/bind-char "s-C-*" ?\★)
  (daio/bind-char "s-C--" ?\⟶)
  (daio/bind-char "s-C-_" ?\⟵)
  (daio/bind-char "s-C-=" ?\⟹)
  (daio/bind-char "s-M-=" ?\⟸)

  (daio/bind-char "s-M--" ?\☛)
  (daio/bind-char "s-M-_" ?\☚)

  (flycheck-define-checker proselint
    "A linter for prose."
    :command ("proselint" source-inplace)
    :error-patterns
    ((warning line-start (file-name) ":" line ":" column ": "
              (id (one-or-more (not (any " "))))
              (message (one-or-more not-newline)
                       (zero-or-more "\n" (any " ") (one-or-more not-newline)))
              line-end))
    :modes (text-mode markdown-mode gfm-mode pollen-mode))
  (add-to-list 'flycheck-checkers 'proselint)


  (add-to-list 'emacs-lisp-mode-hook 'daio/pretty-functional)
  ;; (add-to-list 'emacs-lisp-mode-hook (lambda ()
  ;;                                      (require 'buttercup)))

  (defmacro binary->nary (name fn &rest initial-args)
    `(defmacro ,name (&rest bindings)
       `(let (forms)
          (while bindings
            (let ((x (pop bindings))
                  (y (pop bindings)))
              `(fn ,,@initial-args x y))))))

  (binary->nary daio/binds daio/bind)

;;; color these functions like keywords
  (font-lock-add-keywords 'emacs-lisp-mode
                          '(("(\\(compose\\)[ \t\n\r]" 1 font-lock-keyword-face)
                            ("(\\(curry\\)[ \t\n\r]" 1 font-lock-keyword-face)
                            ("(\\(rcurry\\)[ \t\n\r]" 1 font-lock-keyword-face)
                            ("(\\(lambda\\)[ \t\n\r]" 1 font-lock-keyword-face)
                            ("(\\(complement\\)[ \t\n\r]" 1 font-lock-keyword-face)
                            ("(\\(funcall\\)[ \t\n\r]" 1 font-lock-keyword-face)
                            ("(\\(apply\\)[ \t\n\r]" 1 font-lock-keyword-face)))

  (slack-register-team
   :name "ermattet"
   :default t
   :client-id "94942983154.101936317568"
   :client-secret "91815509e75d3d97765713851630bd30"
   :token "xoxp-94942983154-94874693747-101937204320-dce9e0e948205c4e952e12372ea6bab4")

  (evil-define-key 'normal slack-info-mode-map
    ",u" 'slack-room-update-messages)
  (evil-define-key 'normal slack-mode-map
    ",c" 'slack-buffer-kill
    ",ra" 'slack-message-add-reaction
    ",rr" 'slack-message-remove-reaction
    ",rs" 'slack-message-show-reaction-users
    ",pl" 'slack-room-pins-list
    ",pa" 'slack-message-pins-add
    ",pr" 'slack-message-pins-remove
    ",mm" 'slack-message-write-another-buffer
    ",me" 'slack-message-edit
    ",md" 'slack-message-delete
    ",u" 'slack-room-update-messages
    ",2" 'slack-message-embed-mention
    ",3" 'slack-message-embed-channel
    "\C-n" 'slack-buffer-goto-next-message
    "\C-p" 'slack-buffer-goto-prev-message)
  (evil-define-key 'normal slack-edit-message-mode-map
    ",k" 'slack-message-cancel-edit
    ",s" 'slack-message-send-from-buffer
    ",2" 'slack-message-embed-mention
    ",3" 'slack-message-embed-channel))
;; *******************************
;; END OF dotspacemacs/user-config
;; *******************************

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#ede9e7" "#ef001b" "#8cc610" "#eea806" "#23cbfe" "#ec3691" "#1ee079" "#272b34"])
 '(compilation-message-face (quote default))
 '(evil-want-Y-yank-to-eol t)
 '(fci-rule-color "#20240E")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#20240E" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#20240E" . 100))))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode anaconda-mode pythonic company-pollen tree-mode web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc coffee-mode evil-lispy feature-mode vertigo lispy zoutline swiper ivy scribble-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode sage-shell-mode deferred idris-mode prop-menu solarized-theme darktooth-theme company-coq company-math math-symbol-lists auctex-latexmk auctex yaml-mode selectric-mode vimrc-mode dactyl-mode slime-company hide-comnt pollen-mode w3m eval-sexp-fu xterm-color ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org sx spray speed-type spacemacs-theme spaceline smex smeargle slime slack shell-pop restart-emacs ranger rainbow-mode rainbow-identifiers rainbow-delimiters quelpa popwin persp-mode pcre2el paradox orgit org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file neotree nameless multi-term move-text monokai-theme mmm-mode minesweeper markdown-toc magit-gitflow lorem-ipsum linum-relative link-hint lentic intero info+ indent-guide ido-vertical-mode icicles hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-hoogle helm-gitignore helm-flx helm-descbinds helm-ag haskell-snippets google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md geiser flycheck-pos-tip flycheck-haskell flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-snipe evil-search-highlight-persist evil-paredit evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eshell-z eshell-prompt-extras esh-help erc-yt erc-view-log erc-social-graph erc-image erc-hl-nicks elisp-slime-nav dumb-jump define-word dash-functional company-ghci company-ghc column-enforce-mode color-identifiers-mode cmm-mode clean-aindent-mode cask-mode buttercup auto-highlight-symbol auto-compile anaphora aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#20240E" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
