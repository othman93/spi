
PROMPT Creating Trigger Logic for Table 'ENSEIGNANT'
PROMPT Creating Before Insert Statement Trigger on 'ENSEIGNANT'
CREATE OR REPLACE TRIGGER cg$BIS_ENSEIGNANT
BEFORE INSERT ON ENSEIGNANT
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$ENSEIGNANT.cg$table.DELETE;
    cg$ENSEIGNANT.cg$tableind.DELETE;
    cg$ENSEIGNANT.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'ENSEIGNANT'
CREATE OR REPLACE TRIGGER cg$BIR_ENSEIGNANT 
BEFORE INSERT ON ENSEIGNANT FOR EACH ROW
DECLARE
    cg$rec cg$ENSEIGNANT.cg$row_type;
    cg$ind cg$ENSEIGNANT.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_ENSEIGNANT := :new.NO_ENSEIGNANT;
    IF (:new.NO_ENSEIGNANT IS NULL) THEN
        cg$ind.NO_ENSEIGNANT := FALSE;
    ELSE
        cg$ind.NO_ENSEIGNANT := TRUE;
    END IF;
    cg$rec.TYPE := :new.TYPE;
    cg$ind.TYPE := TRUE;
    cg$rec.SEXE := :new.SEXE;
    cg$ind.SEXE := TRUE;
    cg$rec.NOM := :new.NOM;
    IF (:new.NOM IS NULL) THEN
        cg$ind.NOM := FALSE;
    ELSE
        cg$ind.NOM := TRUE;
    END IF;
    cg$rec.PRENOM := :new.PRENOM;
    cg$ind.PRENOM := TRUE;
    cg$rec.ADRESSE := :new.ADRESSE;
    cg$ind.ADRESSE := TRUE;
    cg$rec.CODE_POSTAL := :new.CODE_POSTAL;
    cg$ind.CODE_POSTAL := TRUE;
    cg$rec.VILLE := :new.VILLE;
    cg$ind.VILLE := TRUE;
    cg$rec.PAYS := :new.PAYS;
    cg$ind.PAYS := TRUE;
    cg$rec.MOBILE := :new.MOBILE;
    cg$ind.MOBILE := TRUE;
    cg$rec.TELEPHONE := :new.TELEPHONE;
    cg$ind.TELEPHONE := TRUE;
    cg$rec.EMAIL_UBO := :new.EMAIL_UBO;
    cg$ind.EMAIL_UBO := TRUE;
    cg$rec.EMAIL_PERSO := :new.EMAIL_PERSO;
    cg$ind.EMAIL_PERSO := TRUE;

    if not (cg$ENSEIGNANT.called_from_package) then
        cg$ENSEIGNANT.validate_arc(cg$rec);
        cg$ENSEIGNANT.validate_domain(cg$rec);

        cg$ENSEIGNANT.ins(cg$rec, cg$ind, FALSE);
        cg$ENSEIGNANT.called_from_package := FALSE;
    end if;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).NO_ENSEIGNANT := cg$ind.NO_ENSEIGNANT;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).TYPE := cg$rec.TYPE;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).TYPE := cg$ind.TYPE;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).SEXE := cg$rec.SEXE;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).SEXE := cg$ind.SEXE;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).NOM := cg$rec.NOM;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).NOM := cg$ind.NOM;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).PRENOM := cg$rec.PRENOM;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).PRENOM := cg$ind.PRENOM;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).ADRESSE := cg$rec.ADRESSE;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).ADRESSE := cg$ind.ADRESSE;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).CODE_POSTAL := cg$rec.CODE_POSTAL;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).CODE_POSTAL := cg$ind.CODE_POSTAL;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).VILLE := cg$rec.VILLE;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).VILLE := cg$ind.VILLE;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).PAYS := cg$rec.PAYS;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).PAYS := cg$ind.PAYS;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).MOBILE := cg$rec.MOBILE;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).MOBILE := cg$ind.MOBILE;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).TELEPHONE := cg$rec.TELEPHONE;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).TELEPHONE := cg$ind.TELEPHONE;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).EMAIL_UBO := cg$rec.EMAIL_UBO;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).EMAIL_UBO := cg$ind.EMAIL_UBO;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).EMAIL_PERSO := cg$rec.EMAIL_PERSO;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).EMAIL_PERSO := cg$ind.EMAIL_PERSO;


    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).action_performed := 'INS';
    cg$ENSEIGNANT.idx := cg$ENSEIGNANT.idx + 1;

    :new.NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
    :new.TYPE := cg$rec.TYPE;
    :new.SEXE := cg$rec.SEXE;
    :new.NOM := cg$rec.NOM;
    :new.PRENOM := cg$rec.PRENOM;
    :new.ADRESSE := cg$rec.ADRESSE;
    :new.CODE_POSTAL := cg$rec.CODE_POSTAL;
    :new.VILLE := cg$rec.VILLE;
    :new.PAYS := cg$rec.PAYS;
    :new.MOBILE := cg$rec.MOBILE;
    :new.TELEPHONE := cg$rec.TELEPHONE;
    :new.EMAIL_UBO := cg$rec.EMAIL_UBO;
    :new.EMAIL_PERSO := cg$rec.EMAIL_PERSO;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_ENSEIGNANT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_ENSEIGNANT
AFTER INSERT ON ENSEIGNANT FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_ENSEIGNANT
/

PROMPT Creating After Insert Statement Trigger on 'ENSEIGNANT'
CREATE OR REPLACE TRIGGER cg$AIS_ENSEIGNANT 
AFTER INSERT ON ENSEIGNANT
DECLARE
    idx      BINARY_INTEGER := cg$ENSEIGNANT.cg$table.FIRST;
    cg$rec   cg$ENSEIGNANT.cg$row_type;
    cg$old_rec   cg$ENSEIGNANT.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$ENSEIGNANT.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP

	    IF (cg$ENSEIGNANT.cg$table(idx).action_performed = 'INS') THEN
                cg$rec.NO_ENSEIGNANT := cg$ENSEIGNANT.cg$table(idx).NO_ENSEIGNANT;
                cg$rec.TYPE := cg$ENSEIGNANT.cg$table(idx).TYPE;
                cg$rec.SEXE := cg$ENSEIGNANT.cg$table(idx).SEXE;
                cg$rec.NOM := cg$ENSEIGNANT.cg$table(idx).NOM;
                cg$rec.PRENOM := cg$ENSEIGNANT.cg$table(idx).PRENOM;
                cg$rec.ADRESSE := cg$ENSEIGNANT.cg$table(idx).ADRESSE;
                cg$rec.CODE_POSTAL := cg$ENSEIGNANT.cg$table(idx).CODE_POSTAL;
                cg$rec.VILLE := cg$ENSEIGNANT.cg$table(idx).VILLE;
                cg$rec.PAYS := cg$ENSEIGNANT.cg$table(idx).PAYS;
                cg$rec.MOBILE := cg$ENSEIGNANT.cg$table(idx).MOBILE;
                cg$rec.TELEPHONE := cg$ENSEIGNANT.cg$table(idx).TELEPHONE;
                cg$rec.EMAIL_UBO := cg$ENSEIGNANT.cg$table(idx).EMAIL_UBO;
                cg$rec.EMAIL_PERSO := cg$ENSEIGNANT.cg$table(idx).EMAIL_PERSO;

                cg$ENSEIGNANT.validate_foreign_keys_ins(cg$rec);

                cg$ENSEIGNANT.upd_oper_denorm2( cg$rec,
                                                    cg$old_rec,
                                                    cg$ENSEIGNANT.cg$tableind(idx),
                                                    'INS'
                                                  );
            END IF;
            idx := cg$ENSEIGNANT.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'ENSEIGNANT'
CREATE OR REPLACE TRIGGER cg$BUS_ENSEIGNANT
BEFORE UPDATE ON ENSEIGNANT
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$ENSEIGNANT.cg$table.DELETE;
    cg$ENSEIGNANT.cg$tableind.DELETE;
    cg$ENSEIGNANT.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'ENSEIGNANT'
CREATE OR REPLACE TRIGGER cg$BUR_ENSEIGNANT 
BEFORE UPDATE ON ENSEIGNANT FOR EACH ROW
DECLARE
    cg$rec     cg$ENSEIGNANT.cg$row_type;
    cg$ind     cg$ENSEIGNANT.cg$ind_type;
    cg$old_rec cg$ENSEIGNANT.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_ENSEIGNANT := :new.NO_ENSEIGNANT;
    cg$ind.NO_ENSEIGNANT :=    (:new.NO_ENSEIGNANT IS NULL AND :old.NO_ENSEIGNANT IS NOT NULL )
                        OR (:new.NO_ENSEIGNANT IS NOT NULL AND :old.NO_ENSEIGNANT IS NULL)
                        OR NOT(:new.NO_ENSEIGNANT = :old.NO_ENSEIGNANT) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).NO_ENSEIGNANT := :old.NO_ENSEIGNANT;
    cg$rec.TYPE := :new.TYPE;
    cg$ind.TYPE :=    (:new.TYPE IS NULL AND :old.TYPE IS NOT NULL )
                        OR (:new.TYPE IS NOT NULL AND :old.TYPE IS NULL)
                        OR NOT(:new.TYPE = :old.TYPE) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).TYPE := :old.TYPE;
    cg$rec.SEXE := :new.SEXE;
    cg$ind.SEXE :=    (:new.SEXE IS NULL AND :old.SEXE IS NOT NULL )
                        OR (:new.SEXE IS NOT NULL AND :old.SEXE IS NULL)
                        OR NOT(:new.SEXE = :old.SEXE) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).SEXE := :old.SEXE;
    cg$rec.NOM := :new.NOM;
    cg$ind.NOM :=    (:new.NOM IS NULL AND :old.NOM IS NOT NULL )
                        OR (:new.NOM IS NOT NULL AND :old.NOM IS NULL)
                        OR NOT(:new.NOM = :old.NOM) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).NOM := :old.NOM;
    cg$rec.PRENOM := :new.PRENOM;
    cg$ind.PRENOM :=    (:new.PRENOM IS NULL AND :old.PRENOM IS NOT NULL )
                        OR (:new.PRENOM IS NOT NULL AND :old.PRENOM IS NULL)
                        OR NOT(:new.PRENOM = :old.PRENOM) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).PRENOM := :old.PRENOM;
    cg$rec.ADRESSE := :new.ADRESSE;
    cg$ind.ADRESSE :=    (:new.ADRESSE IS NULL AND :old.ADRESSE IS NOT NULL )
                        OR (:new.ADRESSE IS NOT NULL AND :old.ADRESSE IS NULL)
                        OR NOT(:new.ADRESSE = :old.ADRESSE) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).ADRESSE := :old.ADRESSE;
    cg$rec.CODE_POSTAL := :new.CODE_POSTAL;
    cg$ind.CODE_POSTAL :=    (:new.CODE_POSTAL IS NULL AND :old.CODE_POSTAL IS NOT NULL )
                        OR (:new.CODE_POSTAL IS NOT NULL AND :old.CODE_POSTAL IS NULL)
                        OR NOT(:new.CODE_POSTAL = :old.CODE_POSTAL) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).CODE_POSTAL := :old.CODE_POSTAL;
    cg$rec.VILLE := :new.VILLE;
    cg$ind.VILLE :=    (:new.VILLE IS NULL AND :old.VILLE IS NOT NULL )
                        OR (:new.VILLE IS NOT NULL AND :old.VILLE IS NULL)
                        OR NOT(:new.VILLE = :old.VILLE) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).VILLE := :old.VILLE;
    cg$rec.PAYS := :new.PAYS;
    cg$ind.PAYS :=    (:new.PAYS IS NULL AND :old.PAYS IS NOT NULL )
                        OR (:new.PAYS IS NOT NULL AND :old.PAYS IS NULL)
                        OR NOT(:new.PAYS = :old.PAYS) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).PAYS := :old.PAYS;
    cg$rec.MOBILE := :new.MOBILE;
    cg$ind.MOBILE :=    (:new.MOBILE IS NULL AND :old.MOBILE IS NOT NULL )
                        OR (:new.MOBILE IS NOT NULL AND :old.MOBILE IS NULL)
                        OR NOT(:new.MOBILE = :old.MOBILE) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).MOBILE := :old.MOBILE;
    cg$rec.TELEPHONE := :new.TELEPHONE;
    cg$ind.TELEPHONE :=    (:new.TELEPHONE IS NULL AND :old.TELEPHONE IS NOT NULL )
                        OR (:new.TELEPHONE IS NOT NULL AND :old.TELEPHONE IS NULL)
                        OR NOT(:new.TELEPHONE = :old.TELEPHONE) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).TELEPHONE := :old.TELEPHONE;
    cg$rec.EMAIL_UBO := :new.EMAIL_UBO;
    cg$ind.EMAIL_UBO :=    (:new.EMAIL_UBO IS NULL AND :old.EMAIL_UBO IS NOT NULL )
                        OR (:new.EMAIL_UBO IS NOT NULL AND :old.EMAIL_UBO IS NULL)
                        OR NOT(:new.EMAIL_UBO = :old.EMAIL_UBO) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).EMAIL_UBO := :old.EMAIL_UBO;
    cg$rec.EMAIL_PERSO := :new.EMAIL_PERSO;
    cg$ind.EMAIL_PERSO :=    (:new.EMAIL_PERSO IS NULL AND :old.EMAIL_PERSO IS NOT NULL )
                        OR (:new.EMAIL_PERSO IS NOT NULL AND :old.EMAIL_PERSO IS NULL)
                        OR NOT(:new.EMAIL_PERSO = :old.EMAIL_PERSO) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).EMAIL_PERSO := :old.EMAIL_PERSO;


    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).action_performed := 'UPD';     -- nkovoor
    cg$ENSEIGNANT.idx := cg$ENSEIGNANT.idx + 1;

    if not (cg$ENSEIGNANT.called_from_package) then
        cg$ENSEIGNANT.validate_arc(cg$rec);
        cg$ENSEIGNANT.validate_domain(cg$rec, cg$ind);
        cg$ENSEIGNANT.validate_domain_cascade_update(cg$old_rec);   

        cg$ENSEIGNANT.upd(cg$rec, cg$ind, FALSE);
        cg$ENSEIGNANT.called_from_package := FALSE;
    end if;

    :new.TYPE := cg$rec.TYPE;
    :new.SEXE := cg$rec.SEXE;
    :new.NOM := cg$rec.NOM;
    :new.PRENOM := cg$rec.PRENOM;
    :new.ADRESSE := cg$rec.ADRESSE;
    :new.CODE_POSTAL := cg$rec.CODE_POSTAL;
    :new.VILLE := cg$rec.VILLE;
    :new.PAYS := cg$rec.PAYS;
    :new.MOBILE := cg$rec.MOBILE;
    :new.TELEPHONE := cg$rec.TELEPHONE;
    :new.EMAIL_UBO := cg$rec.EMAIL_UBO;
    :new.EMAIL_PERSO := cg$rec.EMAIL_PERSO;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_ENSEIGNANT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_ENSEIGNANT
AFTER UPDATE ON ENSEIGNANT FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_ENSEIGNANT
/






PROMPT Creating After Update Statement Trigger on 'ENSEIGNANT'
CREATE OR REPLACE TRIGGER cg$AUS_ENSEIGNANT 
AFTER UPDATE ON ENSEIGNANT
DECLARE
    idx        BINARY_INTEGER := cg$ENSEIGNANT.cg$table.FIRST;
    cg$old_rec cg$ENSEIGNANT.cg$row_type;
    cg$rec     cg$ENSEIGNANT.cg$row_type;
    cg$ind     cg$ENSEIGNANT.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP

        IF (cg$ENSEIGNANT.cg$table(idx).action_performed = 'UPD') THEN
            cg$old_rec.NO_ENSEIGNANT := cg$ENSEIGNANT.cg$table(idx).NO_ENSEIGNANT;
            cg$old_rec.TYPE := cg$ENSEIGNANT.cg$table(idx).TYPE;
            cg$old_rec.SEXE := cg$ENSEIGNANT.cg$table(idx).SEXE;
            cg$old_rec.NOM := cg$ENSEIGNANT.cg$table(idx).NOM;
            cg$old_rec.PRENOM := cg$ENSEIGNANT.cg$table(idx).PRENOM;
            cg$old_rec.ADRESSE := cg$ENSEIGNANT.cg$table(idx).ADRESSE;
            cg$old_rec.CODE_POSTAL := cg$ENSEIGNANT.cg$table(idx).CODE_POSTAL;
            cg$old_rec.VILLE := cg$ENSEIGNANT.cg$table(idx).VILLE;
            cg$old_rec.PAYS := cg$ENSEIGNANT.cg$table(idx).PAYS;
            cg$old_rec.MOBILE := cg$ENSEIGNANT.cg$table(idx).MOBILE;
            cg$old_rec.TELEPHONE := cg$ENSEIGNANT.cg$table(idx).TELEPHONE;
            cg$old_rec.EMAIL_UBO := cg$ENSEIGNANT.cg$table(idx).EMAIL_UBO;
            cg$old_rec.EMAIL_PERSO := cg$ENSEIGNANT.cg$table(idx).EMAIL_PERSO;

            IF NOT (cg$ENSEIGNANT.called_from_package) THEN
                idx := cg$ENSEIGNANT.cg$table.NEXT(idx);

                IF (idx IS NOT NULL) THEN
                cg$rec.NO_ENSEIGNANT := cg$ENSEIGNANT.cg$table(idx).NO_ENSEIGNANT;
                cg$ind.NO_ENSEIGNANT := updating('NO_ENSEIGNANT');
                cg$rec.TYPE := cg$ENSEIGNANT.cg$table(idx).TYPE;
                cg$ind.TYPE := updating('TYPE');
                cg$rec.SEXE := cg$ENSEIGNANT.cg$table(idx).SEXE;
                cg$ind.SEXE := updating('SEXE');
                cg$rec.NOM := cg$ENSEIGNANT.cg$table(idx).NOM;
                cg$ind.NOM := updating('NOM');
                cg$rec.PRENOM := cg$ENSEIGNANT.cg$table(idx).PRENOM;
                cg$ind.PRENOM := updating('PRENOM');
                cg$rec.ADRESSE := cg$ENSEIGNANT.cg$table(idx).ADRESSE;
                cg$ind.ADRESSE := updating('ADRESSE');
                cg$rec.CODE_POSTAL := cg$ENSEIGNANT.cg$table(idx).CODE_POSTAL;
                cg$ind.CODE_POSTAL := updating('CODE_POSTAL');
                cg$rec.VILLE := cg$ENSEIGNANT.cg$table(idx).VILLE;
                cg$ind.VILLE := updating('VILLE');
                cg$rec.PAYS := cg$ENSEIGNANT.cg$table(idx).PAYS;
                cg$ind.PAYS := updating('PAYS');
                cg$rec.MOBILE := cg$ENSEIGNANT.cg$table(idx).MOBILE;
                cg$ind.MOBILE := updating('MOBILE');
                cg$rec.TELEPHONE := cg$ENSEIGNANT.cg$table(idx).TELEPHONE;
                cg$ind.TELEPHONE := updating('TELEPHONE');
                cg$rec.EMAIL_UBO := cg$ENSEIGNANT.cg$table(idx).EMAIL_UBO;
                cg$ind.EMAIL_UBO := updating('EMAIL_UBO');
                cg$rec.EMAIL_PERSO := cg$ENSEIGNANT.cg$table(idx).EMAIL_PERSO;
                cg$ind.EMAIL_PERSO := updating('EMAIL_PERSO');

                cg$ENSEIGNANT.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

                cg$ENSEIGNANT.upd_denorm2( cg$rec,
                                               cg$ENSEIGNANT.cg$tableind(idx)
                                             );
                cg$ENSEIGNANT.upd_oper_denorm2( cg$rec,
                                                    cg$old_rec,
                                                    cg$ENSEIGNANT.cg$tableind(idx)
				        				                  );
                cg$ENSEIGNANT.cascade_update(cg$rec, cg$old_rec);
                cg$ENSEIGNANT.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             
        
                cg$ENSEIGNANT.called_from_package := FALSE;
                END IF;
            END IF; 
        END IF;
        idx := cg$ENSEIGNANT.cg$table.NEXT(idx);
    END LOOP;

    cg$ENSEIGNANT.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'ENSEIGNANT'
CREATE OR REPLACE TRIGGER cg$BDS_ENSEIGNANT
BEFORE DELETE ON ENSEIGNANT
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$ENSEIGNANT.cg$table.DELETE;
    cg$ENSEIGNANT.cg$tableind.DELETE;
    cg$ENSEIGNANT.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'ENSEIGNANT'
CREATE OR REPLACE TRIGGER cg$BDR_ENSEIGNANT 
BEFORE DELETE ON ENSEIGNANT FOR EACH ROW
DECLARE
    cg$pk cg$ENSEIGNANT.cg$pk_type;
    cg$rec cg$ENSEIGNANT.cg$row_type;
    cg$ind cg$ENSEIGNANT.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.NO_ENSEIGNANT  := :old.NO_ENSEIGNANT;
    cg$rec.NO_ENSEIGNANT := :old.NO_ENSEIGNANT;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).NO_ENSEIGNANT := :old.NO_ENSEIGNANT;


    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).action_performed := 'DEL';
    cg$ENSEIGNANT.idx := cg$ENSEIGNANT.idx + 1;

    if not (cg$ENSEIGNANT.called_from_package) then
        cg$ENSEIGNANT.validate_domain_cascade_delete(cg$rec);   
        cg$ENSEIGNANT.del(cg$pk, FALSE);
        cg$ENSEIGNANT.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_ENSEIGNANT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_ENSEIGNANT
AFTER DELETE ON ENSEIGNANT FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_ENSEIGNANT
/

PROMPT Creating After Delete Statement Trigger on 'ENSEIGNANT'
CREATE OR REPLACE TRIGGER cg$ADS_ENSEIGNANT 
AFTER DELETE ON ENSEIGNANT
DECLARE
    idx        BINARY_INTEGER := cg$ENSEIGNANT.cg$table.FIRST;
    cg$rec   cg$ENSEIGNANT.cg$row_type;
    cg$old_rec   cg$ENSEIGNANT.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$ENSEIGNANT.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP

            IF (cg$ENSEIGNANT.cg$table(idx).action_performed = 'DEL') THEN
                cg$rec.NO_ENSEIGNANT := cg$ENSEIGNANT.cg$table(idx).NO_ENSEIGNANT;
                cg$ENSEIGNANT.cg$tableind(idx).NO_ENSEIGNANT := TRUE;
                cg$rec.TYPE := cg$ENSEIGNANT.cg$table(idx).TYPE;
                cg$ENSEIGNANT.cg$tableind(idx).TYPE := TRUE;
                cg$rec.SEXE := cg$ENSEIGNANT.cg$table(idx).SEXE;
                cg$ENSEIGNANT.cg$tableind(idx).SEXE := TRUE;
                cg$rec.NOM := cg$ENSEIGNANT.cg$table(idx).NOM;
                cg$ENSEIGNANT.cg$tableind(idx).NOM := TRUE;
                cg$rec.PRENOM := cg$ENSEIGNANT.cg$table(idx).PRENOM;
                cg$ENSEIGNANT.cg$tableind(idx).PRENOM := TRUE;
                cg$rec.ADRESSE := cg$ENSEIGNANT.cg$table(idx).ADRESSE;
                cg$ENSEIGNANT.cg$tableind(idx).ADRESSE := TRUE;
                cg$rec.CODE_POSTAL := cg$ENSEIGNANT.cg$table(idx).CODE_POSTAL;
                cg$ENSEIGNANT.cg$tableind(idx).CODE_POSTAL := TRUE;
                cg$rec.VILLE := cg$ENSEIGNANT.cg$table(idx).VILLE;
                cg$ENSEIGNANT.cg$tableind(idx).VILLE := TRUE;
                cg$rec.PAYS := cg$ENSEIGNANT.cg$table(idx).PAYS;
                cg$ENSEIGNANT.cg$tableind(idx).PAYS := TRUE;
                cg$rec.MOBILE := cg$ENSEIGNANT.cg$table(idx).MOBILE;
                cg$ENSEIGNANT.cg$tableind(idx).MOBILE := TRUE;
                cg$rec.TELEPHONE := cg$ENSEIGNANT.cg$table(idx).TELEPHONE;
                cg$ENSEIGNANT.cg$tableind(idx).TELEPHONE := TRUE;
                cg$rec.EMAIL_UBO := cg$ENSEIGNANT.cg$table(idx).EMAIL_UBO;
                cg$ENSEIGNANT.cg$tableind(idx).EMAIL_UBO := TRUE;
                cg$rec.EMAIL_PERSO := cg$ENSEIGNANT.cg$table(idx).EMAIL_PERSO;
                cg$ENSEIGNANT.cg$tableind(idx).EMAIL_PERSO := TRUE;

                cg$ENSEIGNANT.validate_foreign_keys_del(cg$rec);
                cg$ENSEIGNANT.upd_oper_denorm2( cg$rec,
                                                    cg$old_rec,
                                                    cg$ENSEIGNANT.cg$tableind(idx),
                                                    'DEL'
                                                  );
	
                cg$ENSEIGNANT.cascade_delete(cg$rec);
                cg$ENSEIGNANT.domain_cascade_delete(cg$rec);             
            END IF;
            idx := cg$ENSEIGNANT.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



