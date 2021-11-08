;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Ossi Räisä"
      user-mail-address "ossi.raisa@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

(setq doom-font (font-spec :family "JetBrains Mono Medium" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq deft-directory "~/Documents/org/notes/")
(setq deft-use-filename-as-title t)
(after! org
  (setq org-directory "~/Documents/org/"
        org-agenda-files '("~/Documents/org/agenda/")
        org-log-done 'time
        org-todo-keywords '(
                            (sequence "TODO(t)" "|" "DONE(d)")
                            (sequence "NOTREAD(n)" "THROUGHREAD(T)" "|" "READ" "DONE(d)")
                            (sequence "RESEARCH(r)" "|" "DONE(d)")
                            (sequence "STUDY" "STUDYING" "|" "DONE(d)")
                            )
        )
  )

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Set default language
(setq ispell-dictionary "en")

;; Don't scroll to bottom of the screen
(setq scroll-margin 10)

;; Highlight column 80
(global-display-fill-column-indicator-mode t)

;; Ebib
(setq ebib-file-search-dirs '("~/Documents/Papers"))
(setq ebib-bib-search-dirs '("~/Documents/Papers"))
(setq ebib-preload-bib-files '("paper-database.bib"))
(setq ebib-file-associations '(("pdf" . "zathura")))
(setq ebib-notes-directory "~/Documents/org/paper-notes/")
(setq ebib-reading-list-file "~/Documents/org/agenda/reading-list.org")
(setq ebib-reading-list-todo-marker "NOTREAD")
(setq ebib-reading-list-done-marker "READ")
(setq ebib-index-columns '(
                          ("Entry Key" 10 t)
                          ("Author/Editor" 40 t)
                          ("Year" 6 t)
                          ("Title" 50 t)
                          ("Note" 3 f)
                          ))
(map! :leader :desc "Open Ebib" "n e" #'ebib)
(map! :map ebib-index-mode-map "h" #'ebib-prev-database)
(map! :map ebib-index-mode-map "l" #'ebib-next-database)
(map! :map ebib-index-mode-map "J" #'ebib-jump-to-entry)
(map! :map ebib-index-mode-map "s" #'ebib-save-current-database)
(map! :localleader :map ebib-index-mode-map "h" #'ebib-index-help)
(map! :localleader :map ebib-index-mode-map "f" #'ebib-import-file)
(map! :localleader :map ebib-index-mode-map "u" #'ebib-download-url)
(map! :localleader :map ebib-index-mode-map "i" #'ebib-import)
(map! :localleader :map ebib-index-mode-map "s" #'ebib-save-current-database)
(map! :localleader :map ebib-index-mode-map "S" #'ebib-save-all-databases)
(map! :map ebib-entry-mode-map "h" nil)
(map! :localleader :map ebib-entry-mode-map "s" #'ebib-save-current-database)
(map! :localleader :map ebib-entry-mode-map "S" #'ebib-save-add-databases)
(map! :map ebib-multiline-mode-map "C-C C-q" #'ebib-quit-multiline-buffer-and-save)
(map! :map ebib-multiline-mode-map "C-C C-c" #'ebib-cancel-multiline-buffer)
(map! :map ebib-multiline-mode-map "C-C C-s" #'ebib-save-from-multiline-buffer)
