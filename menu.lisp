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

;;execute les regles tant que des regles sont déclenchées
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

;;execute la regle si elle est valide, renvoie nil sinon
(defun validationregle (base premisses conclusion)
  (let* 
    (
      ;;==========déclaration des variables
      (BF (symbol-value base)) ;;ensemble des valeurs de la base traitée
      (prop (get_prop premisses))  ;;propriété en cours
      (valeur_prop (get_valeur BF prop)) ;;valeur associée
      (premisse (car premisses)) ;;premisse en cours
      (prop_a_modifier (assoc (car conclusion) BF)) ;;valeur à modifier dans la base
      (nouvelle_valeur (cadr conclusion)) ;;nouvelle valeur
    )
      ;;===========si il reste des premisses à traiter
    (if (not (equal premisses nil))
      ;;===========si la proposition de la premisse est bien dans la base de fait sinon nil
      (if (assoc prop BF)
        ;;===========si les valeurs correspondent aux conditions de la premisse
        (if (eval (list (car premisse) (list 'quote valeur_prop) (list 'quote (car (last premisse)))))
          ;;============puis on ré-applique aux prémisses suivantes
          (validationregle base (cdr premisses) conclusion)
          nil
        )
        nil
      )
      ;;============si la propriété à modifier existe dans la base
      (if prop_a_modifier
        ;;===========si la nouvelle valeur est un symbole
        (if (symbolp nouvelle_valeur)
          ;===========on update la valeur dans la base
          (setf (cdr (assoc (car conclusion) (symbol-value base))) nouvelle_valeur)
          ;;===========sinon si la valeur est une liste
          (if (listp nouvelle_valeur)
            ;;==============alors c'est qu'on cherche à calculer un nombre d'unités
            ;;==============on additionne à la valeur à modifier, la nouvelle valeur * le nombre de bataillons
            (setf (cdr (assoc (car conclusion) (symbol-value base))) (+ (* valeur_prop (car nouvelle_valeur))))
            ;;==============sinon on additionne juste à la valeur à modifier la nouvelle valeur
            (setf (cdr (assoc (car conclusion) (symbol-value base))) (+ (cdr prop_a_modifier) nouvelle_valeur))
          )
        )
        ;;===========sinon si la propriété à modifier n'existe pas dans la base
        ;;===========de meme que plus haut on teste si la valeur est une liste
        (if (listp nouvelle_valeur)
          ;;================on ajoute les valeur calculées le cas échéant
          (set base (acons (car conclusion) (* valeur_prop (car nouvelle_valeur))))
          ;;================sinon on ajoute simplement la valeur
          (set base (acons (car conclusion) nouvelle_valeur BF))
        )
      ) 
    )         
  )
)


;;=========================fonctions de service=================
(defun get_prop (premisses)
  (cadr (car premisses))
)
(defun get_valeur (BF prop)
  (cdr (assoc prop BF))
)







