(defun sgn/set-posts-info (org-path posts-path res-path)
  (setq org-publish-project-alist
        `(("org-danh"
           :base-directory ,org-path
           :base-extension "org"
           :publishing-directory ,posts-path
           :recursive t
           :publishing-function org-html-publish-to-html
           :headline-levels 6
           :html-extension "html"
           :body-only t
           :with-toc nil
           :section-numbers nil
           :table-of-contents nil
           :author "Danh DOAN"
           :email "sgn.danh@gmail.com")
          ("org-static-danh"
           :base-directory ,org-path
           :base-extension "css\\|js\\|png\\|jpg\\|ico\\|gif\\|pdf\\|mp3\\|flac\\|ogg\\|swf\\|php\\|markdown\\|md\\|html\\|htm\\|sh\\|xml\\|gz\\|bz2\\|vcf\\|zip\\|txt\\|tex\\|otf\\|ttf\\|eot\\|rb\\|yml\\|htaccess\\|gitignore\\|svg"
           :publishing-directory ,res-path
           :recursive t
           :publishing-function org-publish-attachment)
          ("danh" :components ("org-danh" "org-static-danh")))))
