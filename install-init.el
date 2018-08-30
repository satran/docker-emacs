;; Packages
(require 'package)

(defun install ()
  (progn
    (setq package-archives
	  '(("gnu" . "https://elpa.gnu.org/packages/")
	    ("melpa" . "https://melpa.org/packages/")))
    (package-initialize)
    (package-install 'smex)))

(install)
