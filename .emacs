;;;; Package emacsrc
;; Conditionally loads the local site-lisp folder containing 42header ressources
;;(if (string= (shell-command-to-string "printf %s $(uname -s)") "Darwin")
	;;(setq config_files "/usr/share/emacs/site-lisp/")
  ;;(setq config_files (concat (getenv "DOTFILES") "/emacs/site-lisp/")))
;;(setq vc-follow-symlinks t)
;; Sourcing packages necessary for 42 header
;;(setq config_files "/usr/share/emacs/site-lisp/")
;;(setq load-path (append (list nil config_files) load-path))
;;(load "list.el") (load "string.el") (load "comments.el")

(require 'package)
(add-to-list 'load-path "/usr/share/emacs/site-lisp")
(package-initialize)
					; list the packages you want
(setq package-list '(evil base16-theme flycheck key-chord flycheck-rust cargo company racer evil evil-leader powerline magit helm evil-magit eyebrowse neotree))


					; list the repositories containing them
(setq package-archives '(("melpa-stable" . "https://stable.melpa.org/packages/")))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))


					; activate all the packages (in particular autoloads)
(package-initialize)

					; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

					; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package) (package-install package)))


;; A few default settings, just to make sure everything works alright
(setq-default tab-width 4)
(setq-default indent-tabs-mode t)
(global-set-key (kbd "DEL") 'backward-delete-char)
(setq-default c-backspace-function 'backward-delete-char)
(setq-default c-basic-offset 4)
(setq-default c-default-style "linux")
(setq-default tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
								64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))

(load-theme 'gruvbox-dark-soft)

;; Activates lines numbers
;;(add-hook 'prog-mode-hook (lambda() (linum-mode)))
;;(add-hook 'prog-mode-hook (lambda() (show-paren-mode)))

;; NEED MY FUCKING TABS
;; (add-hook 'prog-mode-hook (lambda() (local-set-key (kbd "TAB") 'self-insert-command)))
(add-hook 'prog-mode-hook (lambda() (local-set-key (kbd "TAB") 'tab-to-tab-stop)))

;; Enables highlight mode
(global-font-lock-mode)
(global-hi-lock-mode)

;; Every file is sent to this backup directory
(setq backup-directory-alist
	  `((".*" . "~/.emacs.d")))
(setq auto-save-file-name-transforms
	  `((".*" ,"~/.emacs.d" t)))

;;Load Helm
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)

;; Load org mode
(require 'org-install)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "e" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer)

(require 'evil-magit)
 (setq evil-magit-state 'normal)

;; Set JK to Esc
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)

;; Load evil-mode
(require 'evil)
(evil-mode 1)
(evil-select-search-module 'evil-search-module 'evil-search)
;; Remaps C-space as the ESC key. (I need C-c for idiomatic emacs, but i just cant go back to hitting esc)
(evil-define-key 'visual 'evil-visual-state-map (kbd "C-@") 'evil-force-normal-state)
(evil-define-key 'replace 'evil-replace-state-map (kbd "C-@") 'evil-force-normal-state)
  (require 'neotree)
(evil-define-key 'normal 'evil-replace-state-map (kbd "C-n") 'neotree-toggle)
 (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)

;; Powerline,powerline
(require 'powerline)
(powerline-center-evil-theme)

;; Disable toolbar mode in GUI emacs
(if (display-graphic-p)
	(progn ((tool-bar-mode -1)
			(menu-bar-mode -1)
			(scroll-bar-mode -1)))
  )

;;(load-theme 'nord 'NO-CONFIRM)

;;
;; Loading theme depending on GUI or term
;;(if (display-graphic-p)
;;	(load-theme 'nord 'NO-CONFIRM)
;;  (progn
;;	(load-theme 'atom-dark 'NO-CONFIRM)
;;	(setq atom-dark-theme-force-faces-for-mode nil)
;;	)
;;  )
;;

;;;; Do not show the startup screen
;;(setq inhibit-startup-screen t)
;;
;; Putting font
(set-default-font "Roboto Mono Medium for Powerline-11")
;;
;;;; Scroll settings
(setq scroll-margin 3
	  scroll-conservatively 10000
	  scroll-step 1)
;;
;;;;; Functions
;;;; Defining a few of my own functions
;;
;;(defun surround-region-with-paren ()
  ;;"Surrounds the active region with parentheses by killing the region, inserting parens and reinserting the region kill-ring inside"
  ;;(interactive) 
  ;;(progn
	;;(call-interactively 'kill-region)
	;;(insert "(")
	;;(insert (car kill-ring))
	;;(insert ")")))
;;
;;(evil-define-key 'visual 'evil-visual-state-map (kbd "(") 'surround-region-with-paren)
;;
;;
;;;; Setting up c comment with 42 style
;;(setq c-block-comment-prefix "** ")
;;

;;Setting up a hack for system clipboard in emacs
(if (string= (shell-command-to-string "printf %s $(uname -s)") "Darwin")
	(defun paste-from-system-clipboard ()
	  (interactive)
	  (insert (shell-command-to-string "pbpaste")))
  (defun paste-from-system-clipboard ()
	(interactive)
	(insert (shell-command-to-string "xsel --clipboard --output"))))

(if (string= (shell-command-to-string "printf %s $(uname -s)") "Darwin")
	(defun copy-region-to-system-clipboard ()
	  (interactive)
	  (call-interactively 'shell-command-on-region '"pbcopy"))
  (defun copy-region-to-system-clipboard ()
	(interactive)
	(call-interactively 'shell-command-on-region '"xsel --clipboard --input")))

;; Compile options
(setq compilation-scroll-output 1)
;;

;;;; Magit bind
;;(global-set-key (kbd "M-g") 'magit-status)

;;
;;Little function to compile projecting looking for the closest makefile in the FS

(defun my-make()
  (interactive)
  (let ((makefile-dir (locate-dominating-file "." "makefile")))
	(if makefile-dir
		(progn
		  (print (format "Found Makefile in %s" makefile-dir))
		  (compile (read-string
					"Insert make options: " (format "make -C %s " makefile-dir))))
	  (print "Makefile not found"))))

(defun shell-command-current-file ()
  "Invokes the requested shell command with path current file as argument and displays it in a buffer"
  (interactive)
  (if (buffer-file-name)
	  (shell-command (format "%s %s" (read-string "Program to invoke with current file as argument: ") (buffer-file-name)))
	(print "No file is currently open")))

(defun shell-command-current-file-to-string ()
  "Invokes the requested shell command with path current file as argument and returns it as a string"
  (interactive)
  (if (buffer-file-name)
	  (shell-command-to-string (format "%s %s" (read-string "Program to invoke with current file as argument: ") (buffer-file-name)))
	(print "No file is currently open")))

;;;; No prompt to kill buffer when theres a process running
;;(setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))

;;;; Ruby mode
;;(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
;;(setq ruby-indent-level 2)
;;(global-auto-revert-mode t)
;;
;;;; ;; Set your lisp system and, optionally, some contribs
;;;; (setq inferior-lisp-program (concat (getenv "HOME") "/.sbcl/bin/sbcl"))
;;;; (setq slime-contribs '(slime-fancy))
;;;; (slime-setup '(slime-fancy slime-company))
;;
;;;;;;;;;;; AUTO COMPLETE ;;;;;;;;;;;;;;;;;
(add-hook 'after-init-hook 'global-company-mode)
(setq company-auto-complete t)
(eval-after-load 'company
  '(progn
	 (define-key company-active-map (kbd "C-n") 'company-complete-common-or-cycle)
	 (define-key company-active-map (kbd "C-p") 'company-select-previous-or-abort)
	 (define-key company-active-map (kbd "<tab>") 'company-complete-common)))
(evil-define-key 'insert 'evil-insert-state-map (kbd "C-n") 'company-complete)
(evil-define-key 'insert 'evil-insert-state-map (kbd "C-p") 'company-complete)


					;;company is for completion
(setq racer-cmd "~/.cargo/bin/racer") ;; Rustup binaries PATH
(setq racer-rust-src-path "~/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src") ;; Rust source code PATH
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(add-hook 'rust-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c TAB") #'rust-format-buffer)))
(add-hook 'rust-mode-hook 'cargo-minor-mode)

(package-install 'exec-path-from-shell)
(exec-path-from-shell-initialize)
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)


(setq evil-emacs-state-modes (delq 'ibuffer-mode evil-emacs-state-modes))
;;
;;(add-hook 'ibuffer-hook
    ;;(lambda ()
      ;;(ibuffer-projectile-set-filter-groups)
      ;;(unless (eq ibuffer-sorting-mode 'alphabetic)
        ;;(ibuffer-do-sort-by-alphabetic))))
;;(evil-ex-define-cmd "ls" 'ibuffer)
;;;; Projectile with native indexing cus external doesnt ignore files ...
;;(projectile-mode)
;;(setq projectile-indexing-method 'native)
;;(setq projectile-globally-ignored-file-suffixes (list ".o"))
;;;; Auto revert + auto revert with version control (allows to check branch within magit without issue)
;;(auto-revert-mode t)
;;(setq auto-revert-check-vc-info t)
;;
;;(defun create-tags (dir-name)
    ;;"Create tags file."
    ;;(interactive "DDirectory: ")
    ;;(async-shell-command
     ;;(format "%s -f %s -e -R %s" "ctags" (concat
										  ;;(read-directory-name "Save TAGS to directory: " default-directory default-directory nil nil)
										  ;;"TAGS")
			 ;;(directory-file-name dir-name)))
  ;;)
;;
;;(defun projectile-create-tags ()
  ;;"Create tag file for the current projectile project"
  ;;(interactive)
    ;;(async-shell-command
     ;;(format "%s -f %s -e -R %s" "ctags" (concat (projectile-project-root) "TAGS") (projectile-project-root)))
  ;;)
 ;;;; (setq helm-projectile-fuzzy-match nil)
;;;; (require 'helm-projectile)
;;(helm-projectile-on) 
;;
;;(add-hook 'c++-mode-hook 'irony-mode)
;;(add-hook 'c-mode-hook 'irony-mode)
;;(add-hook 'objc-mode-hook 'irony-mode)
;;(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;;
;;;; Load with `irony-mode` as a grouped backend
;;(eval-after-load 'company
  ;;'(add-to-list
    ;;'company-backends '(company-irony-c-headers company-irony)))
;;
 ;;
;;(setq tags-add-tables nil)
;;
;;(add-hook 'after-init-hook (lambda ()
  ;;(when (fboundp 'auto-dim-other-buffers-mode)
    ;;(auto-dim-other-buffers-mode t))))
;;
(setq vc-follow-symlinks t)
;*******************************************************************************;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(comment-style (quote extra-line))
 '(custom-safe-themes
   (quote
	("f27c3fcfb19bf38892bc6e72d0046af7a1ded81f54435f9d4d09b3bff9c52fc1" "62c81ae32320ceff5228edceeaa6895c029cc8f43c8c98a023f91b5b339d633f" "cd4d1a0656fee24dc062b997f54d6f9b7da8f6dc8053ac858f15820f9a04a679" "d9dab332207600e49400d798ed05f38372ec32132b3f7d2ba697e59088021555" "f2dd097452b79276ce522df2f8aeb37f6d90f504529616aa46122d549910e46d" "527df6ab42b54d2e5f4eec8b091bd79b2fa9a1da38f5addd297d1c91aa19b616" "7527f3308a83721f9b6d50a36698baaedc79ded9f6d5bd4e9a28a22ab13b3cb1" "e9460a84d876da407d9e6accf9ceba453e2f86f8b86076f37c08ad155de8223c" "d494af9adbd2c04bec4b5c414983fefe665cd5dadc5e5c79fd658a17165e435a" "c4bd8fa17f1f1fc088a1153ca676b1e6abc55005e72809ad3aeffb74bd121d23" "b85fc9f122202c71b9884c5aff428eb81b99d25d619ee6fde7f3016e08515f07" "b34636117b62837b3c0c149260dfebe12c5dad3d1177a758bb41c4b15259ed7e" "c158c2a9f1c5fcf27598d313eec9f9dceadf131ccd10abc6448004b14984767c" default)))
 '(global-company-mode nil)
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(package-selected-packages
   (quote
	(gruvbox-theme nasm-mode exec-path-from-shell neotree powerline-evil base16-theme flycheck-rust flycheck evil-leader cargo eyebrowse auto-dim-other-buffers company-irony-c-headers company-irony helm-ag atom-dark-theme slime-company slime irony vagrant dockerfile-mode yaml-mode enh-ruby-mode projectile-rails helm-projectile ibuffer-projectile projectile ggtags php-mode racer babel company ac-helm auto-complete seoul256-theme moe-theme rust-mode async-await helm nord-theme subatomic-theme subatomic256-theme xterm-color green-phosphor-theme magit evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;*******************************************************************************;
;                                                                               ;
;                   42_header.el for 42 Emacs header                            ;
;                   Created on : Tue Jun 18 10:46:22 2013                       ;
;                   Made by : David "Thor" GIRON <thor@42.fr>                   ;
;                                                                               ;
;*******************************************************************************;



(require 'string)
(require 'list)
(require 'comments)



;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    filename_____________________________.ext          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: login____ <mail_______@student.42.fr>      +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: yyyy/mm/dd 15:27:11 by login____         #+#    #+#              ;
;    Updated: 2018/09/16 23:25:55 by lazrossi         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;



(global-set-key (kbd "C-c C-h") 'header-insert)
(setq write-file-hooks (cons 'header-update write-file-hooks))


(set 'user-login (let ((login (getenv "USER")))
				   (if (string= login nil)
					   "marvin"
					 login)
				   )
	 )


(set 'user-mail (let ((mail (getenv "MAIL")))
				   (if (string= mail nil)
					   "marvin@42.fr"
					 mail)
				   )
	 )


(set 'left-std-margin 5)
(set 'right-std-margin 5)
(set 'info-std-width 41)


(set 'ft-1 "        :::      ::::::::")
(set 'ft-2 "      :+:      :+:    :+:")
(set 'ft-3 "    +:+ +:+         +:+  ")
(set 'ft-4 "  +#+  +:+       +#+     ")
(set 'ft-5 "+#+#+#+#+#+   +#+        ")
(set 'ft-6 "     #+#    #+#          ")
(set 'ft-7 "    ###   ########.fr    ")
(set 'ft-std-width 25)



;*******************************************************************************;


(defun header-chop-str (str n)
  (if (> (length str) n)
	  (let* ((max (- n 3))
	  		(new (substring str 0 max)))
	  	(concat new "..."))
	str)
  )

(defun header-make-left-margin ()
  "Creates the header comments start token and left margin"
  (let ((fill (string-fill (- left-std-margin (comments-start-token-length)))))
	(concat (comments-start-token) fill))
  )

(defun header-make-right-margin ()
  "Creates the header right margin and comments end token"
  (let ((fill (string-fill (- right-std-margin (comments-end-token-length)))))
	(concat fill (comments-end-token)))
  )

(defun header-make-central-gap (left-chunk right-chunk)
  "Creates the gap between the left infos block and the right logo"
  (string-fill (- line-std-width
				  (string-length left-chunk)
				  (string-length right-chunk)))
  )

(defun header-make-file-name ()
  "Creates the 'file.ext' entry of the header."
  (let* ((filename (header-chop-str (file-name-nondirectory (buffer-file-name))
									info-std-width))
		 (fill (string-fill (- info-std-width (string-length filename)))))
	(concat filename fill))
  )

(defun header-make-by ()
  "Creates the 'By: login <mail>' entry of the header."
  (let* ((mail-span (- info-std-width (+ (length user-login) 7)))
		 (by (concat "By: " user-login " <" (header-chop-str user-mail mail-span) ">"))
		 (fill (string-fill (- info-std-width (string-length by)))))
	(concat by fill))
  )

(defun header-make-creation-date ()
  "Creates the 'Created: yyyy/mm/dd hh:mm:ss' entry of the header.'"
  (concat "Created: " (format-time-string "%Y/%m/%d %T") " by " user-login)
  )

(defun header-make-update-date ()
  "Creates the 'Updated: yyyy/mm/dd hh:mm:ss' entry of the header.'"
  (concat "Updated: " (format-time-string "%Y/%m/%d %T") " by " user-login)
  )


;*******************************************************************************;



(defun header-insert-line-01 ()
  "Line 1 of the header"
  (comments-insert-bar)
  )

(defun header-insert-line-02 ()
  "Line 2 of the header"
  (comments-insert-empty-line)
  )

(defun header-insert-line-03 ()
  "Line 3 of the header"
  (let* ((left-margin (header-make-left-margin))
		 (right-margin (header-make-right-margin))
		 (central-gap (header-make-central-gap
					   left-margin
					   (concat ft-1 right-margin))))
	(insert (concat left-margin central-gap ft-1 right-margin))
	)
  )

(defun header-insert-line-04 ()
  "Line 4 of the header"
  (let* ((left-margin (header-make-left-margin))
		 (right-margin (header-make-right-margin))
		 (filename (header-make-file-name))
		 (central-gap (header-make-central-gap (concat left-margin filename)
											   (concat ft-2 right-margin))))
	(insert (concat left-margin filename central-gap ft-2 right-margin))
	)
  )

(defun header-insert-line-05 ()
  "Line 5 of the header"
  (let* ((left-margin (header-make-left-margin))
		 (right-margin (header-make-right-margin))
		 (central-gap (header-make-central-gap left-margin
											   (concat ft-3 right-margin))))
	(insert (concat left-margin central-gap ft-3 right-margin))
	)
  )

(defun header-insert-line-06 ()
  "Line 6 of the header"
  (let* ((left-margin (header-make-left-margin))
		 (right-margin (header-make-right-margin))
		 (by (header-make-by))
		 (central-gap (header-make-central-gap (concat left-margin by)
											   (concat ft-4 right-margin))))
	(insert (concat left-margin by central-gap ft-4 right-margin))
	)
  )

(defun header-insert-line-07 ()
  "Line 7 of the header"
  (let* ((left-margin (header-make-left-margin))
		 (right-margin (header-make-right-margin))
		 (central-gap (header-make-central-gap left-margin
											   (concat ft-5 right-margin))))
	(insert (concat left-margin central-gap ft-5 right-margin))
	)
  )

(defun header-insert-line-08 ()
  "Line 8 of the header"
  (let* ((left-margin (header-make-left-margin))
		 (right-margin (header-make-right-margin))
		 (created (header-make-creation-date))
		 (central-gap (header-make-central-gap (concat left-margin created)
											   (concat ft-6 right-margin))))
	(insert (concat left-margin created central-gap ft-6 right-margin))
	)
  )

(defun header-insert-line-09 ()
  "Line 9 of the header"
  (let* ((left-margin (header-make-left-margin))
		 (right-margin (header-make-right-margin))
		 (updated (header-make-update-date))
		 (central-gap (header-make-central-gap (concat left-margin updated)
											   (concat ft-7 right-margin))))
	(insert (concat left-margin updated central-gap ft-7 right-margin))
	)
  )

(defun header-insert-line-10 ()
  "Line 10 of the header"
  (comments-insert-empty-line)
  )

(defun header-insert-line-11 ()
  "Line 11 of the header"
  (comments-insert-bar)
  )



;*******************************************************************************;



(defun header-insert ()
  "Creates a header for the current source file."
  (interactive)
  (save-excursion
	(goto-char (point-min))
	(header-insert-line-01)
	(header-insert-line-02)
	(header-insert-line-03) (newline)
	(header-insert-line-04) (newline)
	(header-insert-line-05) (newline)
	(header-insert-line-06) (newline)
	(header-insert-line-07) (newline)
	(header-insert-line-08) (newline)
	(header-insert-line-09) (newline)
	(header-insert-line-10)
	(header-insert-line-11)
	)
  )


(defun header-update ()
  "Updates the header for the current source file."
  (interactive)
  (save-excursion
    (if (buffer-modified-p)
        (progn
          (goto-char (point-min))
          (if (search-forward "Updated" nil t)
              (progn
                (delete-region
                 (progn (beginning-of-line) (point))
                 (progn (end-of-line) (point)))
				(header-insert-line-09)
                (message "Header up to date."))))))
  nil)



;******************************************************************************;
(provide 'header)
