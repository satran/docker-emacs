;; Clean up the UI, no menubar, scrollbars and toolbar
;;(add-to-list 'default-frame-alist '(menu-bar-lines . 0))
(add-to-list 'default-frame-alist '(tool-bar-lines . 0))
(add-to-list 'default-frame-alist '(vertical-scroll-bars . nil))

;; Optimization
;; Set the number of bytes of consing before garbage collection
;; Small hack to make the init time a bit faster
(setq gc-cons-threshold 100000000)

;; Clean up the UI, no menubar, scrollbars and toolbar
(add-to-list 'default-frame-alist '(menu-bar-lines . 0))
(add-to-list 'default-frame-alist '(tool-bar-lines . 0))
(add-to-list 'default-frame-alist '(vertical-scroll-bars . nil))

;; Set required environment variables
(setenv "GOROOT" "/usr/local/go")
(setenv "EDITOR" "emacs")
(setenv "VISUAL" "emacs")
(setenv "PATH" (concat (getenv "PATH") ":" (concat (getenv "HOME") "/go/bin")))
(setenv "PATH" (concat (getenv "PATH") ":" "/usr/local/go/bin"))
(setenv "PATH" (concat (getenv "PATH") ":" "/usr/local/bin"))
(setenv "GOPATH" (if (getenv "GOPATH") (getenv "GOPATH") (getenv "HOME")))

;; Folder Structure
;; Set the default load-directory
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

;; Add my site-lisp packages
(let ((default-directory  "~/.emacs.d/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

;; Packages
(require 'package)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Load use-package
(require 'use-package)

;; I am not entirely sure of these settings
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)


;; Set the window frame size
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 84))

;; Have those awesome matching pairs
(electric-pair-mode t)

;; Highlight matching parenthesis
(show-paren-mode 1)

;; Settings for enforcing to use UNIX endlines
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
;;(set-default default-buffer-file-coding-system 'utf-8-unix)

;; Set such that emacs does not use the ugly word-wrapping
(global-visual-line-mode 1)

;; Show time in the mode line
(display-time-mode t)

;; Use vertical splitting more often than horizontal
(setq split-height-threshold 200)

;; C-v and M-v don't undo each other, because the point position isn't
;; preserved. Fix that.
(setq scroll-preserve-screen-position 'always)

;; Do not pollute the working directory. Add it to emacs folder.
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; Save history
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
        search-ring
        regexp-search-ring))

;; When you start typing and text is selected, replace it with what
;; you are typing, or pasting, or whatever.
(delete-selection-mode 1)

;; Change typing yes to y and no to n in minibuffer
(fset 'yes-or-no-p 'y-or-n-p)

;; Disable beep when doing incorrect actions
(setq ring-bell-function 'ignore)

;; Set columns
(column-number-mode 1)

;; Disable splash screen
(setq inhibit-startup-message t)

;; Set the cursor to a bar
(setq-default cursor-type 'bar)

;; Highlighting current line
;;(global-hl-line-mode 1)

;; Adding custom theme directory and include elpa themes as well
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa")

;;(load-theme 'plain t)
;; Disable font highlighting
(global-font-lock-mode 0)

;; Go
(use-package go-eldoc)
(use-package go-mode
  :config
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  ;;(add-hook 'go-mode-hook 'flycheck-mode)
  (add-hook 'go-mode-hook 'go-eldoc-setup)
  (add-hook 'go-mode-hook (lambda ()
                            (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
  (add-hook 'go-mode-hook
      (lambda ()
        (set (make-local-variable 'company-backends) '(company-go))
        (company-mode)))
  (add-hook 'go-mode-hook (lambda ()
                            (local-set-key (kbd "C-c i") 'go-goto-imports)))
  (add-hook 'go-mode-hook (lambda ()
                            (local-set-key (kbd "M-.") 'godef-jump)))
  (add-hook 'go-mode-hook (lambda ()
                            (local-set-key (kbd "M-,") 'godef-jump-other-window))))

;; Ibuffer
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ;;("go" (mode . go-mode))
               ;;("dired" (mode . dired-mode))
               ;;("org" (name . "^.*org$"))
               ;;("shell" (or (mode . eshell-mode) (mode . shell-mode)))
               ;;("emacs-conf" (mode . emacs-lisp-mode))
               ;;("emacs" (or
               ;;            (name . "^\\*scratch\\*$")
               ;;            (name . "^\\*Completions\\*$")
               ;;            (name . "^\\*Messages\\*$")))
	       ("helm" (name . "^\\*helm.*"))
               ))))

(setq ibuffer-hidden-filter-groups '("helm"))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-auto-mode 1)
            (ibuffer-switch-to-saved-filter-groups "default")))

(setq ibuffer-default-sorting-mode (quote recency))
(setq ibuffer-formats
   (quote
    ((mark " "
	   (name))
     (mark " "
	   (name 16 -1)
	   " " filename)
     (mark modified read-only " "
	   (name 18 18 :left :elide)
	   " "
	   (size 9 -1 :right)
	   " "
	   (mode 16 16 :left :elide)
	   " " filename-and-process))))

;; Don't show filter groups if there are no buffers in that group
(setq ibuffer-show-empty-filter-groups nil)

;; Don't ask for confirmation to delete marked buffers
(setq ibuffer-expert t)

(defvar name-counter 0)

(defun new-shell-name ()
  (setq name-counter (+ 1 name-counter))
  (concat "shell-" (number-to-string name-counter)))

(defun new-shell ()
  (interactive)
  (shell (new-shell-name)))

(global-set-key (kbd "C-S-z") 'new-shell)

(defvar previous-command nil)

(defun replace-with-shell-output ()
  (interactive)
  (let ((cmd (read-shell-command "Shell command on region: " previous-command))
        (buffer (current-buffer)))
    (setq previous-command cmd)
    (shell-command-on-region
     (region-beginning) (region-end) cmd buffer t)))

(global-set-key (kbd "<M-return>") 'replace-with-shell-output)

;; IDO
(ido-mode t)

(use-package ido-vertical-mode
  :config (ido-vertical-mode 1))

;; Do the fuzzy matching bit
(setq ido-enable-flex-matching t)

;; Preventing auto-searches unless called explicitly
(setq ido-auto-merge-work-directories-length -1)

;; disable auto searching for files unless called explicitly
(setq ido-auto-merge-delay-time 99999)

;; Keybindings to move up and down similar to emacs buffers
(setq ido-vertical-define-keys (quote C-n-C-p-up-down-left-right))

;; Smex
(use-package smex
  :config (autoload 'smex "smex")
  :bind (("M-x" . smex)))

;; Keybindings
;; Move past a given character, like vims f
(defun move-past-next-char (x)
  "Move the next occurrence of the character x"
  (interactive "k")
  (search-forward x))

;; Global Keybindings
(global-set-key (kbd "C-z") 'shell)
(global-set-key (kbd "C-M-z") 'ansi-term)

(global-set-key (kbd "C-x C-j") 'next-buffer)
(global-set-key (kbd "C-x C-k") 'previous-buffer)

(global-set-key (kbd "C-x g") 'magit-status)

;; Settings keybindings for Scroll line by line.
(global-set-key (kbd "C-M-g") 'scroll-up-line)
(global-set-key (kbd "C-M-y") 'scroll-down-line)

(global-set-key (kbd "C-S-f") 'speedbar-get-focus)

;; More reasonable next windows
(global-set-key "\C-x\C-n" 'next-multiframe-window)
(global-set-key "\C-x\C-p" 'previous-multiframe-window)
(global-set-key (kbd "C-x n") 'next-multiframe-window)
(global-set-key (kbd "C-x p") 'previous-multiframe-window)

(global-set-key "\C-\M-f" 'move-past-next-char)
(global-set-key [f11] 'fullscreen)

(global-set-key (kbd "M-[") 'insert-pair)
(global-set-key (kbd "M-{") 'insert-pair)
(global-set-key (kbd "M-\"") 'insert-pair)

;; Move across split windows using the shit+arrow keys
(windmove-default-keybindings)

(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Autocompletion
(add-hook 'after-init-hook 'global-company-mode)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe ((t nil)))
 '(org-level-1 ((t nil)))
 '(org-level-2 ((t nil)))
 '(org-level-3 ((t nil)))
 '(org-level-4 ((t nil)))
 '(org-level-5 ((t nil)))
 '(org-level-6 ((t nil)))
 )
