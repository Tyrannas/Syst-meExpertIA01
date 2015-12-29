(setq path (merge-pathnames "/home/oiseauroch/Syst-meExpertIA01/door.txt"))
;; (setq path (merge-pathnames "C:/Users/Felix/Documents/GitHub/Syst-meExpertIA01/door.txt"))

(let ((in (open path :if-does-not-exist nil)))
  (when in
    (loop for line = (read-line in nil)
         while line do (format t "~a~%" line))
    (close in)))