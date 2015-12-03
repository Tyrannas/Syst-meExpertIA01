(setq path (merge-pathnames "C:\Users\Felix\Documents\GitHub\Syst-meExpertIA01\door.txt"))
(with-open-file (input p)
   (loop for line = (read-line input nil)
       while line do (format t "~a~%" line)))
