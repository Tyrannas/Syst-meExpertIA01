;;=======================DEFINITION DES VARIABLES=====================================
;;-------------------emplacement du fichier texte de la porte, a modifier -------------
(setq path (merge-pathnames "/home/oiseauroch/Syst-meExpertIA01/door.txt"))
;;---------------------------------regles----------------------------------------------
(setq *regles* '(
;;-------------------------------regles d'analyse d'armée------------------------------
  (R0((equal armee peunombreuse) (> nombre 3)) (armee nombreuse)) 
  (R1((> nombre 4)) (distance 2)) 
  (R2((equal armee  nombreuse)) (truc polyvalente)) 
  (R3((> distance 23)) (forteresse 5)))
;;-------------------------------regles de comparaison--------------------------------
)
;;------------------------------bases de faits----------------------------------------
(setq *Alliés* '((armee . peunombreuse) (nombre . 5) (distance . 12)))
(setq *Ennemis* '())
(setq *Comparaison* ())
;;------------------------------base de données--------------------------------------
(setq *Lieux* '())

;;(setq path (merge-pathnames "C:/Users/Felix/Documents/GitHub/Syst-meExpertIA01/door.txt"))
(defun start()
  ;;on affiche le menu
  (let (
    ;;================variables=============
      (regles_appliquees nil)
    )  
  ;;on applique les règles aux aliés
  ;;===================================================
  (appliqueregle '*Alliés* *regles*)
  (setq regles_appliquees nil)
  ;;on applique les règles aux ennemis
  ;;===================================================
  (appliqueregle '*Ennemis* *regles*)
  (setq regles_appliquees nil)
  ;;on compare les deux armées
  ;;===================================================
  (appliqueregle '*Comparaison* *regles*)
  (setq regles_appliquees nil)
  ;;on test le lieu en fonction des stats finales
  ;;===================================================
  )
)

; format des regles : ((liste prémisse) (fait nouveau))
(defun appliqueregle (base regles)
  (setq onBoucle? nil)
  (dolist (x regles)
    (print 'boucle1)
    (print x)
    (if (not (member (car x) regles_appliquees))
      (when (validationregle base (cadr x) (caddr x))
        (push (car x) regles_appliquees)
        (setq onBoucle? T)
      )
    )
  )
  (if (eq onBoucle? T)
    (appliqueregle base regles)
  )
)
           
(defun validationregle (base premisses conclusion)
  (let* 
    (
      (BF (symbol-value base))
      (prop (get_prop premisses)) 
      (valeur_prop (get_valeur BF prop))
      (premisse (car premisses))
      (valeur_a_modifier (assoc (car conclusion) BF))
      (nouvelle_valeur (cadr conclusion))
    )

    (if (not (equal premisses nil))
      (if (assoc prop BF)
        (if (eval (list (car premisse) (list 'quote valeur_prop) (list 'quote (car (last premisse)))))
          (validationregle base (cdr premisses) conclusion)
          nil
        )
        nil
      )  
      (if valeur_a_modifier
        (if (symbolp nouvelle_valeur)
          (setf (cdr (assoc (car conclusion) (symbol-value base))) nouvelle_valeur)
          (if (listp nouvelle_valeur)
            (setf (cdr (assoc (car conclusion) (symbol-value base))) (* (cdr valeur_a_modifier) (car nouvelle_valeur))
            (setf (cdr (assoc (car conclusion) (symbol-value base))) (+ (cdr valeur_a_modifier) nouvelle_valeur))
        )
        (set base (acons (car conclusion) nouvelle_valeur BF))
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







