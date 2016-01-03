;;=======================DEFINITION DES VARIABLES=====================================
;;-------------------emplacement du fichier texte de la porte, a modifier -------------
(setq *armees* '(((hobbit . 25) (rohirrim . 10) (elfe_archer . 10) (nain_erebor . 1) (catapulte . 3)) ((mummakil . 10) (troll . 5) (haradrim . 15) (orc_warg . 3))))
;;---------------------------------regles----------------------------------------------
(setq *regles* '(
  (R0((> elfe_archer 0)) (elfe (15)))
  (R1((> orc_archer 0)) (orc (20)))
  (R2((> orc_piquier 0)) (orc (10)))
  (R3((> orc_warg 0)) (orc_warg (5)))
  (R4((> ourouk-hai 0)) (ourouk_hai (10)))
  (R5((> rohirrim 0)) (homme (6)))
  (R6((> garde_de_la_tour 0)) (homme (5)))
  (R7((> gondor_infanterie 0)) (homme (15)))
  (R8((> gondor_piquier 0)) (homme (12)))
  (R9((> rodeur 0)) (homme (7)))
  (R10((> gondor_archer 0)) (homme (20))) 
  (R11((> elfe_infanterie 0)) (elfe (10)))
  (R12((> troll 0)) (troll (5)))
  (R13((> haradrim 0)) (homme (10)))
  (R14((> catapulte 0)) (catapulte (2)))
  (R15((> nain_erebor 0)) (nain (12)))
  (R16((> nain_infanterie 0)) (nain (15)))
  (R17((> nain_archer 0)) (nain (15)))
  (R18((> gobelin_infanterie 0)) (gobelin (30)))
  (R19((> gobelin_archer 0)) (gobelin (20)))
  (R20((> hobbit 0)) (hobbit (8)))
   
  (R21((> 0 elfe_archer)) (archer (15)))
  (R22((> orc_archer 0)) (archer (20)))
  (R23((> rodeur 0)) (archer (7)))
  (R24((> mummakil 0)) (archer (15)))
  (R25((> gondor_archer 0)) (archer (20)))
  (R26((> nain_archer 0)) (archer (20)))
  (R27((> gobelin_archer 0)) (archer (20)))
   
  (R28((> orc_piquier 0)) (piquier (10)))
  (R29((> garde_de_la_tour 0)) (piquier (5)))
  (R30((> orc_warg 0)) (cavalerie (5)))
  (R31((> rohirrim 0)) (cavalerie (6)))
  (R32((> ourouk-hai 0)) (infanterie (10)))
  (R33((> gondor_infanterie 0)) (infanterie (15)))
  (R34((> elfe_infanterie 0)) (infanterie (10)))
  (R35((> haradrim 0)) (infanterie (10)))
  (R36((> nain_infanterie 0)) (infanterie (15)))
  (R37((> gobelin_infanterie)) (infanterie (20)))
  (R38((> hobbit 0)) (infanterie (8)))
   
  (R39((> troll 0)) (siege (5)))
  (R40((> mummakil 0)) (siege (5)))
  (R41((> catapulte 0)) (siege (5)))
   
  (R42((> siege 5)(> cavalerie 5)(> piquier 5)(> infanterie 5)(> archer 5)) ((armee polyvalente)))
  (R43((> siege 0)) (vitesse (-2)))
  (R44((> elfe 0)) (precision (1)))
  (R45((> nain 0)) (defense (2)))
  (R46((> nain 0)) (vitesse (-0.3)))
  (R47((> piquier 0)) (attaque (1)))
  (R48((> piquier 0)) (defense (3)))
  (R49((> ourouk'hai 0)) (defense (1)))
  (R50((> ourouk-hai 0)) (attaque (3)))
  (R51((> orc_warg 0)) (attaque (2)))
  (R52((> cavalerie 0)) (attaque (3)))
  (R53((> cavalerie 0)) (defense (1)))
  (R54((> mummakil 0)) (defense (5)))
  (R55((> mummakil 0)) (attaque (8)))
  (R56((> cavalerie 0)) (portee (1.5)))
  (R57((> cavalerie 0)) (espace (3)))
  (R58((> cavalerie 0)) (vitesse (3)))
   
  (R59((> archer 0)) (attaque (2)))
  (R60((> archer 0)) (defense (1)))
  (R61((> rodeur 0)) (defense (1)))
  (R62((> rodeur 0)) (attaque (3)))
  (R63((> archer 0)) (portee (4)))
  (R64((> archer 0)) (vitesse (0.3)))
  (R65((> infanterie 0)) (attaque (2)))
  (R66((> infanterie 0)) (defense (2)))
  (R67((> troll 0)) (defense (2)))
  (R68((> troll 0)) (attaque (2)))
  (R69((> garde_de_la_tour 0)) (attaque (2)))
  (R70((> garde_de_la_tour 0)) (defense (3)))
  (R71((> siege 0)) (portee (4)))
  (R72((> siege 0)) (espace (4)))
   
  (R73((> elfe 0)) (attaque (2)))
  (R74((> elfe 0)) (vitesse (2)))
  (R75((> nain 0)) ( attaque (1)))
  (R76((> mummakil 0)) ( vitesse (2)))
  (R77((> troll 0)) ( vitesse (2)))
   
  (R78((equal terrain forteresse) (> siege 0)) (attaque (3)))
  (R79((equal terrain forteresse) (> siege 0)) (defense (4)))
  (R80((> homme 0)) (nombre (1)))
  (R81((> warg 0)) (nombre (1)))
  (R82((> elfe 0)) (nombre (1)))
  (R83((> nain 0)) (nombre (1)))
  (R84((> orc 0)) (nombre (1)))
  (R85((> catapulte 0)) (nombre (1)))
  (R86((> gobelin 0)) (nombre (1)))
  (R87((> hobbit 0)) (nombre (1)))
  (R88((> mummakil 0)) (nombre (15)))
  (R89((> troll 0)) (nombre (1)))
   
  (R90((equal terrain plaine)(> nombre 0)) (espace (2)))
   
  (R91((equal terrain forteresse)(> archer 0)) (defense (3)))
  (R92((equal terrain forteresse)(> archer 0)) (portée (2)))
  (R93((equal environnement foret)(> elfe 0)) (attaque (2)))
  (R94((equal environnement foret)(> elfe 0)) (defense (2)))
  (R95((equal environnement souterrain)(> nain 0)) (defense (3)))
  (R96((equal environnement souterrain)(> gobelin 0)) (defense (2)))
  (R97((equal environnement souterrain)(> gobelin 0)) (attaque (2)))
  (R98((equal terrain forteresse)(> vitesse -800000)) (vitesse (-1)))
  (R99((equal terrain souterrain)(> nain 0)) (attaque (3))))
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
  (let (
    ;;================variables=============
      (regles_appliquees nil)
    )
  (parcours_liste armees)
  (parcours_liste (list (cdr (assoc 'lieu *Lieux*))(cdr (assoc 'lieu *Lieux*))))  
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
  )
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
    (print 'premisses)
    (print premisses)
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
                    (print 'prop_a_modifier)
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
                (progn
                    (print 'nouvelle_valeur)
                    (print nouvelle_valeur)
                    (print valeur_prop)
                    (print conclusion)
                            
                ;;================on ajoute les valeur calculées le cas échéant
                (set base (acons (car conclusion) (* valeur_prop (car nouvelle_valeur)) BF ))
                    (print 'nouvelle_valeur_validée)
                )
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
    (setq defense (- (cdr(assoc 'defense *Alliés*) )(cdr(assoc 'attaque *Ennemis*))))
    (setq vitesse (- (cdr(assoc 'vitesse *Alliés*) )(cdr(assoc 'vitesse *Ennemis*))))
    (setq nombre (- (cdr(assoc 'nombre *Alliés*) )(cdr(assoc 'nombre *Ennemis*))))
    (setq portee (- (cdr(assoc 'portee *Alliés*)) (cdr(assoc 'portee *Ennemis*))))
    (setq espace (- (cdr(assoc 'espace *Alliés*) )(cdr(assoc 'espace *Ennemis*))))

    (setq coeff (+ attaque defense vitesse nombre portee espace))
    (print coeff)
    (cond
      ( (< coeff -5)
        (print "Ici la météo de la Terre du Milieu: une pluie d'agonies lentes et douloureuses en approche.")
      )
      ( (AND (>= coeff -5) (< coeff -1))
        (print "Et tout de suite, l'horoscope: votre journée sera longue pénible et douloureuse, mais ne baissez pas les bras")
      )
      ( (AND (>= coeff -1) (<= coeff 1))
        (print "Un combat féroce, mais équilibré")
      )
      ( (AND (> coeff 1) (< coeff 5))
        (print "Izy ma gueule")
      )
      ( (> coeff 5)
        (print "Ne sont ils pas mignons quand ils se font flecher?")
      )
    )
  )
)





