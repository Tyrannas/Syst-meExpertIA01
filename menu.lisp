(setq path (merge-pathnames "/home/oiseauroch/Syst-meExpertIA01/door.txt"))
;; (setq path (merge-pathnames "C:/Users/Felix/Documents/GitHub/Syst-meExpertIA01/door.txt"))

(let ((in (open path :if-does-not-exist nil)))
  (when in
    (loop for line = (read-line in nil)
         while line do (format t "~a~%" line))
    (close in)))


(setq *BF* '((armee . peunombreuse) (nombre . 5) (distance . 12)))


(defun parcoursliste (*liste*)
       (dolist (x (cadr *liste*))
               (push x *BFallié*)
        )
       (dolist (x (last *liste*))
               (push x *BFennemi*)
        )
)

; format des regles : ((liste prémisse) (fait nouveau))
(defun appliqueregle (*BFallié* *regles*)
       (dolist (x *regles*)
           (print 'boucle1)
           (print x)
           (validationregle *BFallié* (car x) (cadr x))
        )
    )
           
           
           (setq regle '((((equal armee peunombreuse) (> nombre 3)) (armee nombreuse)) (((> nombre 4)) (distance 2)) (((equal armee  nombreuse)) (truc polyvalente)) (((> distance 23)) (forteresse 5))))

           
           
           
(defun validationregle (BF regle fait)
        (if regle
                (if (assoc (cadr (car regle)) BF)
                    (if (eval (list (car (car regle)) (list 'quote (cdr (assoc (cadr  (car regle)) BF))) (list 'quote (caddr (car regle)))))
                ; plus retirer les prémisses de la base de fait ?
                        (progn
                            (if (assoc (car fait) *BF*)
                                (if (symbolp (cadr fait))
                                    (setf (cdr (assoc (car fait) *BF*)) (cadr fait))
                                    (setf (cdr (assoc (car fait) *BF*)) (+ (cdr (assoc (car fait) *BF*)) (cadr fait)))
                                )
                                (setq *bf* (acons (car fait) (cadr fait) *BF*)
                                )
                            )
                        )   
                    )
                )
        )
)


