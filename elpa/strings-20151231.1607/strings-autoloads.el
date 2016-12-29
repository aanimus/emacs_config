;;; strings-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "strings" "strings.el" (22546 12306 0 0))
;;; Generated autoloads from strings.el

(autoload 'empty-name-p "strings" "\
Nil if NAME is nil or \"\", else t.

\(fn NAME)" nil t)

(autoload 'non-empty-name-p "strings" "\
NAME if non-nil and not \"\", else nil.

\(fn NAME)" nil t)

(autoload 'display-lines-containing "strings" "\
Display in BUFFER the lines of `current-buffer' containing STRING.
See also command `occur' which does this and much more.  As this does
less, it can be useful if you intend to manipulate the contents of
BUFFER, not just use it to find things in the `current-buffer'.

BUFFER is a buffer or its name (a string).  STRING is a string.
Optional third argument FLUSH-P, if non-nil, means to display lines of
`current-buffer' that do *not* contain STRING.
Interactively:
  BUFFER defaults to buffer \"*Lines Containing*\".
  STRING is read in the minibuffer, and defaults to `current-line-string'.
  FLUSH-P is the prefix argument.

\(fn BUFFER STRING &optional FLUSH-P)" t nil)

(autoload 'erase-nonempty-inactive-minibuffer "strings" "\
Erase the minibuffer, if inactive and not `minibuffer-empty-p'.
To do this at each user input event:
   (add-hook 'pre-command-hook 'erase-nonempty-inactive-minibuffer).

Note that `minibuffer-empty-p' is not infallible.  To make sure the
minibuffer is emptied, you can use the surer, though slower, function
`erase-inactive-minibuffer'.

\(fn)" t nil)

(autoload 'erase-inactive-minibuffer "strings" "\
Erase the minibuffer (remove its contents), provided it is inactive.
To ensure that the minibuffer is erased at each user input, do this:
   (add-hook 'pre-command-hook 'erase-inactive-minibuffer).
This is generally costly, however.  For a faster, though less sure,
alternative, see `erase-nonempty-inactive-minibuffer'.

\(fn)" t nil)

(autoload 'concat-w-faces "strings" "\
Return the string that is the concatenation of all ARGUMENTS.
Text (face) properties of any string arguments are preserved.

This is obsolete.  Use `concat' with `put-text-property' or
`propertize' now.

Items in arg list may be strings or numbers (see `insert-string'), or
nil (ignored).  As a special case, they may also be lists of the form
\(FACE OBJECT), where OBJECT is an object to be converted to a string
via (format \"%s\"), and FACE is the face in which to display the
resulting string.  If OBJECT is a string, any text properties
belonging to it are ignored.

NOTE: For versions of Emacs that do not have faces, a list of
      (FACE OBJECT) is simply treated as the string resulting from
      (format \"%s\" OBJECT).

\(fn &rest ARGUMENTS)" t nil)

(autoload 'insert-in-minibuffer "strings" "\
Insert ARGUMENTS in minibuffer, indefinitely, preserving faces.
The minibuffer is not erased before display.  If you want to ensure
that the minibuffer is erased at each user input event, then do this:
    (add-hook 'pre-command-hook 'erase-inactive-minibuffer)
or  (add-hook 'pre-command-hook 'erase-nonempty-inactive-minibuffer)

Text (face) properties of string arguments are preserved.

Items in arg list may be strings or numbers (see `insert-string'), or
nil (ignored).  As a special case, they may also be lists of the form
\(FACE OBJECT), where OBJECT is an object to be converted to a string
via (format \"%s\"), and FACE is the face in which to display the
resulting string.  If OBJECT is a string, any text properties
belonging to it are ignored.

NOTE: For versions of Emacs that do not have faces, a list of
      (FACE OBJECT) is simply treated as the string resulting from
      (format \"%s\" OBJECT).

\(fn &rest ARGUMENTS)" t nil)

(autoload 'display-in-minibuffer "strings" "\
Display ARGUMENTS in minibuffer, preserving their face properties.
This function essentially allows you to display messages with faces.

First arg OPTION determines the display behavior, as follows:

 OPTION values `event', `new', and a `natnump' erase the minibuffer
 before displaying.  Other values do not.  They are intended for later
 use to add to the contents of the minibuffer.

 OPTION values `event', `more-event' and an `integerp' are guaranteed
 to erase the minibuffer at some time after displaying.  Other values
 do not erase it afterward.  They allow you to later add more to the
 current contents of the minibuffer.  Remember that they leave the
 minibuffer with text in it.  They should therefore at some point be
 followed by something that erases the contents, such as
 `erase-inactive-minibuffer'.

 OPTION values `event' and a `natnump' are common, one-shot affairs.
 The other values are only used when you need to combine several
 submessages via separate calls.

 OPTION values `event' and `more-event' block Emacs execution until
 the next user event.  This means, among other things, that such a
 call should always be the last of a sequence of calls to
 `display-in-minibuffer'.

 Here are all the OPTION values:

 If a number: ARGS are displayed for that many seconds (`sit-for'),
      then the minibuffer is erased.  The minibuffer is also
      erased before the display of ARGS, iff the number is >= 0.
 If `event': ARGS are displayed until the next user event, after
      erasing the minibuffer.  (If ARGS = nil, this just affects
      the duration of the current minibuffer contents.)
 If `more-event': ARGS displayed until next user event, without
      first erasing minibuffer.  (If ARGS = nil, this just affects
      the duration of the current minibuffer contents.)
 If `new': ARGS displayed indefinitely, after erasing minibuffer.
      (If ARGS = nil, then this just erases the minibuffer.)
 Else (e.g. `more'): ARGS displayed indefinitely, without first
      erasing minibuffer.  (If ARGS = nil, then this is a no-op.)

If you cannot (or do not want to) explicitly program the ultimate
erasure of the minibuffer, and yet you do not want to block program
execution by waiting for a time elapse or a user input, you may still
ensure that the minibuffer is always erased at the next user input,
by doing either of these (the first is surer, but slower):
    (add-hook 'pre-command-hook 'erase-inactive-minibuffer)
or  (add-hook 'pre-command-hook 'erase-nonempty-inactive-minibuffer)

This can be a good thing to do (but it can also slow things down
considerably).  You may then freely use OPTION values other than
numbers, `event' and `more-event' (e.g.  `new' and `more'), without
fear of indefinite display.  However, user input between `new' and
`more' will then interfere with incremental display.  If you do arm
`pre-command-hook' this way, you can always inhibit erasure
temporarily by rebinding `pre-command-hook' to nil.


The remaining arguments, besides OPTION, may be strings or numbers
\(see `insert-string'), or nil (ignored).

As a special case, they (items in the ARGS list) may also be lists of
the form (FACE STRING), where STRING is a string and FACE is the face
in which it is to be displayed.  In this case, any text properties
belonging to STRING itself are ignored.


EXAMPLE (one-shot, without `sit-for', erasure upon user event):
  (display-in-minibuffer 'event \"a\" \"b\") ; Erase, then display until event.
  ...                                        ;  --> ab

EXAMPLE (multiple calls, without `sit-for', erasure upon user event):
  (display-in-minibuffer 'new \"a\" \"b\")  ; Erase, then display.
  ...                                       ;  --> ab
  (display-in-minibuffer 'more \"cd\")      ; Display (no erase).
  ...                                       ;  --> abcd
  (display-in-minibuffer 'more-event \"ef\"); Display until user event.
  ...                                       ;  --> abcdef

EXAMPLE (without `sit-for', explicit erasure later):

  (display-in-minibuffer 'new \"ab\")     ; Erase, then display.
  ...                                     ;  --> ab
  (display-in-minibuffer 'more \"cd\")    ; Display (no erase).
  ...                                     ;  --> abcd
  (display-in-minibuffer 'new)            ; Erase---same as
                                          ; (erase-inactive-minibuffer).
  ...                                     ;  -->

EXAMPLE (with positive `sit-for'):
  (display-in-minibuffer 3 \"abc\" \"def\") ; Erase, display 3 sec, erase.

EXAMPLE (with negative `sit-for'):
  (display-in-minibuffer new \"abc\" \"def\") ; Erase, then display.
  ...
  (display-in-minibuffer -3 \"gh\")         ; Display (\"abcdefgh\") 3 sec.


NOTE:
 This function is not very useful interactively, especially as regards
 different values of OPTION.  Interactive calls in fact always erase
 the minibuffer first.
 Regardless of this, if interactive, then OPTION is the numeric value
 of the prefix arg, if any.  If there is no prefix arg, behavior is as
 if OPTION were `event': display contents until the next user event.

\(fn OPTION &rest ARGUMENTS)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; strings-autoloads.el ends here
