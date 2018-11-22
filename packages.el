;;; packages.el --- tabs layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: McAllister Dániel <rasztasd@rasztasd-hp-probook-640-g1>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `tabs-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `tabs/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `tabs/pre-init-PACKAGE' and/or
;;   `tabs/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst tabs-packages
  '(;;tabbar
    tabbar-ruler
    tab-group
)
  "The list of Lisp packages required by the tabs layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

;; (defun tabs/init-tabbar ()
;;   "initializes fasd-emacs and adds a key binding to `SPC f z'"
;;   (use-package tabbar
;;     :init
;;     (progn
;;       (require 'tabbar)
;;       ;; (require 'tabbar-ruler)
;;       )
;;     )
;; )


(defun tabs/init-tab-group ()
  (use-package tab-group

    )

  )

(defun tabs/init-tabbar-ruler ()
  "initializes fasd-emacs and adds a key binding to `SPC f z'"
  (use-package tabbar-ruler
    ;; :defer t
    :init
    (progn
      (global-set-key (kbd "C-<tab>") 'tabbar-forward-tab)
      (global-set-key (kbd "C-S-<iso-lefttab>") 'tabbar-backward-tab)
      (global-set-key (kbd "C-M-<tab>") 'tabbar-forward-group)
      (global-set-key (kbd "C-S-M-<iso-lefttab>") 'tabbar-backward-group)
      (global-set-key (kbd "C-S-p") 'tabbar-ruler-up)
      )
    :config
    (progn
      ;; (require 'tabbar)
      ;; (setq-default tabbar-ruler-global-tabbar t)    ; get tabbar
      ;; ;; (setq tabbar-ruler-global-ruler t)     ; get global ruler
      ;; (setq-default tabbar-ruler-popup-menu t)       ; get popup menu.
      ;; (setq tabbar-ruler-popup-toolbar t)    ; get popup toolbar
      ;; (setq tabbar-ruler-popup-scrollbar t)  ; show scroll-bar on mouse-move
      ;; (require 'tabbar-ruler)
      ;; (setq 'header-line-format '(:eval (tabbar-line)))
      )
    )
  )

;;; packages.el ends here
