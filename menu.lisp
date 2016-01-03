;;=======================DEFINITION DES VARIABLES=====================================
;;-------------------emplacement du fichier texte de la porte, a modifier -------------
(setq path (merge-pathnames "/home/oiseauroch/Syst-meExpertIA01/door.txt"))
;;---------------------------------regles----------------------------------------------
(setq *regles* '(
;;-------------------------------regles niveau 0---------------------------------------

;;-------------------------------regles niveau 1---------------------------------------

;;-------------------------------regles niveau 2--------------------------------------
)
;;------------------------------bases de faits----------------------------------------
(setq *Alliés* '((attaque . 0) (defense . 0)  (vitesse . 0) (siege_attaque . 0) (siege_defense . 0) (nombre . 0) (portee . 0) (espace . 0))
(setq *Ennemis* '((attaque . 0) (defense . 0) (vitesse . 0) (siege_attaque . 0) (siege_defense . 0) (nombre . 0) (portee . 0) (espace . 0))

;;------------------------------base de données--------------------------------------
(setq *Lieux* '())

;;(setq path (merge-pathnames "C:/Users/Felix/Documents/GitHub/Syst-meExpertIA01/door.txt"))
(defun start(lieu armees)
  (let (
    ;;================variables=============
      (regles_appliquees nil)
    )
  parcours_liste(armees)
  parcours_liste((list (cdr (assoc lieu *Lieux*))(cdr (assoc lieu *Lieux*))))  
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
  (compare ())
  ;;on test le lieu en fonction des stats finales
  ;;===================================================
  )
)
(defun parcours_liste (liste)
  (dolist (x (car liste)
    (push x *Alliés*)
  )
  (dolist (x (cadr liste)
    (push x *Ennemis*)
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
            (setf (cdr (assoc (car conclusion) (symbol-value base))) (+ (cdr prop_a_modifier)(* valeur_prop (car nouvelle_valeur))))
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

;;========================fonctions de comparaison=================

(defun compare()
  (let(
    (attaque nil)
    (defense nil)
    (vitesse nil)
    (nombre nil)
    (portee nil)
    (espace nil)
    (stats nil)
    (coeff nil)
  ) 
    (setq attaque (- (cdr(assoc 'attaque *Alliés*) )(cdr(assoc 'defense *Ennemis*))))
    (setq defense (- (cdr(assoc 'defense *Alliés*) )(cdr(assoc 'attaque *Ennemis*))))
    (setq vitesse (- (cdr(assoc 'vitesse *Alliés*) )(cdr(assoc 'vitesse *Ennemis*))))
    (setq nombre (- (cdr(assoc 'nombre *Alliés*) )(cdr(assoc 'nombre *Ennemis*))))
    (setq portee (- (cdr(assoc 'portee *Alliés*)) (cdr(assoc 'portee *Ennemis*))))
    (setq espace (- (cdr(assoc 'espace *Alliés*) )(cdr(assoc 'espace *Ennemis*))))

    (setq coeff (+ attaque defense vitesse nombre portee espace))
    
    (cond
      ( (< coeff -5)
        (print "Ici la météo de la Terre du Milieu: une pluie d'agonies lentes et douloureuses en approche.")
      )
      ( (AND (>= coeff -5) (< coeff -1)
        (print "Et tout de suite, l'horoscope: votre journée sera longue pénible et douloureuse, mais ne baissez pas les bras")
      )
      ( (AND (>= coeff -1) (<= coeff 1)
        (print "Un combat féroce, mais équilibré")
      )
      ( (AND (> coeff 1) (< coeff 5)
        (print "Izy ma gueule")
      )
      ( (> coeff 5)
        (print "Ne sont ils pas mignons quand ils se font flecher?")
      )
    )
)






