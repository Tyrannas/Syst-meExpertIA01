;;=======================DEFINITION DES VARIABLES=====================================
;;-------------------emplacement du fichier texte de la porte, a modifier -------------
(setq *armees* '(((rohirrim . 10) (nain_archer . 5) (elfe_infanterie . 10) (hobbit . 10))  ((orc_warg . 10) (orc_piquier . 20) ( troll . 1))))
;;---------------------------------regles----------------------------------------------
(setq *regles* '(
  (R0((> elfe_archer 0)) (elfe (15)))
  (R1((> orc_archer 0)) (orc (15)))
  (R2((> orc_piquier 0)) (orc (10)))
  (R3((> orc_warg 0)) (orc (6)))
  (R4((> ourouk-hai 0)) (ourouk_hai (20)))
  (R5((> rohirrim 0)) (homme (6)))
  (R6((> garde_de_la_tour 0)) (homme (10)))
  (R7((> gondor_infanterie 0)) (homme (20)))
  (R8((> gondor_piquier 0)) (homme (10)))
  (R9((> rodeur 0)) (homme (15)))
  (R10((> gondor_archer 0)) (homme (15))) 
  (R11((> elfe_infanterie 0)) (elfe (20)))
  (R12((> troll 0)) (infanterie 1))
  (R13((> haradrim 0)) (homme (20)))
  (R14((> catapulte 0)) (siege 1))
  (R15((> nain_erebor 0)) (nain (12)))
  (R16((> nain_infanterie 0)) (nain (20)))
  (R17((> nain_archer 0)) (nain (15)))
  (R18((> gobelin_infanterie 0)) (gobelin (30)))
  (R19((> gobelin_archer 0)) (gobelin (15)))
  (R20((> hobbit 0)) (hobbit (20)))
   
  (R21((> 0 elfe_archer)) (archer 2))
  (R22((> orc_archer 0)) (archer 1))
  (R23((> rodeur 0)) (archer 2))
  (R24((> mummakil 0)) (archer 1))
  (R25((> gondor_archer 0)) (archer 1))
  (R26((> nain_archer 0)) (archer 1))
  (R27((> gobelin_archer 0)) (archer 1))
   
  (R28((> orc_piquier 0)) (piquier 1))
  (R29((> garde_de_la_tour 0)) (piquier 2))
  (R30((> orc_warg 0)) (cavalerie 1))
  (R31((> rohirrim 0)) (cavalerie 1))
  (R32((> ourouk-hai 0)) (infanterie 1))
  (R33((> gondor_infanterie 0)) (infanterie 1))
  (R34((> elfe_infanterie 0)) (infanterie 1))
  (R35((> haradrim 0)) (infanterie 1))
  (R36((> nain_infanterie 0)) (infanterie 2))
  (R37((> gobelin_infanterie)) (infanterie 1))
  (R38((> hobbit 0)) (infanterie 1))
  (R39((> troll 0)) (siege 1))
  (R40((> mummakil 0)) (siege 1))
  (R41((> catapulte 0)) (siege 1))
   
   
  (R42((> infanterie 0)) (nombre (20)))
  (R43((> archer 0)) (nombre (15)))
  (R44((> piquier 0)) (nombre (10)))
  (R45((> cavalerie 0)) (nombre (6)))
  (R46((> siege 0)) (nombre (5)))
  
  (R47((> siege 0)) (attaque (3)))
  (R48((> siege 0)) (defense (-5)))
  (R49((> siege 0)) (vitesse (-5)))
  (R50((> siege 0)) (portee (5)))
  (R51((> siege 0)) (espace (5)))
  
  
  (R52((> archer 0)) (attaque (1)))
  (R53((> archer 0)) (defense (-1)))
  (R54((> archer 0)) (vitesse (-0.5)))
  (R55((> archer 0)) (portee (3)))
  (R56((> archer 0)) (espace (-2)))
  
  (R57((> piquier 0)) (defense (1)))
  (R58((> piquier 0)) (vitesse (-0.5)))
  
  (R59((> cavalerie 0)) (attaque (3)))
  (R60((> cavalerie 0)) (defense (-2)))
  (R61((> cavalerie 0)) (vitesse (3)))
  (R62((> cavalerie 0)) (portee (1)))
  (R63((> cavalerie 0)) (espace (3)))
  
  (R64((> elfe 0)) (attaque (1)))
  (R65((> elfe 0)) (vitesse (2)))
  (R66((> elfe 0)) (nombre (-0.3)))
  
  (R67((> nain 0)) (attaque (1)))
  (R68((> nain 0)) (defense (2)))
  (R69((> nain 0)) (vitesse (-0.3)))
  (R70((> nain 0)) (nombre (-0.3)))
  (R71((> nain 0)) (espace (-0.5)))
  
  (R72((> ourouk_hai 0)) (attaque (1)))
  (R73((> ourouk_hai 0)) (defense (1)))
  
  (R74((> hobbit 0)) (attaque (-0.5)))
  (R75((> hobbit 0)) (defense (-0.5)))
  (R76((> hobbit 0)) (vitesse (-0.2)))
  (R77((> hobbit 0)) (nombre (-0.5)))
  
  (R78((> gobelin 0)) (attaque (-0.2)))
  (R79((> gobelin 0)) (defense (-0.2)))
  (R80((> gobelin 0)) (nombre (1.3)))
  (R81((> gobelin 0)) (espace (-0.5)))
  
  (R82((> orc 0)) (nombre (0.3)))
  
  (R83((> troll 0)) (attaque (5)))
  (R84((> troll 0)) (defense (5)))
  (R85((> troll 0)) (nombre (-19)))
  (R86((> troll 0)) (vitesse (6)))
  
  (R88((> mummakil 0)) (attaque (8)))
  (R89((> mummakil 0)) (defense (8)))
  (R90((> mummakil 0)) (nombre (-24)))
  (R91((> mummakil 0)) (vitesse (5)))
  
  (R92((> orc_warg 0)) (attaque (2)))
  (R93((> rodeur 0)) (defense (1)))
  (R94((> rodeur 0)) (attaque (3)))
  (R95((> garde_de_la_tour 0)) (attaque (2)))
  (R96((> garde_de_la_tour 0)) (defense (3)))
 
  (R97((equal terrain forteresse) (> siege 0)) (attaque (3)))
  (R98((equal terrain forteresse) (> siege 0)) (defense (4)))
  (R100((> homme 0)) (nombre (1)))
  (R101((> siege 5)(> cavalerie 5)(> piquier 5)(> infanterie 5)(> archer 5)) ((armee polyvalente)))
  (R102((> elfe 0)) (nombre (1)))
  (R103((> nain 0)) (nombre (1)))
  (R104((> orc 0)) (nombre (1)))
  (R105((> catapulte 0)) (nombre (1)))
  (R106((> gobelin 0)) (nombre (1)))
  (R107((> hobbit 0)) (nombre (1)))
  (R108((> mummakil 0)) (nombre (15)))
  (R109((> troll 0)) (nombre (1)))
   
  (R110((equal terrain plaine)(> nombre 0)) (espace (2)))
   
  (R111((equal terrain forteresse)(> archer 0)) (defense (3)))
  (R112((equal terrain forteresse)(> archer 0)) (portée (2)))
  (R113((equal environnement foret)(> elfe 0)) (attaque (2)))
  (R114((equal environnement foret)(> elfe 0)) (defense (2)))
  (R115((equal environnement souterrain)(> nain 0)) (defense (3)))
  (R116((equal environnement souterrain)(> gobelin 0)) (defense (2)))
  (R117((equal environnement souterrain)(> gobelin 0)) (attaque (2)))
  (R118((equal terrain forteresse)(> vitesse -800000)) (vitesse (-1)))
  (R119((equal terrain souterrain)(> nain 0)) (attaque (3))))
)
;;------------------------------bases de faits----------------------------------------
(setq *Alliés* '((attaque . 0) (defense . 0)  (vitesse . 0) (siege_attaque . 0) (siege_defense . 0) (nombre . 0) (portee . 0) (espace . 0)))
(setq *Ennemis* '((attaque . 0) (defense . 0) (vitesse . 0) (siege_attaque . 0) (siege_defense . 0) (nombre . 0) (portee . 0) (espace . 0)))

;;------------------------------base de données--------------------------------------
(setq *Lieux* '(
              (fort_le_cor (terrain . forteresse))
              (morannon (terrain . forteresse))
              (kazad_dum (terrain . forteresse) (environnement . souterrain))
              (isengard (terrain . forteresse))
              (fangorn (environnement . foret))
              (erebor (terrain . forteresse) (environnement . souterrain))
              (dol_guldur (terrain . forteresse) (environnement . foret))
              (dagorlad (terrain . plaine))
            )
)
(setq regles_appliquees nil)
;;(setq path (merge-pathnames "C:/Users/Felix/Documents/GitHub/Syst-meExpertIA01/door.txt"))


(defun start(lieu armees)

  (print *Alliés*)
  (print *Ennemis*)
  ;(let (
    ;;================variables=============
  ;    (regles_appliquees nil)
  ;  )
  (parcours_liste armees)
  (parcours_liste (list (cdr (assoc 'lieu *Lieux*))(cdr (assoc 'lieu *Lieux*))))  
  (setq regles_appliquees nil)
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
  (compare )
  ;;on test le lieu en fonction des stats finales
  ;;===================================================
  ;)
  (setq *Alliés* '((attaque . 0) (defense . 0)  (vitesse . 0) (nombre . 0) (portee . 0) (espace . 0)))
  (setq *Ennemis* '((attaque . 0) (defense . 0) (vitesse . 0) (nombre . 0) (portee . 0) (espace . 0)))
)
(defun parcours_liste (liste)
  (dolist (x (car liste))
    (push x *Alliés*)
  )
  (dolist (x (cadr liste))
    (push x *Ennemis*)
  )
)
;;execute les regles tant que des regles sont déclenchées
(defun appliqueregle (base regles)
  (setq onBoucle? nil)
  (dolist (x regles)
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
      ;;===========si la proposition de la premisse est bien dans la base de fait sinon nil
      (if (assoc prop BF)
        ;;===========si les valeurs correspondent aux conditions de la premisse
        (if (eval (list (car premisse) (list 'quote valeur_prop) (list 'quote (car (last premisse)))))
          ;;============puis on ré-applique aux prémisses suivantes
          (if (cdr premisses)
            (validationregle base (cdr premisses) conclusion)
            ;;============si la propriété à modifier existe dans la base
            (if prop_a_modifier
                ;;===========si la nouvelle valeur est un symbole
                (progn 
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
                )
                ;;===========sinon si la propriété à modifier n'existe pas dans la base
                ;;===========de meme que plus haut on teste si la valeur est une liste
                (if (listp nouvelle_valeur)
                ;;================on ajoute les valeur calculées le cas échéant
                (set base (acons (car conclusion) (* valeur_prop (car nouvelle_valeur)) BF ))
                ;;================sinon on ajoute simplement la valeur
                (set base (acons (car conclusion) nouvelle_valeur BF))
                )
            ) 
          )
        nil
        )
        nil
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
    (print 'attaque)
    (print attaque)
    (print (cdr(assoc 'attaque *Alliés*)))
    (print (cdr(assoc 'defense *Ennemis*)))
    (setq defense (- (cdr(assoc 'defense *Alliés*) )(cdr(assoc 'attaque *Ennemis*))))
    (print 'defense)
    (print defense)
    (print (cdr(assoc 'defense *Alliés*)))
    (print (cdr(assoc 'attaque *Ennemis*)))
    (setq vitesse (- (cdr(assoc 'vitesse *Alliés*) )(cdr(assoc 'vitesse *Ennemis*))))
    (print 'vitesse)
    (print vitesse)
    (print (cdr(assoc 'vitesse *Alliés*)))
    (print (cdr(assoc 'vitesse *Ennemis*)))
    (setq nombre (- (cdr(assoc 'nombre *Alliés*) )(cdr(assoc 'nombre *Ennemis*))))
    (print 'nombre)
    (print nombre)
    (print (cdr(assoc 'nombre *Alliés*)))
    (print (cdr(assoc 'nombre *Ennemis*)))
    (setq portee (- (cdr(assoc 'portee *Alliés*)) (cdr(assoc 'portee *Ennemis*))))
    (print 'portee)
    (print portee)
    (print (cdr(assoc 'portee *Alliés*)))
    (print (cdr(assoc 'portee *Ennemis*)))
    (setq espace (- (cdr(assoc 'espace *Alliés*) )(cdr(assoc 'espace *Ennemis*))))
    (print 'espace)
    (print espace)
    (print (cdr(assoc 'espace *Alliés*)))
    (print (cdr(assoc 'espace *Ennemis*)))

    (setq coeff (+ attaque defense vitesse nombre portee espace))
    (setq coeff (/ coeff (+  (cdr(assoc 'nombre *Alliés*) )(cdr(assoc 'nombre *Ennemis*)))))
    (print "probabilité de victoire")
    (print (* (+ 6 ( * 3 coeff)) 7 ))
    (cond
      ( (< coeff -2)
        (print "Ici la météo de la Terre du Milieu: une pluie d'agonies lentes et douloureuses en approche.")
      )
      ( (AND (>= coeff -2) (< coeff -0.7))
        (print "Et tout de suite, l'horoscope: votre journée sera longue pénible et douloureuse, mais ne baissez pas les bras")
      )
      ( (AND (>= coeff -0.7) (<= coeff 0.7))
        (print "Un combat féroce, mais équilibré")
      )
      ( (AND (> coeff 0.7) (< coeff 2))
        (print "Ne sont ils pas mignons quand ils se font flecher?")
      )
      ( (> coeff 2)
        (print "Vous lisez tranquilement le journal tout en découpant d'une main distraite vos ennemis.")
      )
    )
  )
)

(start 'dagorlad *armees*)
