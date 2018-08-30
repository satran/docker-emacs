;;; plain-theme.el - A minimalistic Emacs 24 theme

;; Copyright (C) 2017 Satyajit Ranjeev

;; Author: Satyajit Ranjeev <s [at] ranjeev.in>
;; Keywords: color, theme, minimal

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; A distraction free color scheme

(autothemer-deftheme
 plain "This is a rather pointless theme"
 ((((class color) (min-colors #xFFFFFF)) ;; color column 1 GUI/24bit
   ((class color) (min-colors #xFF)))

  (foreground "#eee8d5" "white")
  (background "#2f2f2f" "#2f2f2f")
  (keyword "tan" "tan")
  (ccursor "#eee8d5" "white")
  (border "grey10" "grey10")
  (minibuffer foreground foreground)
  (region "dark slate gray" "dark slate gray")
  (comment-delimiter "grey40" "grey40")
  (comment "grey40" "grey40")
  (constant keyword keyword)
  (string "cornsilk4" "cornsilk4")
  (modeline-foreground foreground foreground)
  (modeline-background "grey18" "grey18")
  (modeline-foreground-inactive comment comment)
  (modeline-background-inactive background background)
  (hl-background "grey14" "grey14")
  (hl-face-background nil nil)
  (linum "grey30" "grey30")
  (failure "red" "red")
  (org-background "grey8" "grey8"))

 ((default (:background background :foreground foreground))
   (cursor (:background ccursor :inverse-video t))
   (vertical-border (:foreground border))

   ;; minibuffer
   (minibuffer-prompt (:foreground minibuffer))

   ;; region
   (region (:background region))
   (secondary-selection (:background region))

   ;; fringe
   (fringe (:background background :foreground foreground))
   
   ;; faces
   (font-lock-builtin-face (:foreground keyword))
   (font-lock-constant-face (:foreground keyword))
   (font-lock-keyword-face (:foreground keyword))
   (font-lock-type-face (:foreground keyword))
   (font-lock-function-name-face (:foreground keyword))
   (font-lock-variable-name-face (:foreground keyword))

   (font-lock-comment-delimiter-face (:foreground comment-delimiter))
   (font-lock-comment-face (:foreground comment))
   (font-lock-doc-face (:inherit (font-lock-comment-face)))
   (font-lock-string-face (:foreground foreground :foreground string))

   ;; faces used by isearch
   (isearch (:foreground foreground :background region))
   (isearch-fail (:foreground failure))
   (lazy-highlight (:foreground foreground :background region))

   ;; ido-mode
   (ido-subdir (:foreground foreground ))
   (ido-only-match (:foreground foreground))

   ;; show-paren
   (show-paren-match (:background region))
   (show-paren-mismatch (:foreground failure))

   ;; modeline
   (mode-line (:overline border
			      :underline nil
			      :foreground modeline-foreground
			      :background modeline-background
			      :box (:line-width 1 :color border)))
   (mode-line-inactive (
				       :overline border
				       :underline nil
				       :foreground modeline-foreground-inactive
				       :background modeline-background-inactive
				       :box (:line-width 1 :color border)))

   ;; hl-line-mode
   (hl-line (:background hl-background))
   (hl-line-face (:background hl-face-background))

   ;; linum mode
   (linum ((t (:foreground linum :height 0.8))))
   ;; auto-complete
   (ac-candidate-face (:background modeline-background :foreground foreground))
   (ac-selection-face (:background region :foreground foreground))
   (ac-candidate-mouse-face (:background region :foreground foreground))
   (ac-completion-face (:foreground comment :underline t))
   (ac-gtags-candidate-face (:background modeline-background :foreground string))
   (ac-gtags-selection-face (:background region :foreground comment))
   (popup-summary-face (:background modeline-background :foreground comment))

   ;; org mode
   (org-document-title (:foreground foreground))

   (org-link (:background org-background :foreground foreground :underline t))
   (org-tag (:background org-background :foreground foreground))
   (org-warning (:background region :foreground foreground))
   (org-todo (:background region :foreground foreground))
   (org-done (:background region :foreground foreground))

   ;; ERC settings
   (erc-current-nick-face (:foreground foreground  :underline nil))
   (erc-default-face (:foreground foreground))
   (erc-input-face (:foreground foreground))
   (erc-nick-default-face (:foreground keyword))
   (erc-notice-face (:foreground foreground))

   ;; helm
   (helm-header (:background background :foreground comment))
   (helm-source-header (:background background :foreground comment))
   (helm-selection (:background region))
   (helm-selection-line (:background background :foreground foreground))
   (helm-ff-dotted-directory (:background background :foreground comment))
   (helm-ff-dotted-symlink-directory (:background background :foreground foreground))
   (helm-visible-mark (:background background :foreground foreground))
   (helm-candidate-number (:background background :foreground foreground))
   (helm-separator (:background background :foreground foreground))
   (helm-time-zone-current (:background background :foreground foreground))
   (helm-time-zone-home (:background background :foreground foreground))
   (helm-bookmark-addressbook (:background background :foreground foreground))
   (helm-bookmark-directory (:background background :foreground foreground))
   (helm-bookmark-file (:background background :foreground foreground))
   (helm-bookmark-gnus (:background background :foreground foreground))
   (helm-bookmark-info (:background background :foreground foreground))
   (helm-bookmark-man (:background background :foreground foreground))
   (helm-bookmark-w3m (:background background :foreground foreground))
   (helm-buffer-not-saved (:background background :foreground foreground))
   (helm-buffer-process (:background background :foreground foreground))
   (helm-buffer-saved-out (:background background :foreground foreground))
   (helm-buffer-size (:background background :foreground foreground))
   (helm-buffer-directory (:background background :foreground foreground))
   (helm-lisp-completion-info (:background background :foreground foreground))
   (helm-lisp-show-completion (:background background :foreground foreground))
   (helm-locate-finish (:background background :foreground foreground))
   (helm-dotted-symlink-directory (:background background :foreground foreground))
   (helm-ff-dotted-symlink-directory (:background background :foreground foreground))
   (helm-ff-directory (:background background :foreground foreground))
   (helm-ff-file (:background background :foreground foreground))
   (helm-ff-executable (:background background :foreground foreground))
   (helm-ff-invalid-symlink (:background background :foreground foreground))
   (helm-ff-symlink (:background background :foreground foreground))
   (helm-ff-prefix (:background background :foreground foreground))
   (helm-grep-cmd-line (:background background :foreground foreground))
   (helm-grep-file (:background background :foreground foreground))
   (helm-grep-finish (:background background :foreground foreground))
   (helm-grep-lineno (:background background :foreground foreground))
   (helm-match (:background background :foreground foreground))
   (helm-grep-match (:background background :foreground foreground))
   (helm-grep-running (:background background :foreground foreground))
   (helm-moccur-buffer (:background background :foreground foreground))
   (helm-mu-contacts-address-face (:background background :foreground foreground))
   (helm-mu-contacts-name-face (:background background :foreground foreground))
   (helm-M-x-key (:background background :foreground foreground)))

 
 
 (custom-theme-set-variables 'plain
			     `(ansi-color-names-vector [])))
(provide-theme 'plain)
