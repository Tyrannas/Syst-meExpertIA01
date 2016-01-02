(setq path (merge-pathnames "/home/oiseauroch/Syst-meExpertIA01/door.txt"))
;; (setq path (merge-pathnames "C:/Users/Felix/Documents/GitHub/Syst-meExpertIA01/door.txt"))

(let ((in (open path :if-does-not-exist nil)))
  (when in
    (loop for line = (read-line in nil)
         while line do (format t "~a~%" line))
    (close in)))


(setq *BF* '((armmee peunombreuse) (


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
           
           
           (setq regle '((((equal armee peunombreuse) (> nombre 3)) (armee nombreuse)) (((> nombre 4)) (distance 2)) (((> distance 1)) (forteresse 5))))

           
           
           
(defun validationregle (BF regle fait)
       (print 'regle)
       (print regle)
       (print 'fait)
       (print fait)
        (print 'car_regle)
        (print (car regle))
        (if regle
                (if (assoc (cadr (car regle)) BF)
                    (if (eval (list (car (car regle)) (list 'quote (cdr 
    ; quand je met un cdr, les chiffres sont mis en liste, quand je met un cadr, les chaine de caractères sont des symbole et pas des listes
    (assoc (cadr  (car regle)) BF))) (list 'quote (caddr (car regle)))))
                ; plus retirer les prémisses de la base de fait ?
                        (progn
                            (print 'progn)
                            (print fait)
                            (if (assoc (car fait) *BF*)
                                (if (symbolp (cadr fait))
                                    (rplacd (assoc (car fait) *BF*) (cdr fait))
                                    (rplacd (assoc (car fait) *BF*) (+ (cadr (assoc (car fait) *BF*)) (cadr fait)))
                                )
                                (push fait *BF*)
                            )
                        )   
                    )
                )
        )
)


;; 

(nombre 8)

(((> nombre 5)) (armée nombreuse)
 
 (if (eval (list (car regle) (cadr (assoc (cadr regle) *BF*)) (caddr regle)))
     