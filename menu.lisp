(setq path (merge-pathnames "/home/oiseauroch/Syst-meExpertIA01/door.txt"))
;; (setq path (merge-pathnames "C:/Users/Felix/Documents/GitHub/Syst-meExpertIA01/door.txt"))
(defun lance_jeu()
  (let ((in (open path :if-does-not-exist nil)))
    (when in
      (loop for line = (read-line in nil)
           while line do (format t "~a~%" line))
      (close in)))
)


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
           (validationregle *BFallié* (cadr x) (caddr x))
        )
    )
           
           
(setq *regles* '(
  (R0((equal armee peunombreuse) (> nombre 3)) (armee nombreuse)) 
  (R1((> nombre 4)) (distance 2)) 
  (R2((equal armee  nombreuse)) (truc polyvalente)) 
  (R3((> distance 23)) (forteresse 5)))
)
           
           
           
(defun validationregle (BF premisses conclusion)
  (let* 
    (
      (prop (get_prop premisses)) 
      (valeur_prop (get_valeur BF prop))
      (premisse (car premisses))
      (valeur_a_modifier (assoc (car conclusion) *BF*))
      (nouvelle_valeur (cadr conclusion))
    )

    (if (not (equal premisses nil))
      (if (assoc prop BF)
        (if (eval (list (car premisse) (list 'quote valeur_prop) (list 'quote (car (last premisse)))))
          (validationregle BF (cdr premisses) conclusion)
          nil
        )
        nil
      )  
      (if valeur_a_modifier
        (if (symbolp (cadr conclusion))
          (setf (cdr valeur_a_modifier) (cadr conclusion))
          (setf (cdr valeur_a_modifier) (+ (cdr valeur_a_modifier) (cadr conclusion)))
        )
        (setq *BF* (acons (car conclusion) (cadr conclusion) *BF*))
      ) 
    )         
  )
)

;;une premisse est constituée d'un test, d'une propriété et d'une valeur
(defun get_prop (premisses)
  (cadr (car premisses))
)
(defun get_valeur (BF prop)
  (cdr (assoc prop BF))
)




Base de lieu + stats
Base de règles
Base de règles de comparaison entre armées







