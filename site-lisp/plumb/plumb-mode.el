;;;; plumb.el --- Plan9 style plumbing for Emacs

;; Author: Satyajit Ranjeev <s@ranjeev.in>
;; Version: 0.1
;; Keywords: plan9 plumb
;; URL: http://satran.in/plumb

;;;; Commentary:
;; This tries to emulate Plan9's plumbing mechanism.
;; You can specify custom plumb commands by setting the varible plumb-plumbing


(defun buffer-mode (buffer-or-string)
  "Returns the major mode associated with a buffer."
  (with-current-buffer buffer-or-string
     major-mode))

(defun plumb/open-file (filename)
  "opens file with line number"
  (message filename)
  (let* ((chunks (split-string filename ":")))
    (find-file-other-window (car chunks))
    (let ((line-no (nth 1 chunks)))
      (when line-no
	(beginning-of-buffer)
	(forward-line (- (string-to-number line-no) 1))))))

(defun plumb/plumb ()
  "plan9 style plumbing"
  (interactive)
  (cond
   ((string= "shell-mode" (buffer-mode (current-buffer)))
    (let ((filename (substring-no-properties (thing-at-point 'filename))))
      (when (> (length filename) 0)
	(plumb/open-file filename))))
   ((string= "emacs-lisp-mode" (buffer-mode (current-buffer)))
    (let ((word (substring-no-properties (thing-at-point 'symbol))))
      (message word)
      (describe-function (intern word))))))

;;;###autoload
(define-minor-mode plumb-mode
  "Emulates Plan9 Plumbing mechanism"
  :lighter " plumb"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "<C-return>") 'plumb/plumb)
            map))


;;;###autoload
(add-hook 'emacs-lisp-mode-hook 'plumb-mode)
(add-hook 'shell-mode-hook 'plumb-mode)

(provide 'plumb-mode)
