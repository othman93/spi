
PROMPT Creating Trigger Logic for Table 'CANDIDAT'
PROMPT Creating Before Insert Statement Trigger on 'CANDIDAT'
CREATE OR REPLACE TRIGGER cg$BIS_CANDIDAT
BEFORE INSERT ON CANDIDAT
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$CANDIDAT.cg$table.DELETE;
    cg$CANDIDAT.cg$tableind.DELETE;
    cg$CANDIDAT.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'CANDIDAT'
CREATE OR REPLACE TRIGGER cg$BIR_CANDIDAT 
BEFORE INSERT ON CANDIDAT FOR EACH ROW
DECLARE
    cg$rec cg$CANDIDAT.cg$row_type;
    cg$ind cg$CANDIDAT.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.CODE_FORMATION := :new.CODE_FORMATION;
    cg$ind.CODE_FORMATION := TRUE;
    cg$rec.ANNEE_UNIVERSITAIRE := :new.ANNEE_UNIVERSITAIRE;
    cg$ind.ANNEE_UNIVERSITAIRE := TRUE;
    cg$rec.NO_CANDIDAT := :new.NO_CANDIDAT;
    IF (:new.NO_CANDIDAT IS NULL) THEN
        cg$ind.NO_CANDIDAT := FALSE;
    ELSE
        cg$ind.NO_CANDIDAT := TRUE;
    END IF;
    cg$rec.NOM := :new.NOM;
    IF (:new.NOM IS NULL) THEN
        cg$ind.NOM := FALSE;
    ELSE
        cg$ind.NOM := TRUE;
    END IF;
    cg$rec.PRENOM := :new.PRENOM;
    cg$ind.PRENOM := TRUE;
    cg$rec.SEXE := :new.SEXE;
    cg$ind.SEXE := TRUE;
    cg$rec.DATE_NAISSANCE := :new.DATE_NAISSANCE;
    cg$ind.DATE_NAISSANCE := TRUE;
    cg$rec.LIEU_NAISSANCE := :new.LIEU_NAISSANCE;
    cg$ind.LIEU_NAISSANCE := TRUE;
    cg$rec.NATIONALITE := :new.NATIONALITE;
    cg$ind.NATIONALITE := TRUE;
    cg$rec.TELEPHONE := :new.TELEPHONE;
    cg$ind.TELEPHONE := TRUE;
    cg$rec.MOBILE := :new.MOBILE;
    cg$ind.MOBILE := TRUE;
    cg$rec.EMAIL := :new.EMAIL;
    cg$ind.EMAIL := TRUE;
    cg$rec.ADRESSE := :new.ADRESSE;
    cg$ind.ADRESSE := TRUE;
    cg$rec.CODE_POSTAL := :new.CODE_POSTAL;
    cg$ind.CODE_POSTAL := TRUE;
    cg$rec.VILLE := :new.VILLE;
    cg$ind.VILLE := TRUE;
    cg$rec.PAYS_ORIGINE := :new.PAYS_ORIGINE;
    cg$ind.PAYS_ORIGINE := TRUE;
    cg$rec.UNIVERSITE_ORIGINE := :new.UNIVERSITE_ORIGINE;
    cg$ind.UNIVERSITE_ORIGINE := TRUE;
    cg$rec.LISTE_SELECTION := :new.LISTE_SELECTION;
    cg$ind.LISTE_SELECTION := TRUE;
    cg$rec.SELECTION_NO_ORDRE := :new.SELECTION_NO_ORDRE;
    cg$ind.SELECTION_NO_ORDRE := TRUE;
    cg$rec.CONFIRMATION_CANDIDAT := :new.CONFIRMATION_CANDIDAT;
    cg$ind.CONFIRMATION_CANDIDAT := TRUE;
    cg$rec.DATE_REPONSE_CANDIDAT := :new.DATE_REPONSE_CANDIDAT;
    cg$ind.DATE_REPONSE_CANDIDAT := TRUE;

    if not (cg$CANDIDAT.called_from_package) then
        cg$CANDIDAT.validate_arc(cg$rec);
        cg$CANDIDAT.validate_domain(cg$rec);

        cg$CANDIDAT.ins(cg$rec, cg$ind, FALSE);
        cg$CANDIDAT.called_from_package := FALSE;
    end if;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).CODE_FORMATION := cg$rec.CODE_FORMATION;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).CODE_FORMATION := cg$ind.CODE_FORMATION;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).ANNEE_UNIVERSITAIRE := cg$rec.ANNEE_UNIVERSITAIRE;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).ANNEE_UNIVERSITAIRE := cg$ind.ANNEE_UNIVERSITAIRE;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).NO_CANDIDAT := cg$rec.NO_CANDIDAT;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).NO_CANDIDAT := cg$ind.NO_CANDIDAT;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).NOM := cg$rec.NOM;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).NOM := cg$ind.NOM;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).PRENOM := cg$rec.PRENOM;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).PRENOM := cg$ind.PRENOM;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).SEXE := cg$rec.SEXE;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).SEXE := cg$ind.SEXE;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).DATE_NAISSANCE := cg$rec.DATE_NAISSANCE;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).DATE_NAISSANCE := cg$ind.DATE_NAISSANCE;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).LIEU_NAISSANCE := cg$rec.LIEU_NAISSANCE;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).LIEU_NAISSANCE := cg$ind.LIEU_NAISSANCE;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).NATIONALITE := cg$rec.NATIONALITE;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).NATIONALITE := cg$ind.NATIONALITE;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).TELEPHONE := cg$rec.TELEPHONE;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).TELEPHONE := cg$ind.TELEPHONE;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).MOBILE := cg$rec.MOBILE;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).MOBILE := cg$ind.MOBILE;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).EMAIL := cg$rec.EMAIL;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).EMAIL := cg$ind.EMAIL;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).ADRESSE := cg$rec.ADRESSE;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).ADRESSE := cg$ind.ADRESSE;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).CODE_POSTAL := cg$rec.CODE_POSTAL;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).CODE_POSTAL := cg$ind.CODE_POSTAL;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).VILLE := cg$rec.VILLE;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).VILLE := cg$ind.VILLE;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).PAYS_ORIGINE := cg$rec.PAYS_ORIGINE;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).PAYS_ORIGINE := cg$ind.PAYS_ORIGINE;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).UNIVERSITE_ORIGINE := cg$rec.UNIVERSITE_ORIGINE;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).UNIVERSITE_ORIGINE := cg$ind.UNIVERSITE_ORIGINE;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).LISTE_SELECTION := cg$rec.LISTE_SELECTION;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).LISTE_SELECTION := cg$ind.LISTE_SELECTION;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).SELECTION_NO_ORDRE := cg$rec.SELECTION_NO_ORDRE;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).SELECTION_NO_ORDRE := cg$ind.SELECTION_NO_ORDRE;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).CONFIRMATION_CANDIDAT := cg$rec.CONFIRMATION_CANDIDAT;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).CONFIRMATION_CANDIDAT := cg$ind.CONFIRMATION_CANDIDAT;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).DATE_REPONSE_CANDIDAT := cg$rec.DATE_REPONSE_CANDIDAT;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).DATE_REPONSE_CANDIDAT := cg$ind.DATE_REPONSE_CANDIDAT;


    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).action_performed := 'INS';
    cg$CANDIDAT.idx := cg$CANDIDAT.idx + 1;

    :new.CODE_FORMATION := cg$rec.CODE_FORMATION;
    :new.ANNEE_UNIVERSITAIRE := cg$rec.ANNEE_UNIVERSITAIRE;
    :new.NO_CANDIDAT := cg$rec.NO_CANDIDAT;
    :new.NOM := cg$rec.NOM;
    :new.PRENOM := cg$rec.PRENOM;
    :new.SEXE := cg$rec.SEXE;
    :new.DATE_NAISSANCE := cg$rec.DATE_NAISSANCE;
    :new.LIEU_NAISSANCE := cg$rec.LIEU_NAISSANCE;
    :new.NATIONALITE := cg$rec.NATIONALITE;
    :new.TELEPHONE := cg$rec.TELEPHONE;
    :new.MOBILE := cg$rec.MOBILE;
    :new.EMAIL := cg$rec.EMAIL;
    :new.ADRESSE := cg$rec.ADRESSE;
    :new.CODE_POSTAL := cg$rec.CODE_POSTAL;
    :new.VILLE := cg$rec.VILLE;
    :new.PAYS_ORIGINE := cg$rec.PAYS_ORIGINE;
    :new.UNIVERSITE_ORIGINE := cg$rec.UNIVERSITE_ORIGINE;
    :new.LISTE_SELECTION := cg$rec.LISTE_SELECTION;
    :new.SELECTION_NO_ORDRE := cg$rec.SELECTION_NO_ORDRE;
    :new.CONFIRMATION_CANDIDAT := cg$rec.CONFIRMATION_CANDIDAT;
    :new.DATE_REPONSE_CANDIDAT := cg$rec.DATE_REPONSE_CANDIDAT;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_CANDIDAT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_CANDIDAT
AFTER INSERT ON CANDIDAT FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_CANDIDAT
/

PROMPT Creating After Insert Statement Trigger on 'CANDIDAT'
CREATE OR REPLACE TRIGGER cg$AIS_CANDIDAT 
AFTER INSERT ON CANDIDAT
DECLARE
    idx      BINARY_INTEGER := cg$CANDIDAT.cg$table.FIRST;
    cg$rec   cg$CANDIDAT.cg$row_type;
    cg$old_rec   cg$CANDIDAT.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$CANDIDAT.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP

	    IF (cg$CANDIDAT.cg$table(idx).action_performed = 'INS') THEN
                cg$rec.CODE_FORMATION := cg$CANDIDAT.cg$table(idx).CODE_FORMATION;
                cg$rec.ANNEE_UNIVERSITAIRE := cg$CANDIDAT.cg$table(idx).ANNEE_UNIVERSITAIRE;
                cg$rec.NO_CANDIDAT := cg$CANDIDAT.cg$table(idx).NO_CANDIDAT;
                cg$rec.NOM := cg$CANDIDAT.cg$table(idx).NOM;
                cg$rec.PRENOM := cg$CANDIDAT.cg$table(idx).PRENOM;
                cg$rec.SEXE := cg$CANDIDAT.cg$table(idx).SEXE;
                cg$rec.DATE_NAISSANCE := cg$CANDIDAT.cg$table(idx).DATE_NAISSANCE;
                cg$rec.LIEU_NAISSANCE := cg$CANDIDAT.cg$table(idx).LIEU_NAISSANCE;
                cg$rec.NATIONALITE := cg$CANDIDAT.cg$table(idx).NATIONALITE;
                cg$rec.TELEPHONE := cg$CANDIDAT.cg$table(idx).TELEPHONE;
                cg$rec.MOBILE := cg$CANDIDAT.cg$table(idx).MOBILE;
                cg$rec.EMAIL := cg$CANDIDAT.cg$table(idx).EMAIL;
                cg$rec.ADRESSE := cg$CANDIDAT.cg$table(idx).ADRESSE;
                cg$rec.CODE_POSTAL := cg$CANDIDAT.cg$table(idx).CODE_POSTAL;
                cg$rec.VILLE := cg$CANDIDAT.cg$table(idx).VILLE;
                cg$rec.PAYS_ORIGINE := cg$CANDIDAT.cg$table(idx).PAYS_ORIGINE;
                cg$rec.UNIVERSITE_ORIGINE := cg$CANDIDAT.cg$table(idx).UNIVERSITE_ORIGINE;
                cg$rec.LISTE_SELECTION := cg$CANDIDAT.cg$table(idx).LISTE_SELECTION;
                cg$rec.SELECTION_NO_ORDRE := cg$CANDIDAT.cg$table(idx).SELECTION_NO_ORDRE;
                cg$rec.CONFIRMATION_CANDIDAT := cg$CANDIDAT.cg$table(idx).CONFIRMATION_CANDIDAT;
                cg$rec.DATE_REPONSE_CANDIDAT := cg$CANDIDAT.cg$table(idx).DATE_REPONSE_CANDIDAT;

                cg$CANDIDAT.validate_foreign_keys_ins(cg$rec);

                cg$CANDIDAT.upd_oper_denorm2( cg$rec,
                                                    cg$old_rec,
                                                    cg$CANDIDAT.cg$tableind(idx),
                                                    'INS'
                                                  );
            END IF;
            idx := cg$CANDIDAT.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'CANDIDAT'
CREATE OR REPLACE TRIGGER cg$BUS_CANDIDAT
BEFORE UPDATE ON CANDIDAT
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$CANDIDAT.cg$table.DELETE;
    cg$CANDIDAT.cg$tableind.DELETE;
    cg$CANDIDAT.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'CANDIDAT'
CREATE OR REPLACE TRIGGER cg$BUR_CANDIDAT 
BEFORE UPDATE ON CANDIDAT FOR EACH ROW
DECLARE
    cg$rec     cg$CANDIDAT.cg$row_type;
    cg$ind     cg$CANDIDAT.cg$ind_type;
    cg$old_rec cg$CANDIDAT.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.CODE_FORMATION := :new.CODE_FORMATION;
    cg$ind.CODE_FORMATION :=    (:new.CODE_FORMATION IS NULL AND :old.CODE_FORMATION IS NOT NULL )
                        OR (:new.CODE_FORMATION IS NOT NULL AND :old.CODE_FORMATION IS NULL)
                        OR NOT(:new.CODE_FORMATION = :old.CODE_FORMATION) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).CODE_FORMATION := :old.CODE_FORMATION;
    cg$rec.ANNEE_UNIVERSITAIRE := :new.ANNEE_UNIVERSITAIRE;
    cg$ind.ANNEE_UNIVERSITAIRE :=    (:new.ANNEE_UNIVERSITAIRE IS NULL AND :old.ANNEE_UNIVERSITAIRE IS NOT NULL )
                        OR (:new.ANNEE_UNIVERSITAIRE IS NOT NULL AND :old.ANNEE_UNIVERSITAIRE IS NULL)
                        OR NOT(:new.ANNEE_UNIVERSITAIRE = :old.ANNEE_UNIVERSITAIRE) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).ANNEE_UNIVERSITAIRE := :old.ANNEE_UNIVERSITAIRE;
    cg$rec.NO_CANDIDAT := :new.NO_CANDIDAT;
    cg$ind.NO_CANDIDAT :=    (:new.NO_CANDIDAT IS NULL AND :old.NO_CANDIDAT IS NOT NULL )
                        OR (:new.NO_CANDIDAT IS NOT NULL AND :old.NO_CANDIDAT IS NULL)
                        OR NOT(:new.NO_CANDIDAT = :old.NO_CANDIDAT) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).NO_CANDIDAT := :old.NO_CANDIDAT;
    cg$rec.NOM := :new.NOM;
    cg$ind.NOM :=    (:new.NOM IS NULL AND :old.NOM IS NOT NULL )
                        OR (:new.NOM IS NOT NULL AND :old.NOM IS NULL)
                        OR NOT(:new.NOM = :old.NOM) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).NOM := :old.NOM;
    cg$rec.PRENOM := :new.PRENOM;
    cg$ind.PRENOM :=    (:new.PRENOM IS NULL AND :old.PRENOM IS NOT NULL )
                        OR (:new.PRENOM IS NOT NULL AND :old.PRENOM IS NULL)
                        OR NOT(:new.PRENOM = :old.PRENOM) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).PRENOM := :old.PRENOM;
    cg$rec.SEXE := :new.SEXE;
    cg$ind.SEXE :=    (:new.SEXE IS NULL AND :old.SEXE IS NOT NULL )
                        OR (:new.SEXE IS NOT NULL AND :old.SEXE IS NULL)
                        OR NOT(:new.SEXE = :old.SEXE) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).SEXE := :old.SEXE;
    cg$rec.DATE_NAISSANCE := :new.DATE_NAISSANCE;
    cg$ind.DATE_NAISSANCE :=    (:new.DATE_NAISSANCE IS NULL AND :old.DATE_NAISSANCE IS NOT NULL )
                        OR (:new.DATE_NAISSANCE IS NOT NULL AND :old.DATE_NAISSANCE IS NULL)
                        OR NOT(:new.DATE_NAISSANCE = :old.DATE_NAISSANCE) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).DATE_NAISSANCE := :old.DATE_NAISSANCE;
    cg$rec.LIEU_NAISSANCE := :new.LIEU_NAISSANCE;
    cg$ind.LIEU_NAISSANCE :=    (:new.LIEU_NAISSANCE IS NULL AND :old.LIEU_NAISSANCE IS NOT NULL )
                        OR (:new.LIEU_NAISSANCE IS NOT NULL AND :old.LIEU_NAISSANCE IS NULL)
                        OR NOT(:new.LIEU_NAISSANCE = :old.LIEU_NAISSANCE) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).LIEU_NAISSANCE := :old.LIEU_NAISSANCE;
    cg$rec.NATIONALITE := :new.NATIONALITE;
    cg$ind.NATIONALITE :=    (:new.NATIONALITE IS NULL AND :old.NATIONALITE IS NOT NULL )
                        OR (:new.NATIONALITE IS NOT NULL AND :old.NATIONALITE IS NULL)
                        OR NOT(:new.NATIONALITE = :old.NATIONALITE) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).NATIONALITE := :old.NATIONALITE;
    cg$rec.TELEPHONE := :new.TELEPHONE;
    cg$ind.TELEPHONE :=    (:new.TELEPHONE IS NULL AND :old.TELEPHONE IS NOT NULL )
                        OR (:new.TELEPHONE IS NOT NULL AND :old.TELEPHONE IS NULL)
                        OR NOT(:new.TELEPHONE = :old.TELEPHONE) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).TELEPHONE := :old.TELEPHONE;
    cg$rec.MOBILE := :new.MOBILE;
    cg$ind.MOBILE :=    (:new.MOBILE IS NULL AND :old.MOBILE IS NOT NULL )
                        OR (:new.MOBILE IS NOT NULL AND :old.MOBILE IS NULL)
                        OR NOT(:new.MOBILE = :old.MOBILE) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).MOBILE := :old.MOBILE;
    cg$rec.EMAIL := :new.EMAIL;
    cg$ind.EMAIL :=    (:new.EMAIL IS NULL AND :old.EMAIL IS NOT NULL )
                        OR (:new.EMAIL IS NOT NULL AND :old.EMAIL IS NULL)
                        OR NOT(:new.EMAIL = :old.EMAIL) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).EMAIL := :old.EMAIL;
    cg$rec.ADRESSE := :new.ADRESSE;
    cg$ind.ADRESSE :=    (:new.ADRESSE IS NULL AND :old.ADRESSE IS NOT NULL )
                        OR (:new.ADRESSE IS NOT NULL AND :old.ADRESSE IS NULL)
                        OR NOT(:new.ADRESSE = :old.ADRESSE) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).ADRESSE := :old.ADRESSE;
    cg$rec.CODE_POSTAL := :new.CODE_POSTAL;
    cg$ind.CODE_POSTAL :=    (:new.CODE_POSTAL IS NULL AND :old.CODE_POSTAL IS NOT NULL )
                        OR (:new.CODE_POSTAL IS NOT NULL AND :old.CODE_POSTAL IS NULL)
                        OR NOT(:new.CODE_POSTAL = :old.CODE_POSTAL) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).CODE_POSTAL := :old.CODE_POSTAL;
    cg$rec.VILLE := :new.VILLE;
    cg$ind.VILLE :=    (:new.VILLE IS NULL AND :old.VILLE IS NOT NULL )
                        OR (:new.VILLE IS NOT NULL AND :old.VILLE IS NULL)
                        OR NOT(:new.VILLE = :old.VILLE) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).VILLE := :old.VILLE;
    cg$rec.PAYS_ORIGINE := :new.PAYS_ORIGINE;
    cg$ind.PAYS_ORIGINE :=    (:new.PAYS_ORIGINE IS NULL AND :old.PAYS_ORIGINE IS NOT NULL )
                        OR (:new.PAYS_ORIGINE IS NOT NULL AND :old.PAYS_ORIGINE IS NULL)
                        OR NOT(:new.PAYS_ORIGINE = :old.PAYS_ORIGINE) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).PAYS_ORIGINE := :old.PAYS_ORIGINE;
    cg$rec.UNIVERSITE_ORIGINE := :new.UNIVERSITE_ORIGINE;
    cg$ind.UNIVERSITE_ORIGINE :=    (:new.UNIVERSITE_ORIGINE IS NULL AND :old.UNIVERSITE_ORIGINE IS NOT NULL )
                        OR (:new.UNIVERSITE_ORIGINE IS NOT NULL AND :old.UNIVERSITE_ORIGINE IS NULL)
                        OR NOT(:new.UNIVERSITE_ORIGINE = :old.UNIVERSITE_ORIGINE) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).UNIVERSITE_ORIGINE := :old.UNIVERSITE_ORIGINE;
    cg$rec.LISTE_SELECTION := :new.LISTE_SELECTION;
    cg$ind.LISTE_SELECTION :=    (:new.LISTE_SELECTION IS NULL AND :old.LISTE_SELECTION IS NOT NULL )
                        OR (:new.LISTE_SELECTION IS NOT NULL AND :old.LISTE_SELECTION IS NULL)
                        OR NOT(:new.LISTE_SELECTION = :old.LISTE_SELECTION) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).LISTE_SELECTION := :old.LISTE_SELECTION;
    cg$rec.SELECTION_NO_ORDRE := :new.SELECTION_NO_ORDRE;
    cg$ind.SELECTION_NO_ORDRE :=    (:new.SELECTION_NO_ORDRE IS NULL AND :old.SELECTION_NO_ORDRE IS NOT NULL )
                        OR (:new.SELECTION_NO_ORDRE IS NOT NULL AND :old.SELECTION_NO_ORDRE IS NULL)
                        OR NOT(:new.SELECTION_NO_ORDRE = :old.SELECTION_NO_ORDRE) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).SELECTION_NO_ORDRE := :old.SELECTION_NO_ORDRE;
    cg$rec.CONFIRMATION_CANDIDAT := :new.CONFIRMATION_CANDIDAT;
    cg$ind.CONFIRMATION_CANDIDAT :=    (:new.CONFIRMATION_CANDIDAT IS NULL AND :old.CONFIRMATION_CANDIDAT IS NOT NULL )
                        OR (:new.CONFIRMATION_CANDIDAT IS NOT NULL AND :old.CONFIRMATION_CANDIDAT IS NULL)
                        OR NOT(:new.CONFIRMATION_CANDIDAT = :old.CONFIRMATION_CANDIDAT) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).CONFIRMATION_CANDIDAT := :old.CONFIRMATION_CANDIDAT;
    cg$rec.DATE_REPONSE_CANDIDAT := :new.DATE_REPONSE_CANDIDAT;
    cg$ind.DATE_REPONSE_CANDIDAT :=    (:new.DATE_REPONSE_CANDIDAT IS NULL AND :old.DATE_REPONSE_CANDIDAT IS NOT NULL )
                        OR (:new.DATE_REPONSE_CANDIDAT IS NOT NULL AND :old.DATE_REPONSE_CANDIDAT IS NULL)
                        OR NOT(:new.DATE_REPONSE_CANDIDAT = :old.DATE_REPONSE_CANDIDAT) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).DATE_REPONSE_CANDIDAT := :old.DATE_REPONSE_CANDIDAT;


    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).action_performed := 'UPD';     -- nkovoor
    cg$CANDIDAT.idx := cg$CANDIDAT.idx + 1;

    if not (cg$CANDIDAT.called_from_package) then
        cg$CANDIDAT.validate_arc(cg$rec);
        cg$CANDIDAT.validate_domain(cg$rec, cg$ind);
        cg$CANDIDAT.validate_domain_cascade_update(cg$old_rec);   

        cg$CANDIDAT.upd(cg$rec, cg$ind, FALSE);
        cg$CANDIDAT.called_from_package := FALSE;
    end if;

    :new.NOM := cg$rec.NOM;
    :new.PRENOM := cg$rec.PRENOM;
    :new.SEXE := cg$rec.SEXE;
    :new.DATE_NAISSANCE := cg$rec.DATE_NAISSANCE;
    :new.LIEU_NAISSANCE := cg$rec.LIEU_NAISSANCE;
    :new.NATIONALITE := cg$rec.NATIONALITE;
    :new.TELEPHONE := cg$rec.TELEPHONE;
    :new.MOBILE := cg$rec.MOBILE;
    :new.EMAIL := cg$rec.EMAIL;
    :new.ADRESSE := cg$rec.ADRESSE;
    :new.CODE_POSTAL := cg$rec.CODE_POSTAL;
    :new.VILLE := cg$rec.VILLE;
    :new.PAYS_ORIGINE := cg$rec.PAYS_ORIGINE;
    :new.UNIVERSITE_ORIGINE := cg$rec.UNIVERSITE_ORIGINE;
    :new.LISTE_SELECTION := cg$rec.LISTE_SELECTION;
    :new.SELECTION_NO_ORDRE := cg$rec.SELECTION_NO_ORDRE;
    :new.CONFIRMATION_CANDIDAT := cg$rec.CONFIRMATION_CANDIDAT;
    :new.DATE_REPONSE_CANDIDAT := cg$rec.DATE_REPONSE_CANDIDAT;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_CANDIDAT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_CANDIDAT
AFTER UPDATE ON CANDIDAT FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_CANDIDAT
/






PROMPT Creating After Update Statement Trigger on 'CANDIDAT'
CREATE OR REPLACE TRIGGER cg$AUS_CANDIDAT 
AFTER UPDATE ON CANDIDAT
DECLARE
    idx        BINARY_INTEGER := cg$CANDIDAT.cg$table.FIRST;
    cg$old_rec cg$CANDIDAT.cg$row_type;
    cg$rec     cg$CANDIDAT.cg$row_type;
    cg$ind     cg$CANDIDAT.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP

        IF (cg$CANDIDAT.cg$table(idx).action_performed = 'UPD') THEN
            cg$old_rec.CODE_FORMATION := cg$CANDIDAT.cg$table(idx).CODE_FORMATION;
            cg$old_rec.ANNEE_UNIVERSITAIRE := cg$CANDIDAT.cg$table(idx).ANNEE_UNIVERSITAIRE;
            cg$old_rec.NO_CANDIDAT := cg$CANDIDAT.cg$table(idx).NO_CANDIDAT;
            cg$old_rec.NOM := cg$CANDIDAT.cg$table(idx).NOM;
            cg$old_rec.PRENOM := cg$CANDIDAT.cg$table(idx).PRENOM;
            cg$old_rec.SEXE := cg$CANDIDAT.cg$table(idx).SEXE;
            cg$old_rec.DATE_NAISSANCE := cg$CANDIDAT.cg$table(idx).DATE_NAISSANCE;
            cg$old_rec.LIEU_NAISSANCE := cg$CANDIDAT.cg$table(idx).LIEU_NAISSANCE;
            cg$old_rec.NATIONALITE := cg$CANDIDAT.cg$table(idx).NATIONALITE;
            cg$old_rec.TELEPHONE := cg$CANDIDAT.cg$table(idx).TELEPHONE;
            cg$old_rec.MOBILE := cg$CANDIDAT.cg$table(idx).MOBILE;
            cg$old_rec.EMAIL := cg$CANDIDAT.cg$table(idx).EMAIL;
            cg$old_rec.ADRESSE := cg$CANDIDAT.cg$table(idx).ADRESSE;
            cg$old_rec.CODE_POSTAL := cg$CANDIDAT.cg$table(idx).CODE_POSTAL;
            cg$old_rec.VILLE := cg$CANDIDAT.cg$table(idx).VILLE;
            cg$old_rec.PAYS_ORIGINE := cg$CANDIDAT.cg$table(idx).PAYS_ORIGINE;
            cg$old_rec.UNIVERSITE_ORIGINE := cg$CANDIDAT.cg$table(idx).UNIVERSITE_ORIGINE;
            cg$old_rec.LISTE_SELECTION := cg$CANDIDAT.cg$table(idx).LISTE_SELECTION;
            cg$old_rec.SELECTION_NO_ORDRE := cg$CANDIDAT.cg$table(idx).SELECTION_NO_ORDRE;
            cg$old_rec.CONFIRMATION_CANDIDAT := cg$CANDIDAT.cg$table(idx).CONFIRMATION_CANDIDAT;
            cg$old_rec.DATE_REPONSE_CANDIDAT := cg$CANDIDAT.cg$table(idx).DATE_REPONSE_CANDIDAT;

            IF NOT (cg$CANDIDAT.called_from_package) THEN
                idx := cg$CANDIDAT.cg$table.NEXT(idx);

                IF (idx IS NOT NULL) THEN
                cg$rec.CODE_FORMATION := cg$CANDIDAT.cg$table(idx).CODE_FORMATION;
                cg$ind.CODE_FORMATION := updating('CODE_FORMATION');
                cg$rec.ANNEE_UNIVERSITAIRE := cg$CANDIDAT.cg$table(idx).ANNEE_UNIVERSITAIRE;
                cg$ind.ANNEE_UNIVERSITAIRE := updating('ANNEE_UNIVERSITAIRE');
                cg$rec.NO_CANDIDAT := cg$CANDIDAT.cg$table(idx).NO_CANDIDAT;
                cg$ind.NO_CANDIDAT := updating('NO_CANDIDAT');
                cg$rec.NOM := cg$CANDIDAT.cg$table(idx).NOM;
                cg$ind.NOM := updating('NOM');
                cg$rec.PRENOM := cg$CANDIDAT.cg$table(idx).PRENOM;
                cg$ind.PRENOM := updating('PRENOM');
                cg$rec.SEXE := cg$CANDIDAT.cg$table(idx).SEXE;
                cg$ind.SEXE := updating('SEXE');
                cg$rec.DATE_NAISSANCE := cg$CANDIDAT.cg$table(idx).DATE_NAISSANCE;
                cg$ind.DATE_NAISSANCE := updating('DATE_NAISSANCE');
                cg$rec.LIEU_NAISSANCE := cg$CANDIDAT.cg$table(idx).LIEU_NAISSANCE;
                cg$ind.LIEU_NAISSANCE := updating('LIEU_NAISSANCE');
                cg$rec.NATIONALITE := cg$CANDIDAT.cg$table(idx).NATIONALITE;
                cg$ind.NATIONALITE := updating('NATIONALITE');
                cg$rec.TELEPHONE := cg$CANDIDAT.cg$table(idx).TELEPHONE;
                cg$ind.TELEPHONE := updating('TELEPHONE');
                cg$rec.MOBILE := cg$CANDIDAT.cg$table(idx).MOBILE;
                cg$ind.MOBILE := updating('MOBILE');
                cg$rec.EMAIL := cg$CANDIDAT.cg$table(idx).EMAIL;
                cg$ind.EMAIL := updating('EMAIL');
                cg$rec.ADRESSE := cg$CANDIDAT.cg$table(idx).ADRESSE;
                cg$ind.ADRESSE := updating('ADRESSE');
                cg$rec.CODE_POSTAL := cg$CANDIDAT.cg$table(idx).CODE_POSTAL;
                cg$ind.CODE_POSTAL := updating('CODE_POSTAL');
                cg$rec.VILLE := cg$CANDIDAT.cg$table(idx).VILLE;
                cg$ind.VILLE := updating('VILLE');
                cg$rec.PAYS_ORIGINE := cg$CANDIDAT.cg$table(idx).PAYS_ORIGINE;
                cg$ind.PAYS_ORIGINE := updating('PAYS_ORIGINE');
                cg$rec.UNIVERSITE_ORIGINE := cg$CANDIDAT.cg$table(idx).UNIVERSITE_ORIGINE;
                cg$ind.UNIVERSITE_ORIGINE := updating('UNIVERSITE_ORIGINE');
                cg$rec.LISTE_SELECTION := cg$CANDIDAT.cg$table(idx).LISTE_SELECTION;
                cg$ind.LISTE_SELECTION := updating('LISTE_SELECTION');
                cg$rec.SELECTION_NO_ORDRE := cg$CANDIDAT.cg$table(idx).SELECTION_NO_ORDRE;
                cg$ind.SELECTION_NO_ORDRE := updating('SELECTION_NO_ORDRE');
                cg$rec.CONFIRMATION_CANDIDAT := cg$CANDIDAT.cg$table(idx).CONFIRMATION_CANDIDAT;
                cg$ind.CONFIRMATION_CANDIDAT := updating('CONFIRMATION_CANDIDAT');
                cg$rec.DATE_REPONSE_CANDIDAT := cg$CANDIDAT.cg$table(idx).DATE_REPONSE_CANDIDAT;
                cg$ind.DATE_REPONSE_CANDIDAT := updating('DATE_REPONSE_CANDIDAT');

                cg$CANDIDAT.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

                cg$CANDIDAT.upd_denorm2( cg$rec,
                                               cg$CANDIDAT.cg$tableind(idx)
                                             );
                cg$CANDIDAT.upd_oper_denorm2( cg$rec,
                                                    cg$old_rec,
                                                    cg$CANDIDAT.cg$tableind(idx)
				        				                  );
                cg$CANDIDAT.cascade_update(cg$rec, cg$old_rec);
                cg$CANDIDAT.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             
        
                cg$CANDIDAT.called_from_package := FALSE;
                END IF;
            END IF; 
        END IF;
        idx := cg$CANDIDAT.cg$table.NEXT(idx);
    END LOOP;

    cg$CANDIDAT.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'CANDIDAT'
CREATE OR REPLACE TRIGGER cg$BDS_CANDIDAT
BEFORE DELETE ON CANDIDAT
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$CANDIDAT.cg$table.DELETE;
    cg$CANDIDAT.cg$tableind.DELETE;
    cg$CANDIDAT.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'CANDIDAT'
CREATE OR REPLACE TRIGGER cg$BDR_CANDIDAT 
BEFORE DELETE ON CANDIDAT FOR EACH ROW
DECLARE
    cg$pk cg$CANDIDAT.cg$pk_type;
    cg$rec cg$CANDIDAT.cg$row_type;
    cg$ind cg$CANDIDAT.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.CODE_FORMATION  := :old.CODE_FORMATION;
    cg$rec.CODE_FORMATION := :old.CODE_FORMATION;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).CODE_FORMATION := :old.CODE_FORMATION;
    cg$pk.ANNEE_UNIVERSITAIRE  := :old.ANNEE_UNIVERSITAIRE;
    cg$rec.ANNEE_UNIVERSITAIRE := :old.ANNEE_UNIVERSITAIRE;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).ANNEE_UNIVERSITAIRE := :old.ANNEE_UNIVERSITAIRE;
    cg$pk.NO_CANDIDAT  := :old.NO_CANDIDAT;
    cg$rec.NO_CANDIDAT := :old.NO_CANDIDAT;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).NO_CANDIDAT := :old.NO_CANDIDAT;
    cg$rec.CODE_FORMATION := :old.CODE_FORMATION;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).CODE_FORMATION := :old.CODE_FORMATION;
    cg$rec.ANNEE_UNIVERSITAIRE := :old.ANNEE_UNIVERSITAIRE;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).ANNEE_UNIVERSITAIRE := :old.ANNEE_UNIVERSITAIRE;


    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).action_performed := 'DEL';
    cg$CANDIDAT.idx := cg$CANDIDAT.idx + 1;

    if not (cg$CANDIDAT.called_from_package) then
        cg$CANDIDAT.validate_domain_cascade_delete(cg$rec);   
        cg$CANDIDAT.del(cg$pk, FALSE);
        cg$CANDIDAT.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_CANDIDAT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_CANDIDAT
AFTER DELETE ON CANDIDAT FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_CANDIDAT
/

PROMPT Creating After Delete Statement Trigger on 'CANDIDAT'
CREATE OR REPLACE TRIGGER cg$ADS_CANDIDAT 
AFTER DELETE ON CANDIDAT
DECLARE
    idx        BINARY_INTEGER := cg$CANDIDAT.cg$table.FIRST;
    cg$rec   cg$CANDIDAT.cg$row_type;
    cg$old_rec   cg$CANDIDAT.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$CANDIDAT.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP

            IF (cg$CANDIDAT.cg$table(idx).action_performed = 'DEL') THEN
                cg$rec.CODE_FORMATION := cg$CANDIDAT.cg$table(idx).CODE_FORMATION;
                cg$CANDIDAT.cg$tableind(idx).CODE_FORMATION := TRUE;
                cg$rec.ANNEE_UNIVERSITAIRE := cg$CANDIDAT.cg$table(idx).ANNEE_UNIVERSITAIRE;
                cg$CANDIDAT.cg$tableind(idx).ANNEE_UNIVERSITAIRE := TRUE;
                cg$rec.NO_CANDIDAT := cg$CANDIDAT.cg$table(idx).NO_CANDIDAT;
                cg$CANDIDAT.cg$tableind(idx).NO_CANDIDAT := TRUE;
                cg$rec.NOM := cg$CANDIDAT.cg$table(idx).NOM;
                cg$CANDIDAT.cg$tableind(idx).NOM := TRUE;
                cg$rec.PRENOM := cg$CANDIDAT.cg$table(idx).PRENOM;
                cg$CANDIDAT.cg$tableind(idx).PRENOM := TRUE;
                cg$rec.SEXE := cg$CANDIDAT.cg$table(idx).SEXE;
                cg$CANDIDAT.cg$tableind(idx).SEXE := TRUE;
                cg$rec.DATE_NAISSANCE := cg$CANDIDAT.cg$table(idx).DATE_NAISSANCE;
                cg$CANDIDAT.cg$tableind(idx).DATE_NAISSANCE := TRUE;
                cg$rec.LIEU_NAISSANCE := cg$CANDIDAT.cg$table(idx).LIEU_NAISSANCE;
                cg$CANDIDAT.cg$tableind(idx).LIEU_NAISSANCE := TRUE;
                cg$rec.NATIONALITE := cg$CANDIDAT.cg$table(idx).NATIONALITE;
                cg$CANDIDAT.cg$tableind(idx).NATIONALITE := TRUE;
                cg$rec.TELEPHONE := cg$CANDIDAT.cg$table(idx).TELEPHONE;
                cg$CANDIDAT.cg$tableind(idx).TELEPHONE := TRUE;
                cg$rec.MOBILE := cg$CANDIDAT.cg$table(idx).MOBILE;
                cg$CANDIDAT.cg$tableind(idx).MOBILE := TRUE;
                cg$rec.EMAIL := cg$CANDIDAT.cg$table(idx).EMAIL;
                cg$CANDIDAT.cg$tableind(idx).EMAIL := TRUE;
                cg$rec.ADRESSE := cg$CANDIDAT.cg$table(idx).ADRESSE;
                cg$CANDIDAT.cg$tableind(idx).ADRESSE := TRUE;
                cg$rec.CODE_POSTAL := cg$CANDIDAT.cg$table(idx).CODE_POSTAL;
                cg$CANDIDAT.cg$tableind(idx).CODE_POSTAL := TRUE;
                cg$rec.VILLE := cg$CANDIDAT.cg$table(idx).VILLE;
                cg$CANDIDAT.cg$tableind(idx).VILLE := TRUE;
                cg$rec.PAYS_ORIGINE := cg$CANDIDAT.cg$table(idx).PAYS_ORIGINE;
                cg$CANDIDAT.cg$tableind(idx).PAYS_ORIGINE := TRUE;
                cg$rec.UNIVERSITE_ORIGINE := cg$CANDIDAT.cg$table(idx).UNIVERSITE_ORIGINE;
                cg$CANDIDAT.cg$tableind(idx).UNIVERSITE_ORIGINE := TRUE;
                cg$rec.LISTE_SELECTION := cg$CANDIDAT.cg$table(idx).LISTE_SELECTION;
                cg$CANDIDAT.cg$tableind(idx).LISTE_SELECTION := TRUE;
                cg$rec.SELECTION_NO_ORDRE := cg$CANDIDAT.cg$table(idx).SELECTION_NO_ORDRE;
                cg$CANDIDAT.cg$tableind(idx).SELECTION_NO_ORDRE := TRUE;
                cg$rec.CONFIRMATION_CANDIDAT := cg$CANDIDAT.cg$table(idx).CONFIRMATION_CANDIDAT;
                cg$CANDIDAT.cg$tableind(idx).CONFIRMATION_CANDIDAT := TRUE;
                cg$rec.DATE_REPONSE_CANDIDAT := cg$CANDIDAT.cg$table(idx).DATE_REPONSE_CANDIDAT;
                cg$CANDIDAT.cg$tableind(idx).DATE_REPONSE_CANDIDAT := TRUE;

                cg$CANDIDAT.validate_foreign_keys_del(cg$rec);
                cg$CANDIDAT.upd_oper_denorm2( cg$rec,
                                                    cg$old_rec,
                                                    cg$CANDIDAT.cg$tableind(idx),
                                                    'DEL'
                                                  );
	
                cg$CANDIDAT.cascade_delete(cg$rec);
                cg$CANDIDAT.domain_cascade_delete(cg$rec);             
            END IF;
            idx := cg$CANDIDAT.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



