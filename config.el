(defun tabbar-ruler-projectile-tabbar-buffer-groups-and-group-fileless-buffers ()
  "Return the list of group names BUFFER belongs to.
    Return only one group for each buffer."
  (setq persp-spec-list-of-groups (get-persp-specific-tabbar-groups-to-list))
  (setq projectile-spec-list-of-groups (get-projectile-specific-tabbar-groups-to-list))

  (if t
      (progn projectile-spec-list-of-groups)
    (append persp-spec-list-of-groups projectile-spec-list-of-groups)
    )
  )

(defun get-projectile-specific-tabbar-groups-to-list () ""
  (delq nil
        ;; (append get-persp-specific-tabbar-groups (delq nil
        (cond
         ((or (get-buffer-process (current-buffer)) (memq major-mode '(comint-mode compilation-mode))) '("Term"))
         ((and
           (eq buffer-file-name nil)
           (not (memq major-mode '(dired-mode)))) '("Buffers without files"))
         ((condition-case err
              (projectile-project-root)
            (error nil)) (list (projectile-project-name)))
         (t '("Uncategorized buffers"))))
  )

(defun get-persp-specific-tabbar-groups-to-list () "1 2 3 4 5"
       (progn
         '("bla")
         (dolist (elt (persp-names) retvalue) (progn (setq buffers-in-persp (safe-persp-buffers (persp-get-by-name elt))) (setq retvalue (if (member (get-buffer (buffer-name) )buffers-in-persp) (list elt) nil))))))


(defun tabbar-ruler-group-by-projectile-project-and-group-fileless-buffers()
  "Group by projectile project."
  (interactive)
  (setq tabbar-buffer-groups-function 'tabbar-ruler-projectile-tabbar-buffer-groups-and-group-fileless-buffers)
  (add-hook 'persp-mode-hook #'tabbar-ruler-set-tabbar-buffer-list)
  (message "het nyolc"))

(defun tabbar-ruler-set-tabbar-buffer-list ()
  ""
  (setq tabbar-buffer-list-function #'tabbar-ruler-tabbar-buffer-list2)
  (message "ot hat"))

(defun tabbar-ruler-tabbar-buffer-list2 ()
  "Return the list of buffers to show in tabs.
Exclude buffers whose name starts with a space or *, when they are not
visiting a file.  The current buffer is always included."
  (delq nil
        (mapcar #'(lambda (b)
                    (cond
                     ((member (buffer-name b) tabbar-ruler-excluded-buffers) nil)
                     ((char-equal ?\  (aref (buffer-name b) 0)) nil)
                     ((char-equal ?* (aref (buffer-name b) 0)) nil)
                     ((buffer-live-p b) b)))
                (buffer-list)))
  )
