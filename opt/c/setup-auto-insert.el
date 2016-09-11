(auto-insert-mode)

(setq
 time-stamp-active t
 time-stamp-line-limit 5
 time-stamp-start "@modified"
 time-stamp-end "\n"
 time-stamp-format " %04y-%02m-%02d %02H:%02M:%02S (%Z)")

(add-hook 'before-save-hook 'time-stamp)

(define-skeleton skeleton-header
  "Inserts header"
  "@brief "
  "/**\n *"\n
  "* @file "(file-relative-name (buffer-file-name) "../")\n
  "* @modified"\n
  "* @author "(user-login-name)\n
  "* @brief "str | " *** Description *** "\n
  "*"\n
  "*\/"\n
  _)

(define-skeleton skeleton-makefile-header
  "Inserts header"
  "@brief "
  "\#\#"\n
  "\#\#"\n
  "\#\# @file "(file-relative-name (buffer-file-name) "../")\n
  "\#\# @modified"\n
  "\#\# @author "(user-login-name)\n
  "\#\# @brief "str | " *** Description *** "\n
  "\#\#"\n
  "\#\#"\n
  _)

(define-skeleton skeleton-c-header
  "Inserts C/C++ header"
  nil
  (progn (skeleton-header) nil)\n
  "#include \""(file-name-sans-extension (file-name-nondirectory (buffer-file-name)))".h\""\n
  _)

(define-skeleton skeleton-h-header
  "Inserts H header"
  nil
  (progn (skeleton-header) nil)\n
  "#ifndef "(upcase (file-name-sans-extension (file-name-nondirectory (buffer-file-name))))"_H"\n
  ""_""\n
  "#define "(upcase (file-name-sans-extension (file-name-nondirectory (buffer-file-name))))"_H"\n
  "#endif \/\*"(upcase (file-name-sans-extension (file-name-nondirectory (buffer-file-name))))"_H\*\/"\n
  )

(define-auto-insert '("\\.c\\'" . ".c file") 'skeleton-c-header)
(define-auto-insert '("\\.h\\'" . ".h file") 'skeleton-h-header)
(define-auto-insert '("[Mm]akefile\\'" . "makefile") 'skeleton-makefile-header)

(provide 'setup-auto-insert)
