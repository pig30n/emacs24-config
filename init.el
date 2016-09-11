;; Package
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;;Const
(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

;;Alias
(defalias 'yes-or-no-p 'y-or-n-p)

;;Modules
(add-to-list 'load-path "~/.emacs.d/opt")
(add-to-list 'load-path "~/.emacs.d/opt/c")
;;(require 'setup-skeletor)
(require 'setup-c)

;; Skeletor
(skeletor-define-template "c-project"
  :title "C Project"
  :substitutions
  '(("__FIRST-FILE__" . (lambda () (read-string "First File: "))))
  :default-license ("dwtfyw")
  :requires-executables '(("make" . "http://www.gnu.org/software/make/")
						  ("git" . "https://git-scm.com/")))


(setq skeletor-user-directory "~/.emacs.d/templates")
