
PROMPT Creating API Package Body for Table 'CANDIDAT'
--------------------------------------------------------------------------------
-- Name:        cg$CANDIDAT
-- Description: CANDIDAT table API package definitions
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY cg$CANDIDAT IS

PROCEDURE   validate_mandatory(cg$val_rec IN cg$row_type,
                               loc        IN VARCHAR2 DEFAULT '');
PROCEDURE   up_autogen_columns(cg$rec    IN OUT cg$row_type,
                               cg$ind    IN OUT cg$ind_type,
                               operation IN VARCHAR2 DEFAULT 'INS',
                               do_denorm IN BOOLEAN DEFAULT TRUE);
PROCEDURE   err_msg(msg  IN VARCHAR2,
                    type IN INTEGER,
                    loc  IN VARCHAR2 DEFAULT '');

--------------------------------------------------------------------------------
-- Name:        raise_uk_not_updateable
--
-- Description: Raise appropriate error when unique key updated
--
-- Parameters:  none
--------------------------------------------------------------------------------
PROCEDURE raise_uk_not_updateable(uk IN VARCHAR2) IS   
BEGIN
    cg$errors.push(cg$errors.MsgGetText(cg$errors.API_UNIQUE_KEY_UPDATE, cg$errors.ERR_UK_UPDATE, uk),
                   'E',
                   'API',
                   cg$errors.API_UNIQUE_KEY_UPDATE,
                   'cg$CANDIDAT.raise_uk_not_updateable');
                   cg$errors.raise_failure;
END raise_uk_not_updateable;


--------------------------------------------------------------------------------
-- Name:        raise_fk_not_transferable
--
-- Description: Raise appropriate error when foreign key updated
--
-- Parameters:  none
--------------------------------------------------------------------------------
PROCEDURE raise_fk_not_transferable(fk IN VARCHAR2) IS 
BEGIN
    cg$errors.push(cg$errors.MsgGetText(cg$errors.API_FOREIGN_KEY_TRANS, cg$errors.ERR_FK_TRANS, fk),
                   'E',
                   'API',
                   cg$errors.API_FOREIGN_KEY_TRANS,
                   'cg$CANDIDAT.raise_fk_not_transferable');
    cg$errors.raise_failure;
END raise_fk_not_transferable;


--------------------------------------------------------------------------------
-- Name:        up_autogen_columns
--
-- Description: Specific autogeneration of column values and conversion to 
--              uppercase
--
-- Parameters:  cg$rec    Record of row to be manipulated
--              cg$ind    Indicators for row
--              operation Procedure where this procedure was called
--------------------------------------------------------------------------------
PROCEDURE up_autogen_columns(cg$rec IN OUT cg$row_type,
                             cg$ind IN OUT cg$ind_type,
                             operation IN VARCHAR2 DEFAULT 'INS',
                             do_denorm IN BOOLEAN DEFAULT TRUE) IS
BEGIN
  IF (operation = 'INS') THEN
    BEGIN  -- Server Derived Sequence in Parent
        SELECT NVL(MAX(NO_CANDIDAT), 0) + 1
        INTO   cg$rec.NO_CANDIDAT
        FROM   CANDIDAT
        WHERE
         (    cg$rec.CODE_FORMATION = CODE_FORMATION
         AND  cg$rec.ANNEE_UNIVERSITAIRE = ANNEE_UNIVERSITAIRE )  -- Primary Key columns 

        ;
    EXCEPTION WHEN others THEN
      cg$errors.push(SQLERRM, 'E', 'ORA', SQLCODE,
                     'cg$CANDIDAT.up_autogen_seq_in_parent.NO_CANDIDAT.OTHERS');
      cg$errors.raise_failure;
    END;
    NULL;
  ELSE      -- (operation = 'UPD')
    NULL;
  END IF;   -- (operation = 'INS') ELSE (operation = 'UPD')

  -- Statements executed for both 'INS' and 'UPD'

  cg$rec.NOM := upper(cg$rec.NOM);

EXCEPTION
  WHEN no_data_found THEN
    NULL;
  WHEN others THEN
    cg$errors.push( SQLERRM, 'E', 'ORA', SQLCODE, 
                    'cg$CANDIDAT.up_autogen_columns');
    cg$errors.raise_failure;
END up_autogen_columns;


--------------------------------------------------------------------------------
-- Name:        validate_mandatory
--
-- Description: Checks all mandatory columns are not null and raises appropriate
--              error if not satisfied
--
-- Parameters:  cg$val_rec Record of row to be checked
--              loc        Place where this procedure was called for error 
--                         trapping
--------------------------------------------------------------------------------
PROCEDURE validate_mandatory(cg$val_rec IN cg$row_type,
                             loc        IN VARCHAR2 DEFAULT '') IS
BEGIN
    IF (cg$val_rec.CODE_FORMATION IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P15CODE_FORMATION),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.ANNEE_UNIVERSITAIRE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P20ANNEE_UNIVERSITAIRE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NO_CANDIDAT IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P30NO_CANDIDAT),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NOM IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P40NOM),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.PRENOM IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P50PRENOM),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.SEXE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P55SEXE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.DATE_NAISSANCE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P60DATE_NAISSANCE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.LIEU_NAISSANCE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P70LIEU_NAISSANCE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NATIONALITE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P90NATIONALITE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.EMAIL IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P120EMAIL),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.ADRESSE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P170ADRESSE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.VILLE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P190VILLE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.PAYS_ORIGINE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P200PAYS_ORIGINE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.UNIVERSITE_ORIGINE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P225UNIVERSITE_ORIGINE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    NULL;
END validate_mandatory;


--------------------------------------------------------------------------------
-- Name:        validate_foreign_keys
--
-- Description: Checks all mandatory columns are not null and raises appropriate
--              error if not satisfied
--
-- Parameters:  cg$rec Record of row to be checked
--------------------------------------------------------------------------------
PROCEDURE validate_foreign_keys_ins(cg$rec IN cg$row_type) IS
    fk_check INTEGER;
BEGIN
NULL;
END;

PROCEDURE validate_foreign_keys_upd( cg$rec IN cg$row_type, 
                                     cg$old_rec IN cg$row_type, 
                                     cg$ind IN cg$ind_type) IS
    fk_check INTEGER;
BEGIN
NULL;
END;

PROCEDURE validate_foreign_keys_del(cg$rec IN cg$row_type) IS
    fk_check INTEGER;
BEGIN
NULL;
END;


--------------------------------------------------------------------------------
-- Name:        slct
--
-- Description: Selects into the given parameter all the attributes for the row
--              given by the primary key
--
-- Parameters:  cg$sel_rec  Record of row to be selected into using its PK
--------------------------------------------------------------------------------
PROCEDURE slct(cg$sel_rec IN OUT cg$row_type) IS

BEGIN

    IF cg$sel_rec.the_rowid is null THEN
       SELECT    CODE_FORMATION
       ,         ANNEE_UNIVERSITAIRE
       ,         NO_CANDIDAT
       ,         NOM
       ,         PRENOM
       ,         SEXE
       ,         DATE_NAISSANCE
       ,         LIEU_NAISSANCE
       ,         NATIONALITE
       ,         TELEPHONE
       ,         MOBILE
       ,         EMAIL
       ,         ADRESSE
       ,         CODE_POSTAL
       ,         VILLE
       ,         PAYS_ORIGINE
       ,         UNIVERSITE_ORIGINE
       ,         LISTE_SELECTION
       ,         SELECTION_NO_ORDRE
       ,         CONFIRMATION_CANDIDAT
       ,         DATE_REPONSE_CANDIDAT
       , rowid
       INTO      cg$sel_rec.CODE_FORMATION
       ,         cg$sel_rec.ANNEE_UNIVERSITAIRE
       ,         cg$sel_rec.NO_CANDIDAT
       ,         cg$sel_rec.NOM
       ,         cg$sel_rec.PRENOM
       ,         cg$sel_rec.SEXE
       ,         cg$sel_rec.DATE_NAISSANCE
       ,         cg$sel_rec.LIEU_NAISSANCE
       ,         cg$sel_rec.NATIONALITE
       ,         cg$sel_rec.TELEPHONE
       ,         cg$sel_rec.MOBILE
       ,         cg$sel_rec.EMAIL
       ,         cg$sel_rec.ADRESSE
       ,         cg$sel_rec.CODE_POSTAL
       ,         cg$sel_rec.VILLE
       ,         cg$sel_rec.PAYS_ORIGINE
       ,         cg$sel_rec.UNIVERSITE_ORIGINE
       ,         cg$sel_rec.LISTE_SELECTION
       ,         cg$sel_rec.SELECTION_NO_ORDRE
       ,         cg$sel_rec.CONFIRMATION_CANDIDAT
       ,         cg$sel_rec.DATE_REPONSE_CANDIDAT
       ,cg$sel_rec.the_rowid
       FROM   CANDIDAT
       WHERE        CODE_FORMATION = cg$sel_rec.CODE_FORMATION
       AND       ANNEE_UNIVERSITAIRE = cg$sel_rec.ANNEE_UNIVERSITAIRE
       AND       NO_CANDIDAT = cg$sel_rec.NO_CANDIDAT;
    ELSE
       SELECT    CODE_FORMATION
       ,         ANNEE_UNIVERSITAIRE
       ,         NO_CANDIDAT
       ,         NOM
       ,         PRENOM
       ,         SEXE
       ,         DATE_NAISSANCE
       ,         LIEU_NAISSANCE
       ,         NATIONALITE
       ,         TELEPHONE
       ,         MOBILE
       ,         EMAIL
       ,         ADRESSE
       ,         CODE_POSTAL
       ,         VILLE
       ,         PAYS_ORIGINE
       ,         UNIVERSITE_ORIGINE
       ,         LISTE_SELECTION
       ,         SELECTION_NO_ORDRE
       ,         CONFIRMATION_CANDIDAT
       ,         DATE_REPONSE_CANDIDAT
       , rowid
       INTO      cg$sel_rec.CODE_FORMATION
       ,         cg$sel_rec.ANNEE_UNIVERSITAIRE
       ,         cg$sel_rec.NO_CANDIDAT
       ,         cg$sel_rec.NOM
       ,         cg$sel_rec.PRENOM
       ,         cg$sel_rec.SEXE
       ,         cg$sel_rec.DATE_NAISSANCE
       ,         cg$sel_rec.LIEU_NAISSANCE
       ,         cg$sel_rec.NATIONALITE
       ,         cg$sel_rec.TELEPHONE
       ,         cg$sel_rec.MOBILE
       ,         cg$sel_rec.EMAIL
       ,         cg$sel_rec.ADRESSE
       ,         cg$sel_rec.CODE_POSTAL
       ,         cg$sel_rec.VILLE
       ,         cg$sel_rec.PAYS_ORIGINE
       ,         cg$sel_rec.UNIVERSITE_ORIGINE
       ,         cg$sel_rec.LISTE_SELECTION
       ,         cg$sel_rec.SELECTION_NO_ORDRE
       ,         cg$sel_rec.CONFIRMATION_CANDIDAT
       ,         cg$sel_rec.DATE_REPONSE_CANDIDAT
       ,cg$sel_rec.the_rowid
       FROM   CANDIDAT
       WHERE  rowid = cg$sel_rec.the_rowid;
    END IF;

EXCEPTION WHEN OTHERS THEN
    cg$errors.push(SQLERRM,
                   'E',
                   'ORA',
                   SQLCODE,
                   'cg$CANDIDAT.slct.others');
    cg$errors.raise_failure;

END slct;


--------------------------------------------------------------------------------
-- Name:        cascade_update
--
-- Description: Updates all child tables affected by a change to CANDIDAT 
--
-- Parameters:  cg$rec     Record of CANDIDAT current values
--              cg$old_rec Record of CANDIDAT previous values
--------------------------------------------------------------------------------
PROCEDURE cascade_update(cg$new_rec IN OUT cg$row_type,
                         cg$old_rec IN     cg$row_type) IS
BEGIN
  NULL;
END cascade_update;


--------------------------------------------------------------------------------
-- Name:        validate_domain_cascade_update
--
-- Description: Implement the Domain Key Constraint Cascade Updates Resticts rule
--              of each child table that references this tableCANDIDAT 
--
-- Parameters:  cg$old_rec     Record of CANDIDAT current values
--------------------------------------------------------------------------------
PROCEDURE validate_domain_cascade_update( cg$old_rec IN cg$row_type ) IS
  dk_check INTEGER;
BEGIN
  NULL;
END validate_domain_cascade_update;


-----------------------------------------------------------------------------------------
-- Name:        domain_cascade_update
--
-- Description: Implement the Domain Key Constraint Cascade Updates rules of each
--              child table that references this table CANDIDAT 
--
-- Parameters:  cg$new_rec  New values for CANDIDAT's domain key constraint columns 
--              cg$new_ind  Indicates changed CANDIDAT's domain key constraint columns
--              cg$old_rec  Current values for CANDIDAT's domain key constraint columns
-----------------------------------------------------------------------------------------
PROCEDURE domain_cascade_update(cg$new_rec IN OUT cg$row_type,
                                cg$new_ind IN OUT cg$ind_type,
                                cg$old_rec IN     cg$row_type) IS
BEGIN
  NULL;
END domain_cascade_update;


--------------------------------------------------------------------------------
-- Name:        cascade_delete
--
-- Description: Delete all child tables affected by a delete to CANDIDAT 
--
-- Parameters:  cg$rec     Record of CANDIDAT current values
--------------------------------------------------------------------------------
PROCEDURE cascade_delete(cg$old_rec IN OUT cg$row_type)
IS
BEGIN
  NULL;
END cascade_delete;

--------------------------------------------------------------------------------
-- Name:        domain_cascade_delete
--
-- Description: Implement the Domain Key Constraint Cascade Delete rules of each
--              child table that references this tableCANDIDAT 
--
-- Parameters:  cg$old_rec     Record of CANDIDAT current values
--------------------------------------------------------------------------------
PROCEDURE domain_cascade_delete( cg$old_rec IN cg$row_type )
IS
BEGIN
  NULL;
END domain_cascade_delete;


--------------------------------------------------------------------------------
-- Name:        validate_domain_cascade_delete
--
-- Description: Implement the Domain Key Constraint Cascade Delete Restricts rule
--              of each child table that references this tableCANDIDAT 
--
-- Parameters:  cg$old_rec     Record of CANDIDAT current values
--------------------------------------------------------------------------------
PROCEDURE validate_domain_cascade_delete(cg$old_rec IN cg$row_type)
IS
    dk_check INTEGER;
BEGIN
  NULL;
END validate_domain_cascade_delete;



--------------------------------------------------------------------------------
-- Name:        validate_arc
--
-- Description: Checks for adherence to arc relationship 
--
-- Parameters:  cg$rec     Record of CANDIDAT current values
--------------------------------------------------------------------------------
PROCEDURE validate_arc(cg$rec IN OUT cg$row_type) IS
i NUMBER;
BEGIN
    NULL;
END validate_arc;


--------------------------------------------------------------------------------
-- Name:        validate_domain
--
-- Description: Checks against reference table for values lying in a domain 
--
-- Parameters:  cg$rec     Record of CANDIDAT current values
--------------------------------------------------------------------------------
PROCEDURE validate_domain(cg$rec IN OUT cg$row_type,
                          cg$ind IN cg$ind_type DEFAULT cg$ind_true)
IS
  dummy NUMBER;
  found BOOLEAN;
  no_tabview EXCEPTION;
  PRAGMA EXCEPTION_INIT(no_tabview, -942); 
BEGIN






    found := false;
    IF (cg$ind.SEXE AND cg$rec.SEXE IS NOT NULL) THEN
      FOR c IN (SELECT RV_LOW_VALUE, RV_HIGH_VALUE FROM CG_REF_CODES WHERE RV_DOMAIN = 'SEXE' )
      LOOP
         IF (    c.RV_HIGH_VALUE IS NULL 
             AND cg$rec.SEXE = c.RV_LOW_VALUE )
         OR (    c.RV_HIGH_VALUE IS NOT NULL
             AND cg$rec.SEXE BETWEEN c.RV_LOW_VALUE AND c.RV_HIGH_VALUE )
         THEN
           found := true;
           EXIT;
         END IF;
      END LOOP;

      IF ( NOT found ) THEN
        cg$errors.push( cg$errors.MsgGetText(cg$errors.API_RV_LOOKUP_FAIL,
                                             cg$errors.APIMSG_RV_LOOKUP_FAIL,
                                             cg$rec.SEXE,'CANDIDAT','SEXE'),
                        'E',
                        'API',
                        cg$errors.API_RV_LOOKUP_FAIL,
                        'cg$CANDIDAT.v_domain.no_data_found' );
        cg$errors.raise_failure;
      END IF;
    END IF;










    found := false;
    IF (cg$ind.PAYS_ORIGINE AND cg$rec.PAYS_ORIGINE IS NOT NULL) THEN
      FOR c IN (SELECT RV_LOW_VALUE, RV_HIGH_VALUE FROM CG_REF_CODES WHERE RV_DOMAIN = 'PAYS' )
      LOOP
         IF (    c.RV_HIGH_VALUE IS NULL 
             AND cg$rec.PAYS_ORIGINE = c.RV_LOW_VALUE )
         OR (    c.RV_HIGH_VALUE IS NOT NULL
             AND cg$rec.PAYS_ORIGINE BETWEEN c.RV_LOW_VALUE AND c.RV_HIGH_VALUE )
         THEN
           found := true;
           EXIT;
         END IF;
      END LOOP;

      IF ( NOT found ) THEN
        cg$errors.push( cg$errors.MsgGetText(cg$errors.API_RV_LOOKUP_FAIL,
                                             cg$errors.APIMSG_RV_LOOKUP_FAIL,
                                             cg$rec.PAYS_ORIGINE,'CANDIDAT','PAYS_ORIGINE'),
                        'E',
                        'API',
                        cg$errors.API_RV_LOOKUP_FAIL,
                        'cg$CANDIDAT.v_domain.no_data_found' );
        cg$errors.raise_failure;
      END IF;
    END IF;

    found := false;
    IF (cg$ind.UNIVERSITE_ORIGINE AND cg$rec.UNIVERSITE_ORIGINE IS NOT NULL) THEN
      FOR c IN (SELECT RV_LOW_VALUE, RV_HIGH_VALUE FROM CG_REF_CODES WHERE RV_DOMAIN = 'UNIVERSITE' )
      LOOP
         IF (    c.RV_HIGH_VALUE IS NULL 
             AND cg$rec.UNIVERSITE_ORIGINE = c.RV_LOW_VALUE )
         OR (    c.RV_HIGH_VALUE IS NOT NULL
             AND cg$rec.UNIVERSITE_ORIGINE BETWEEN c.RV_LOW_VALUE AND c.RV_HIGH_VALUE )
         THEN
           found := true;
           EXIT;
         END IF;
      END LOOP;

      IF ( NOT found ) THEN
        cg$errors.push( cg$errors.MsgGetText(cg$errors.API_RV_LOOKUP_FAIL,
                                             cg$errors.APIMSG_RV_LOOKUP_FAIL,
                                             cg$rec.UNIVERSITE_ORIGINE,'CANDIDAT','UNIVERSITE_ORIGINE'),
                        'E',
                        'API',
                        cg$errors.API_RV_LOOKUP_FAIL,
                        'cg$CANDIDAT.v_domain.no_data_found' );
        cg$errors.raise_failure;
      END IF;
    END IF;

    found := false;
    IF (cg$ind.LISTE_SELECTION AND cg$rec.LISTE_SELECTION IS NOT NULL) THEN
      FOR c IN (SELECT RV_LOW_VALUE, RV_HIGH_VALUE FROM CG_REF_CODES WHERE RV_DOMAIN = 'LISTE_SELECTION' )
      LOOP
         IF (    c.RV_HIGH_VALUE IS NULL 
             AND cg$rec.LISTE_SELECTION = c.RV_LOW_VALUE )
         OR (    c.RV_HIGH_VALUE IS NOT NULL
             AND cg$rec.LISTE_SELECTION BETWEEN c.RV_LOW_VALUE AND c.RV_HIGH_VALUE )
         THEN
           found := true;
           EXIT;
         END IF;
      END LOOP;

      IF ( NOT found ) THEN
        cg$errors.push( cg$errors.MsgGetText(cg$errors.API_RV_LOOKUP_FAIL,
                                             cg$errors.APIMSG_RV_LOOKUP_FAIL,
                                             cg$rec.LISTE_SELECTION,'CANDIDAT','LISTE_SELECTION'),
                        'E',
                        'API',
                        cg$errors.API_RV_LOOKUP_FAIL,
                        'cg$CANDIDAT.v_domain.no_data_found' );
        cg$errors.raise_failure;
      END IF;
    END IF;


    found := false;
    IF (cg$ind.CONFIRMATION_CANDIDAT AND cg$rec.CONFIRMATION_CANDIDAT IS NOT NULL) THEN
      FOR c IN (SELECT RV_LOW_VALUE, RV_HIGH_VALUE FROM CG_REF_CODES WHERE RV_DOMAIN = 'OUI_NON' )
      LOOP
         IF (    c.RV_HIGH_VALUE IS NULL 
             AND cg$rec.CONFIRMATION_CANDIDAT = c.RV_LOW_VALUE )
         OR (    c.RV_HIGH_VALUE IS NOT NULL
             AND cg$rec.CONFIRMATION_CANDIDAT BETWEEN c.RV_LOW_VALUE AND c.RV_HIGH_VALUE )
         THEN
           found := true;
           EXIT;
         END IF;
      END LOOP;

      IF ( NOT found ) THEN
        cg$errors.push( cg$errors.MsgGetText(cg$errors.API_RV_LOOKUP_FAIL,
                                             cg$errors.APIMSG_RV_LOOKUP_FAIL,
                                             cg$rec.CONFIRMATION_CANDIDAT,'CANDIDAT','CONFIRMATION_CANDIDAT'),
                        'E',
                        'API',
                        cg$errors.API_RV_LOOKUP_FAIL,
                        'cg$CANDIDAT.v_domain.no_data_found' );
        cg$errors.raise_failure;
      END IF;
    END IF;



    NULL;

EXCEPTION
    WHEN cg$errors.cg$error THEN 
        cg$errors.raise_failure;
    WHEN no_tabview THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_RV_TAB_NOT_FOUND,
                                            cg$errors.APIMSG_RV_TAB_NOT_FOUND,
                                            'CG_REF_CODES','CANDIDAT'),
                       'E',
                       'API',
                       cg$errors.API_RV_TAB_NOT_FOUND,
                       'cg$CANDIDAT.v_domain.no_reftable_found');
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$CANDIDAT.v_domain.others');
        cg$errors.raise_failure;
END validate_domain;


--------------------------------------------------------------------------------
-- Name:        err_msg
--
-- Description: Pushes onto stack appropriate user defined error message
--              depending on the rule violated
--
-- Parameters:  msg     Oracle error message
--              type    Type of violation e.g. check_constraint: ERR_CHECK_CON
--              loc     Place where this procedure was called for error 
--                      trapping
--------------------------------------------------------------------------------
PROCEDURE err_msg(msg   IN VARCHAR2,
                  type  IN INTEGER,
                  loc   IN VARCHAR2 DEFAULT '') IS
con_name VARCHAR2(240);
BEGIN
    con_name := cg$errors.parse_constraint(msg, type);
    IF (con_name = 'CAN_PK') THEN
        cg$errors.push(nvl(CAN_PK 
                  ,cg$errors.MsgGetText(cg$errors.API_PK_CON_VIOLATED
					                 ,cg$errors.APIMSG_PK_VIOLAT
                                     ,'CAN_PK' 
                                     ,'CANDIDAT')),
                       'E',
                       'API',
                       cg$errors.API_PK_CON_VIOLATED,
                       loc);

    ELSIF (con_name = 'CAN_PRO_FK') THEN
        cg$errors.push(nvl(CAN_PRO_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'CAN_PRO_FK' 
                                     ,'CANDIDAT')),
                       'E',
                       'API',
                       cg$errors.API_FK_CON_VIOLATED,
                       loc);
    ELSE
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       loc);
    END IF;
END err_msg;




--------------------------------------------------------------------------------
-- Name:        doLobs
--
-- Description: This function is updating lob columns
--
-- Parameters:  cg$rec  Record of row to be inserted
--              cg$ind  Record of columns specifically set
--------------------------------------------------------------------------------
PROCEDURE doLobs(cg$rec IN OUT cg$row_type,
                 cg$ind IN OUT cg$ind_type) IS
BEGIN
   NULL;
END doLobs;


--------------------------------------------------------------------------------
-- Name:        ins
--
-- Description: API insert procedure
--
-- Parameters:  cg$rec  Record of row to be inserted
--              cg$ind  Record of columns specifically set
--              do_ins  Whether we want the actual INSERT to occur
--------------------------------------------------------------------------------
PROCEDURE ins(cg$rec IN OUT cg$row_type,
              cg$ind IN OUT cg$ind_type,
              do_ins IN BOOLEAN DEFAULT TRUE) IS
cg$tmp_rec cg$row_type;

--  Constant default values

D90_NATIONALITE CONSTANT CANDIDAT.NATIONALITE%TYPE := 'Française';

BEGIN
--  Application_logic Pre-Insert <<Start>>
--  Application_logic Pre-Insert << End >>

--  Defaulted

    IF NOT (cg$ind.NATIONALITE) THEN cg$rec.NATIONALITE := D90_NATIONALITE; END IF;
--  Auto-generated and uppercased columns

    up_autogen_columns(cg$rec, cg$ind, 'INS', do_ins);

    called_from_package := TRUE;

    IF (do_ins) THEN 
        validate_foreign_keys_ins(cg$rec);
        validate_arc(cg$rec);
        validate_domain(cg$rec);

        INSERT INTO CANDIDAT
            (CODE_FORMATION
            ,ANNEE_UNIVERSITAIRE
            ,NO_CANDIDAT
            ,NOM
            ,PRENOM
            ,SEXE
            ,DATE_NAISSANCE
            ,LIEU_NAISSANCE
            ,NATIONALITE
            ,TELEPHONE
            ,MOBILE
            ,EMAIL
            ,ADRESSE
            ,CODE_POSTAL
            ,VILLE
            ,PAYS_ORIGINE
            ,UNIVERSITE_ORIGINE
            ,LISTE_SELECTION
            ,SELECTION_NO_ORDRE
            ,CONFIRMATION_CANDIDAT
            ,DATE_REPONSE_CANDIDAT)
        VALUES
            (cg$rec.CODE_FORMATION
            ,cg$rec.ANNEE_UNIVERSITAIRE
            ,cg$rec.NO_CANDIDAT
            ,cg$rec.NOM
            ,cg$rec.PRENOM
            ,cg$rec.SEXE
            ,cg$rec.DATE_NAISSANCE
            ,cg$rec.LIEU_NAISSANCE
            ,cg$rec.NATIONALITE
            ,cg$rec.TELEPHONE
            ,cg$rec.MOBILE
            ,cg$rec.EMAIL
            ,cg$rec.ADRESSE
            ,cg$rec.CODE_POSTAL
            ,cg$rec.VILLE
            ,cg$rec.PAYS_ORIGINE
            ,cg$rec.UNIVERSITE_ORIGINE
            ,cg$rec.LISTE_SELECTION
            ,cg$rec.SELECTION_NO_ORDRE
            ,cg$rec.CONFIRMATION_CANDIDAT
            ,cg$rec.DATE_REPONSE_CANDIDAT
);
        doLobs(cg$rec, cg$ind);
        slct(cg$rec);

        upd_oper_denorm2(cg$rec, cg$tmp_rec, cg$ind, 'INS');
    END IF;

    called_from_package := FALSE;



--  Application logic Post-Insert <<Start>>
--  Application logic Post-Insert << End >>

EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.mandatory_missing THEN
        validate_mandatory(cg$rec, 'cg$CANDIDAT.ins.mandatory_missing');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$CANDIDAT.ins.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$CANDIDAT.ins.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$CANDIDAT.ins.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$CANDIDAT.ins.others');
        called_from_package := FALSE;
        cg$errors.raise_failure;
END ins;


--------------------------------------------------------------------------------
-- Name:        upd
--
-- Description: API update procedure
--
-- Parameters:  cg$rec  Record of row to be updated
--              cg$ind  Record of columns specifically set
--              do_upd  Whether we want the actual UPDATE to occur
--------------------------------------------------------------------------------
PROCEDURE upd(cg$rec             IN OUT cg$row_type,
              cg$ind             IN OUT cg$ind_type,
              do_upd             IN BOOLEAN DEFAULT TRUE,
              cg$pk              IN cg$row_type DEFAULT NULL )    
IS
  cg$upd_rec    cg$row_type;
  cg$old_rec    cg$row_type;
  RECORD_LOGGED BOOLEAN := FALSE;
BEGIN
--  Application_logic Pre-Update <<Start>>
--  Application_logic Pre-Update << End >>

 
    IF ( cg$pk.CODE_FORMATION IS NULL ) THEN          
      cg$upd_rec.CODE_FORMATION := cg$rec.CODE_FORMATION;
    ELSE
      cg$upd_rec.CODE_FORMATION := cg$pk.CODE_FORMATION;
    END IF;
    cg$old_rec.CODE_FORMATION := cg$upd_rec.CODE_FORMATION;
    IF ( cg$pk.ANNEE_UNIVERSITAIRE IS NULL ) THEN          
      cg$upd_rec.ANNEE_UNIVERSITAIRE := cg$rec.ANNEE_UNIVERSITAIRE;
    ELSE
      cg$upd_rec.ANNEE_UNIVERSITAIRE := cg$pk.ANNEE_UNIVERSITAIRE;
    END IF;
    cg$old_rec.ANNEE_UNIVERSITAIRE := cg$upd_rec.ANNEE_UNIVERSITAIRE;
    IF ( cg$pk.NO_CANDIDAT IS NULL ) THEN          
      cg$upd_rec.NO_CANDIDAT := cg$rec.NO_CANDIDAT;
    ELSE
      cg$upd_rec.NO_CANDIDAT := cg$pk.NO_CANDIDAT;
    END IF;
    cg$old_rec.NO_CANDIDAT := cg$upd_rec.NO_CANDIDAT;

    IF ( cg$pk.the_rowid IS NULL ) THEN             
      cg$upd_rec.the_rowid := cg$rec.the_rowid;
    ELSE
      cg$upd_rec.the_rowid := cg$pk.the_rowid;
    END IF;
    cg$old_rec.the_rowid := cg$upd_rec.the_rowid;

    IF ( do_upd ) THEN

        slct(cg$upd_rec);


        --  Report error if attempt to update non updateable Primary Key CAN_PK
        IF (cg$ind.CODE_FORMATION AND cg$rec.CODE_FORMATION != cg$upd_rec.CODE_FORMATION) THEN
            raise_uk_not_updateable('CAN_PK');
        END IF;
        IF (cg$ind.ANNEE_UNIVERSITAIRE AND cg$rec.ANNEE_UNIVERSITAIRE != cg$upd_rec.ANNEE_UNIVERSITAIRE) THEN
            raise_uk_not_updateable('CAN_PK');
        END IF;
        IF (cg$ind.NO_CANDIDAT AND cg$rec.NO_CANDIDAT != cg$upd_rec.NO_CANDIDAT) THEN
            raise_uk_not_updateable('CAN_PK');
        END IF;
        IF NOT (cg$ind.CODE_FORMATION) THEN
            cg$rec.CODE_FORMATION := cg$upd_rec.CODE_FORMATION;
        END IF;
        IF NOT (cg$ind.ANNEE_UNIVERSITAIRE) THEN
            cg$rec.ANNEE_UNIVERSITAIRE := cg$upd_rec.ANNEE_UNIVERSITAIRE;
        END IF;
        IF NOT (cg$ind.NO_CANDIDAT) THEN
            cg$rec.NO_CANDIDAT := cg$upd_rec.NO_CANDIDAT;
        END IF;
        IF NOT (cg$ind.NOM) THEN
            cg$rec.NOM := cg$upd_rec.NOM;
        END IF;
        IF NOT (cg$ind.PRENOM) THEN
            cg$rec.PRENOM := cg$upd_rec.PRENOM;
        END IF;
        IF NOT (cg$ind.SEXE) THEN
            cg$rec.SEXE := cg$upd_rec.SEXE;
        END IF;
        IF NOT (cg$ind.DATE_NAISSANCE) THEN
            cg$rec.DATE_NAISSANCE := cg$upd_rec.DATE_NAISSANCE;
        END IF;
        IF NOT (cg$ind.LIEU_NAISSANCE) THEN
            cg$rec.LIEU_NAISSANCE := cg$upd_rec.LIEU_NAISSANCE;
        END IF;
        IF NOT (cg$ind.NATIONALITE) THEN
            cg$rec.NATIONALITE := cg$upd_rec.NATIONALITE;
        END IF;
        IF NOT (cg$ind.TELEPHONE) THEN
            cg$rec.TELEPHONE := cg$upd_rec.TELEPHONE;
        END IF;
        IF NOT (cg$ind.MOBILE) THEN
            cg$rec.MOBILE := cg$upd_rec.MOBILE;
        END IF;
        IF NOT (cg$ind.EMAIL) THEN
            cg$rec.EMAIL := cg$upd_rec.EMAIL;
        END IF;
        IF NOT (cg$ind.ADRESSE) THEN
            cg$rec.ADRESSE := cg$upd_rec.ADRESSE;
        END IF;
        IF NOT (cg$ind.CODE_POSTAL) THEN
            cg$rec.CODE_POSTAL := cg$upd_rec.CODE_POSTAL;
        END IF;
        IF NOT (cg$ind.VILLE) THEN
            cg$rec.VILLE := cg$upd_rec.VILLE;
        END IF;
        IF NOT (cg$ind.PAYS_ORIGINE) THEN
            cg$rec.PAYS_ORIGINE := cg$upd_rec.PAYS_ORIGINE;
        END IF;
        IF NOT (cg$ind.UNIVERSITE_ORIGINE) THEN
            cg$rec.UNIVERSITE_ORIGINE := cg$upd_rec.UNIVERSITE_ORIGINE;
        END IF;
        IF NOT (cg$ind.LISTE_SELECTION) THEN
            cg$rec.LISTE_SELECTION := cg$upd_rec.LISTE_SELECTION;
        END IF;
        IF NOT (cg$ind.SELECTION_NO_ORDRE) THEN
            cg$rec.SELECTION_NO_ORDRE := cg$upd_rec.SELECTION_NO_ORDRE;
        END IF;
        IF NOT (cg$ind.CONFIRMATION_CANDIDAT) THEN
            cg$rec.CONFIRMATION_CANDIDAT := cg$upd_rec.CONFIRMATION_CANDIDAT;
        END IF;
        IF NOT (cg$ind.DATE_REPONSE_CANDIDAT) THEN
            cg$rec.DATE_REPONSE_CANDIDAT := cg$upd_rec.DATE_REPONSE_CANDIDAT;
        END IF;
    ELSE
	     -- Perform checks if called from a trigger
	     -- Indicators are only set on changed values
	     null;
        --  Report error if attempt to update non updateable Primary Key CAN_PK
        IF ( cg$ind.CODE_FORMATION 
        OR   cg$ind.ANNEE_UNIVERSITAIRE 
        OR   cg$ind.NO_CANDIDAT ) THEN
          raise_uk_not_updateable('CAN_PK');
        END IF;
    END IF;

    up_autogen_columns(cg$rec, cg$ind, 'UPD', do_upd);  --  Auto-generated and uppercased columns

--  Now do update if updateable columns exist
    IF (do_upd) THEN
        DECLARE
            called_from BOOLEAN := called_from_package;
        BEGIN
          called_from_package := TRUE;

          slct(cg$old_rec);                          
          validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);
          validate_arc(cg$rec);
          validate_domain(cg$rec, cg$ind);
          validate_domain_cascade_update(cg$old_rec);

          IF cg$rec.the_rowid is null THEN
            UPDATE CANDIDAT
            SET
              NOM = cg$rec.NOM
              ,PRENOM = cg$rec.PRENOM
              ,SEXE = cg$rec.SEXE
              ,DATE_NAISSANCE = cg$rec.DATE_NAISSANCE
              ,LIEU_NAISSANCE = cg$rec.LIEU_NAISSANCE
              ,NATIONALITE = cg$rec.NATIONALITE
              ,TELEPHONE = cg$rec.TELEPHONE
              ,MOBILE = cg$rec.MOBILE
              ,EMAIL = cg$rec.EMAIL
              ,ADRESSE = cg$rec.ADRESSE
              ,CODE_POSTAL = cg$rec.CODE_POSTAL
              ,VILLE = cg$rec.VILLE
              ,PAYS_ORIGINE = cg$rec.PAYS_ORIGINE
              ,UNIVERSITE_ORIGINE = cg$rec.UNIVERSITE_ORIGINE
              ,LISTE_SELECTION = cg$rec.LISTE_SELECTION
              ,SELECTION_NO_ORDRE = cg$rec.SELECTION_NO_ORDRE
              ,CONFIRMATION_CANDIDAT = cg$rec.CONFIRMATION_CANDIDAT
              ,DATE_REPONSE_CANDIDAT = cg$rec.DATE_REPONSE_CANDIDAT
            WHERE  CODE_FORMATION = cg$rec.CODE_FORMATION
            AND    ANNEE_UNIVERSITAIRE = cg$rec.ANNEE_UNIVERSITAIRE
            AND    NO_CANDIDAT = cg$rec.NO_CANDIDAT;
            null;
          ELSE
            UPDATE CANDIDAT
            SET
              NOM = cg$rec.NOM
              ,PRENOM = cg$rec.PRENOM
              ,SEXE = cg$rec.SEXE
              ,DATE_NAISSANCE = cg$rec.DATE_NAISSANCE
              ,LIEU_NAISSANCE = cg$rec.LIEU_NAISSANCE
              ,NATIONALITE = cg$rec.NATIONALITE
              ,TELEPHONE = cg$rec.TELEPHONE
              ,MOBILE = cg$rec.MOBILE
              ,EMAIL = cg$rec.EMAIL
              ,ADRESSE = cg$rec.ADRESSE
              ,CODE_POSTAL = cg$rec.CODE_POSTAL
              ,VILLE = cg$rec.VILLE
              ,PAYS_ORIGINE = cg$rec.PAYS_ORIGINE
              ,UNIVERSITE_ORIGINE = cg$rec.UNIVERSITE_ORIGINE
              ,LISTE_SELECTION = cg$rec.LISTE_SELECTION
              ,SELECTION_NO_ORDRE = cg$rec.SELECTION_NO_ORDRE
              ,CONFIRMATION_CANDIDAT = cg$rec.CONFIRMATION_CANDIDAT
              ,DATE_REPONSE_CANDIDAT = cg$rec.DATE_REPONSE_CANDIDAT
            WHERE rowid = cg$rec.the_rowid;

            null;
          END IF;

          slct(cg$rec);

          upd_denorm2(cg$rec, cg$ind);
          upd_oper_denorm2(cg$rec, cg$old_rec, cg$ind, 'UPD');
          cascade_update(cg$rec, cg$old_rec);
          domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             
          called_from_package := called_from;
        END;
    END IF;



    IF NOT (do_upd) THEN
        cg$table(idx).CODE_FORMATION := cg$rec.CODE_FORMATION;
        cg$tableind(idx).CODE_FORMATION := cg$ind.CODE_FORMATION;
        cg$table(idx).ANNEE_UNIVERSITAIRE := cg$rec.ANNEE_UNIVERSITAIRE;
        cg$tableind(idx).ANNEE_UNIVERSITAIRE := cg$ind.ANNEE_UNIVERSITAIRE;
        cg$table(idx).NO_CANDIDAT := cg$rec.NO_CANDIDAT;
        cg$tableind(idx).NO_CANDIDAT := cg$ind.NO_CANDIDAT;
        cg$table(idx).NOM := cg$rec.NOM;
        cg$tableind(idx).NOM := cg$ind.NOM;
        cg$table(idx).PRENOM := cg$rec.PRENOM;
        cg$tableind(idx).PRENOM := cg$ind.PRENOM;
        cg$table(idx).SEXE := cg$rec.SEXE;
        cg$tableind(idx).SEXE := cg$ind.SEXE;
        cg$table(idx).DATE_NAISSANCE := cg$rec.DATE_NAISSANCE;
        cg$tableind(idx).DATE_NAISSANCE := cg$ind.DATE_NAISSANCE;
        cg$table(idx).LIEU_NAISSANCE := cg$rec.LIEU_NAISSANCE;
        cg$tableind(idx).LIEU_NAISSANCE := cg$ind.LIEU_NAISSANCE;
        cg$table(idx).NATIONALITE := cg$rec.NATIONALITE;
        cg$tableind(idx).NATIONALITE := cg$ind.NATIONALITE;
        cg$table(idx).TELEPHONE := cg$rec.TELEPHONE;
        cg$tableind(idx).TELEPHONE := cg$ind.TELEPHONE;
        cg$table(idx).MOBILE := cg$rec.MOBILE;
        cg$tableind(idx).MOBILE := cg$ind.MOBILE;
        cg$table(idx).EMAIL := cg$rec.EMAIL;
        cg$tableind(idx).EMAIL := cg$ind.EMAIL;
        cg$table(idx).ADRESSE := cg$rec.ADRESSE;
        cg$tableind(idx).ADRESSE := cg$ind.ADRESSE;
        cg$table(idx).CODE_POSTAL := cg$rec.CODE_POSTAL;
        cg$tableind(idx).CODE_POSTAL := cg$ind.CODE_POSTAL;
        cg$table(idx).VILLE := cg$rec.VILLE;
        cg$tableind(idx).VILLE := cg$ind.VILLE;
        cg$table(idx).PAYS_ORIGINE := cg$rec.PAYS_ORIGINE;
        cg$tableind(idx).PAYS_ORIGINE := cg$ind.PAYS_ORIGINE;
        cg$table(idx).UNIVERSITE_ORIGINE := cg$rec.UNIVERSITE_ORIGINE;
        cg$tableind(idx).UNIVERSITE_ORIGINE := cg$ind.UNIVERSITE_ORIGINE;
        cg$table(idx).LISTE_SELECTION := cg$rec.LISTE_SELECTION;
        cg$tableind(idx).LISTE_SELECTION := cg$ind.LISTE_SELECTION;
        cg$table(idx).SELECTION_NO_ORDRE := cg$rec.SELECTION_NO_ORDRE;
        cg$tableind(idx).SELECTION_NO_ORDRE := cg$ind.SELECTION_NO_ORDRE;
        cg$table(idx).CONFIRMATION_CANDIDAT := cg$rec.CONFIRMATION_CANDIDAT;
        cg$tableind(idx).CONFIRMATION_CANDIDAT := cg$ind.CONFIRMATION_CANDIDAT;
        cg$table(idx).DATE_REPONSE_CANDIDAT := cg$rec.DATE_REPONSE_CANDIDAT;
        cg$tableind(idx).DATE_REPONSE_CANDIDAT := cg$ind.DATE_REPONSE_CANDIDAT;

        cg$table(idx).action_performed := 'UPD';
        idx := idx + 1;
    END IF;

--  Application_logic Post-Update <<Start>>
--  Application_logic Post-Update << End >>
            
EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.upd_mandatory_null THEN
        validate_mandatory(cg$rec, 'cg$CANDIDAT.upd.upd_mandatory_null');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$CANDIDAT.upd.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$CANDIDAT.upd.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$CANDIDAT.upd.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$CANDIDAT.upd.others');
        called_from_package := FALSE;
        cg$errors.raise_failure;
END upd;


----------------------------------------------------------------------------------------
-- Name:        domain_cascade_upd
--
-- Description: Update the Domain Constraint Key columns of CANDIDAT when the
--              Cascade Update rule is Cascades and the domain table has been
--              updated. Called from <Domain Table pkg>.domain_cascade_update().
--
-- Parameters:  cg$rec      New values for CANDIDAT's domain key constraint columns 
--              cg$ind      Indicates changed CANDIDAT's domain key constraint columns
--              cg$old_rec  Current values for CANDIDAT's domain key constraint columns
----------------------------------------------------------------------------------------
PROCEDURE   domain_cascade_upd( cg$rec     IN OUT cg$row_type,
                                cg$ind     IN OUT cg$ind_type,
                                cg$old_rec IN     cg$row_type )
IS
  called_from BOOLEAN := called_from_package;
BEGIN

  null;
END domain_cascade_upd;


--------------------------------------------------------------------------------
-- Name:        upd_denorm
--
-- Description: API procedure for simple denormalization
--
-- Parameters:  cg$rec  Record of row to be updated
--              cg$ind  Record of columns specifically set
--              do_upd  Whether we want the actual UPDATE to occur
--------------------------------------------------------------------------------
PROCEDURE upd_denorm2( cg$rec IN cg$row_type,
                       cg$ind IN cg$ind_type ) IS
BEGIN
  NULL;
END upd_denorm2;


--------------------------------------------------------------------------------
-- Name:        upd_oper_denorm
--
-- Description: API procedure for operation denormalization
--
-- Parameters:  cg$rec  Record of row to be updated
--              cg$ind  Record of columns specifically set
--              do_upd  Whether we want the actual UPDATE to occur
--------------------------------------------------------------------------------
PROCEDURE upd_oper_denorm2( cg$rec IN cg$row_type,
                            cg$old_rec IN cg$row_type,
                            cg$ind IN cg$ind_type,
                            operation IN VARCHAR2 DEFAULT 'UPD'
					           )
IS
BEGIN





















NULL;
END upd_oper_denorm2;

--------------------------------------------------------------------------------
-- Name:        del
--
-- Description: API delete procedure
--
-- Parameters:  cg$pk  Primary key record of row to be deleted
--------------------------------------------------------------------------------
PROCEDURE del(cg$pk IN cg$pk_type,
              do_del IN BOOLEAN DEFAULT TRUE) IS
BEGIN
--  Application_logic Pre-Delete <<Start>>
--  Application_logic Pre-Delete << End >>

--  Delete the record

    called_from_package := TRUE;

    IF (do_del) THEN
        DECLARE
           cg$rec cg$row_type;
           cg$old_rec cg$row_type;
           cg$ind cg$ind_type;
        BEGIN
           cg$rec.CODE_FORMATION := cg$pk.CODE_FORMATION;
           cg$rec.ANNEE_UNIVERSITAIRE := cg$pk.ANNEE_UNIVERSITAIRE;
           cg$rec.NO_CANDIDAT := cg$pk.NO_CANDIDAT;
           slct(cg$rec);

           validate_foreign_keys_del(cg$rec);
           validate_domain_cascade_delete(cg$rec);    

           IF cg$pk.the_rowid is null THEN
              DELETE CANDIDAT
              WHERE                    CODE_FORMATION = cg$pk.CODE_FORMATION
              AND          ANNEE_UNIVERSITAIRE = cg$pk.ANNEE_UNIVERSITAIRE
              AND          NO_CANDIDAT = cg$pk.NO_CANDIDAT;
           ELSE
              DELETE CANDIDAT
              WHERE  rowid = cg$pk.the_rowid;
           END IF;

           upd_oper_denorm2(cg$rec, cg$old_rec, cg$ind, 'DEL');
           cascade_delete(cg$rec);
           domain_cascade_delete(cg$rec);             
        END;
    END IF;

    called_from_package := FALSE;


--  Application_logic Post-Delete <<Start>>
--  Application_logic Post-Delete << End >>

EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.delete_restrict THEN
        err_msg(SQLERRM, cg$errors.ERR_DELETE_RESTRICT, 'cg$CANDIDAT.del.delete_restrict');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN no_data_found THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$CANDIDAT.del.no_data_found');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$CANDIDAT.del.others');
        called_from_package := FALSE;
        cg$errors.raise_failure;
END del;


--------------------------------------------------------------------------------
-- Name:        lck
--
-- Description: API lock procedure
--
-- Parameters:  cg$old_rec  Calling apps view of record of row to be locked
--              cg$old_ind  Record of columns to raise error if modified
--              nowait_flag TRUE lock with NOWAIT, FALSE don't fail if busy
--------------------------------------------------------------------------------
PROCEDURE lck(cg$old_rec IN cg$row_type,
              cg$old_ind IN cg$ind_type,
              nowait_flag IN BOOLEAN DEFAULT TRUE) IS
cg$tmp_rec cg$row_type;
any_modified BOOLEAN := FALSE;

BEGIN
--  Application_logic Pre-Lock <<Start>>
--  Application_logic Pre-Lock << End >>

--  Do the row lock

    BEGIN
        IF (nowait_flag) THEN
            IF cg$old_rec.the_rowid is null THEN
               SELECT       CODE_FORMATION
               ,            ANNEE_UNIVERSITAIRE
               ,            NO_CANDIDAT
               ,            NOM
               ,            PRENOM
               ,            SEXE
               ,            DATE_NAISSANCE
               ,            LIEU_NAISSANCE
               ,            NATIONALITE
               ,            TELEPHONE
               ,            MOBILE
               ,            EMAIL
               ,            ADRESSE
               ,            CODE_POSTAL
               ,            VILLE
               ,            PAYS_ORIGINE
               ,            UNIVERSITE_ORIGINE
               ,            LISTE_SELECTION
               ,            SELECTION_NO_ORDRE
               ,            CONFIRMATION_CANDIDAT
               ,            DATE_REPONSE_CANDIDAT
               INTO         cg$tmp_rec.CODE_FORMATION
               ,            cg$tmp_rec.ANNEE_UNIVERSITAIRE
               ,            cg$tmp_rec.NO_CANDIDAT
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.SEXE
               ,            cg$tmp_rec.DATE_NAISSANCE
               ,            cg$tmp_rec.LIEU_NAISSANCE
               ,            cg$tmp_rec.NATIONALITE
               ,            cg$tmp_rec.TELEPHONE
               ,            cg$tmp_rec.MOBILE
               ,            cg$tmp_rec.EMAIL
               ,            cg$tmp_rec.ADRESSE
               ,            cg$tmp_rec.CODE_POSTAL
               ,            cg$tmp_rec.VILLE
               ,            cg$tmp_rec.PAYS_ORIGINE
               ,            cg$tmp_rec.UNIVERSITE_ORIGINE
               ,            cg$tmp_rec.LISTE_SELECTION
               ,            cg$tmp_rec.SELECTION_NO_ORDRE
               ,            cg$tmp_rec.CONFIRMATION_CANDIDAT
               ,            cg$tmp_rec.DATE_REPONSE_CANDIDAT
               FROM      CANDIDAT
               WHERE              CODE_FORMATION = cg$old_rec.CODE_FORMATION
               AND          ANNEE_UNIVERSITAIRE = cg$old_rec.ANNEE_UNIVERSITAIRE
               AND          NO_CANDIDAT = cg$old_rec.NO_CANDIDAT
               FOR UPDATE NOWAIT;
            ELSE
               SELECT       CODE_FORMATION
               ,            ANNEE_UNIVERSITAIRE
               ,            NO_CANDIDAT
               ,            NOM
               ,            PRENOM
               ,            SEXE
               ,            DATE_NAISSANCE
               ,            LIEU_NAISSANCE
               ,            NATIONALITE
               ,            TELEPHONE
               ,            MOBILE
               ,            EMAIL
               ,            ADRESSE
               ,            CODE_POSTAL
               ,            VILLE
               ,            PAYS_ORIGINE
               ,            UNIVERSITE_ORIGINE
               ,            LISTE_SELECTION
               ,            SELECTION_NO_ORDRE
               ,            CONFIRMATION_CANDIDAT
               ,            DATE_REPONSE_CANDIDAT
               INTO         cg$tmp_rec.CODE_FORMATION
               ,            cg$tmp_rec.ANNEE_UNIVERSITAIRE
               ,            cg$tmp_rec.NO_CANDIDAT
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.SEXE
               ,            cg$tmp_rec.DATE_NAISSANCE
               ,            cg$tmp_rec.LIEU_NAISSANCE
               ,            cg$tmp_rec.NATIONALITE
               ,            cg$tmp_rec.TELEPHONE
               ,            cg$tmp_rec.MOBILE
               ,            cg$tmp_rec.EMAIL
               ,            cg$tmp_rec.ADRESSE
               ,            cg$tmp_rec.CODE_POSTAL
               ,            cg$tmp_rec.VILLE
               ,            cg$tmp_rec.PAYS_ORIGINE
               ,            cg$tmp_rec.UNIVERSITE_ORIGINE
               ,            cg$tmp_rec.LISTE_SELECTION
               ,            cg$tmp_rec.SELECTION_NO_ORDRE
               ,            cg$tmp_rec.CONFIRMATION_CANDIDAT
               ,            cg$tmp_rec.DATE_REPONSE_CANDIDAT
               FROM      CANDIDAT
               WHERE rowid = cg$old_rec.the_rowid
               FOR UPDATE NOWAIT;
            END IF;
        ELSE
            IF cg$old_rec.the_rowid is null THEN
               SELECT       CODE_FORMATION
               ,            ANNEE_UNIVERSITAIRE
               ,            NO_CANDIDAT
               ,            NOM
               ,            PRENOM
               ,            SEXE
               ,            DATE_NAISSANCE
               ,            LIEU_NAISSANCE
               ,            NATIONALITE
               ,            TELEPHONE
               ,            MOBILE
               ,            EMAIL
               ,            ADRESSE
               ,            CODE_POSTAL
               ,            VILLE
               ,            PAYS_ORIGINE
               ,            UNIVERSITE_ORIGINE
               ,            LISTE_SELECTION
               ,            SELECTION_NO_ORDRE
               ,            CONFIRMATION_CANDIDAT
               ,            DATE_REPONSE_CANDIDAT
               INTO         cg$tmp_rec.CODE_FORMATION
               ,            cg$tmp_rec.ANNEE_UNIVERSITAIRE
               ,            cg$tmp_rec.NO_CANDIDAT
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.SEXE
               ,            cg$tmp_rec.DATE_NAISSANCE
               ,            cg$tmp_rec.LIEU_NAISSANCE
               ,            cg$tmp_rec.NATIONALITE
               ,            cg$tmp_rec.TELEPHONE
               ,            cg$tmp_rec.MOBILE
               ,            cg$tmp_rec.EMAIL
               ,            cg$tmp_rec.ADRESSE
               ,            cg$tmp_rec.CODE_POSTAL
               ,            cg$tmp_rec.VILLE
               ,            cg$tmp_rec.PAYS_ORIGINE
               ,            cg$tmp_rec.UNIVERSITE_ORIGINE
               ,            cg$tmp_rec.LISTE_SELECTION
               ,            cg$tmp_rec.SELECTION_NO_ORDRE
               ,            cg$tmp_rec.CONFIRMATION_CANDIDAT
               ,            cg$tmp_rec.DATE_REPONSE_CANDIDAT
               FROM      CANDIDAT
               WHERE              CODE_FORMATION = cg$old_rec.CODE_FORMATION
               AND          ANNEE_UNIVERSITAIRE = cg$old_rec.ANNEE_UNIVERSITAIRE
               AND          NO_CANDIDAT = cg$old_rec.NO_CANDIDAT
               FOR UPDATE;
            ELSE
               SELECT       CODE_FORMATION
               ,            ANNEE_UNIVERSITAIRE
               ,            NO_CANDIDAT
               ,            NOM
               ,            PRENOM
               ,            SEXE
               ,            DATE_NAISSANCE
               ,            LIEU_NAISSANCE
               ,            NATIONALITE
               ,            TELEPHONE
               ,            MOBILE
               ,            EMAIL
               ,            ADRESSE
               ,            CODE_POSTAL
               ,            VILLE
               ,            PAYS_ORIGINE
               ,            UNIVERSITE_ORIGINE
               ,            LISTE_SELECTION
               ,            SELECTION_NO_ORDRE
               ,            CONFIRMATION_CANDIDAT
               ,            DATE_REPONSE_CANDIDAT
               INTO         cg$tmp_rec.CODE_FORMATION
               ,            cg$tmp_rec.ANNEE_UNIVERSITAIRE
               ,            cg$tmp_rec.NO_CANDIDAT
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.SEXE
               ,            cg$tmp_rec.DATE_NAISSANCE
               ,            cg$tmp_rec.LIEU_NAISSANCE
               ,            cg$tmp_rec.NATIONALITE
               ,            cg$tmp_rec.TELEPHONE
               ,            cg$tmp_rec.MOBILE
               ,            cg$tmp_rec.EMAIL
               ,            cg$tmp_rec.ADRESSE
               ,            cg$tmp_rec.CODE_POSTAL
               ,            cg$tmp_rec.VILLE
               ,            cg$tmp_rec.PAYS_ORIGINE
               ,            cg$tmp_rec.UNIVERSITE_ORIGINE
               ,            cg$tmp_rec.LISTE_SELECTION
               ,            cg$tmp_rec.SELECTION_NO_ORDRE
               ,            cg$tmp_rec.CONFIRMATION_CANDIDAT
               ,            cg$tmp_rec.DATE_REPONSE_CANDIDAT
               FROM      CANDIDAT
               WHERE rowid = cg$old_rec.the_rowid
               FOR UPDATE;
            END IF;
        END IF;

    EXCEPTION 
        WHEN cg$errors.cg$error THEN 
            cg$errors.raise_failure;
        WHEN cg$errors.resource_busy THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_LCK, cg$errors.ROW_LCK),
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$CANDIDAT.lck.resource_busy');
            cg$errors.raise_failure;
        WHEN no_data_found THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$CANDIDAT.lck.no_data_found');
            cg$errors.raise_failure;
        WHEN OTHERS THEN
            cg$errors.push(SQLERRM,
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$CANDIDAT.lck.others');
            cg$errors.raise_failure;
    END;

-- Optional Columns

    IF (cg$old_ind.TELEPHONE) THEN
        IF (cg$tmp_rec.TELEPHONE IS NOT NULL
        AND cg$old_rec.TELEPHONE IS NOT NULL) THEN
            IF (cg$tmp_rec.TELEPHONE NOT LIKE cg$old_rec.TELEPHONE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P100TELEPHONE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.TELEPHONE IS NOT NULL
        OR cg$old_rec.TELEPHONE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P100TELEPHONE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.MOBILE) THEN
        IF (cg$tmp_rec.MOBILE IS NOT NULL
        AND cg$old_rec.MOBILE IS NOT NULL) THEN
            IF (cg$tmp_rec.MOBILE NOT LIKE cg$old_rec.MOBILE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P110MOBILE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.MOBILE IS NOT NULL
        OR cg$old_rec.MOBILE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P110MOBILE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.CODE_POSTAL) THEN
        IF (cg$tmp_rec.CODE_POSTAL IS NOT NULL
        AND cg$old_rec.CODE_POSTAL IS NOT NULL) THEN
            IF (cg$tmp_rec.CODE_POSTAL NOT LIKE cg$old_rec.CODE_POSTAL) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P180CODE_POSTAL
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.CODE_POSTAL IS NOT NULL
        OR cg$old_rec.CODE_POSTAL IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P180CODE_POSTAL
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.LISTE_SELECTION) THEN
        IF (cg$tmp_rec.LISTE_SELECTION IS NOT NULL
        AND cg$old_rec.LISTE_SELECTION IS NOT NULL) THEN
            IF (cg$tmp_rec.LISTE_SELECTION NOT LIKE cg$old_rec.LISTE_SELECTION) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P230LISTE_SELECTION
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.LISTE_SELECTION IS NOT NULL
        OR cg$old_rec.LISTE_SELECTION IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P230LISTE_SELECTION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.SELECTION_NO_ORDRE) THEN
        IF (cg$tmp_rec.SELECTION_NO_ORDRE IS NOT NULL
        AND cg$old_rec.SELECTION_NO_ORDRE IS NOT NULL) THEN
            IF (cg$tmp_rec.SELECTION_NO_ORDRE NOT LIKE cg$old_rec.SELECTION_NO_ORDRE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P250SELECTION_NO_ORDRE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.SELECTION_NO_ORDRE IS NOT NULL
        OR cg$old_rec.SELECTION_NO_ORDRE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P250SELECTION_NO_ORDRE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.CONFIRMATION_CANDIDAT) THEN
        IF (cg$tmp_rec.CONFIRMATION_CANDIDAT IS NOT NULL
        AND cg$old_rec.CONFIRMATION_CANDIDAT IS NOT NULL) THEN
            IF (cg$tmp_rec.CONFIRMATION_CANDIDAT NOT LIKE cg$old_rec.CONFIRMATION_CANDIDAT) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P270CONFIRMATION_CANDIDAT
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.CONFIRMATION_CANDIDAT IS NOT NULL
        OR cg$old_rec.CONFIRMATION_CANDIDAT IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P270CONFIRMATION_CANDIDAT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DATE_REPONSE_CANDIDAT) THEN
        IF (cg$tmp_rec.DATE_REPONSE_CANDIDAT IS NOT NULL
        AND cg$old_rec.DATE_REPONSE_CANDIDAT IS NOT NULL) THEN
            IF (cg$tmp_rec.DATE_REPONSE_CANDIDAT NOT LIKE cg$old_rec.DATE_REPONSE_CANDIDAT) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P280DATE_REPONSE_CANDIDAT
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DATE_REPONSE_CANDIDAT IS NOT NULL
        OR cg$old_rec.DATE_REPONSE_CANDIDAT IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P280DATE_REPONSE_CANDIDAT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;

-- Mandatory Columns

    IF (cg$old_ind.CODE_FORMATION) THEN
        IF (cg$tmp_rec.CODE_FORMATION != cg$old_rec.CODE_FORMATION) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P15CODE_FORMATION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ANNEE_UNIVERSITAIRE) THEN
        IF (cg$tmp_rec.ANNEE_UNIVERSITAIRE != cg$old_rec.ANNEE_UNIVERSITAIRE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P20ANNEE_UNIVERSITAIRE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NO_CANDIDAT) THEN
        IF (cg$tmp_rec.NO_CANDIDAT != cg$old_rec.NO_CANDIDAT) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P30NO_CANDIDAT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NOM) THEN
        IF (cg$tmp_rec.NOM != cg$old_rec.NOM) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P40NOM
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.PRENOM) THEN
        IF (cg$tmp_rec.PRENOM != cg$old_rec.PRENOM) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50PRENOM
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.SEXE) THEN
        IF (cg$tmp_rec.SEXE != cg$old_rec.SEXE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P55SEXE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DATE_NAISSANCE) THEN
        IF (cg$tmp_rec.DATE_NAISSANCE != cg$old_rec.DATE_NAISSANCE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P60DATE_NAISSANCE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.LIEU_NAISSANCE) THEN
        IF (cg$tmp_rec.LIEU_NAISSANCE != cg$old_rec.LIEU_NAISSANCE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P70LIEU_NAISSANCE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NATIONALITE) THEN
        IF (cg$tmp_rec.NATIONALITE != cg$old_rec.NATIONALITE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P90NATIONALITE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.EMAIL) THEN
        IF (cg$tmp_rec.EMAIL != cg$old_rec.EMAIL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P120EMAIL
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ADRESSE) THEN
        IF (cg$tmp_rec.ADRESSE != cg$old_rec.ADRESSE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P170ADRESSE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.VILLE) THEN
        IF (cg$tmp_rec.VILLE != cg$old_rec.VILLE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P190VILLE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.PAYS_ORIGINE) THEN
        IF (cg$tmp_rec.PAYS_ORIGINE != cg$old_rec.PAYS_ORIGINE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P200PAYS_ORIGINE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.UNIVERSITE_ORIGINE) THEN
        IF (cg$tmp_rec.UNIVERSITE_ORIGINE != cg$old_rec.UNIVERSITE_ORIGINE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P225UNIVERSITE_ORIGINE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;

    IF (any_modified) THEN
        cg$errors.raise_failure;
    END IF;

--  Application_logic Post-Lock <<Start>>
--  Application_logic Post-Lock << End >>

END lck;


BEGIN
      cg$ind_true.CODE_FORMATION := TRUE;
      cg$ind_true.ANNEE_UNIVERSITAIRE := TRUE;
      cg$ind_true.NO_CANDIDAT := TRUE;
      cg$ind_true.NOM := TRUE;
      cg$ind_true.PRENOM := TRUE;
      cg$ind_true.SEXE := TRUE;
      cg$ind_true.DATE_NAISSANCE := TRUE;
      cg$ind_true.LIEU_NAISSANCE := TRUE;
      cg$ind_true.NATIONALITE := TRUE;
      cg$ind_true.TELEPHONE := TRUE;
      cg$ind_true.MOBILE := TRUE;
      cg$ind_true.EMAIL := TRUE;
      cg$ind_true.ADRESSE := TRUE;
      cg$ind_true.CODE_POSTAL := TRUE;
      cg$ind_true.VILLE := TRUE;
      cg$ind_true.PAYS_ORIGINE := TRUE;
      cg$ind_true.UNIVERSITE_ORIGINE := TRUE;
      cg$ind_true.LISTE_SELECTION := TRUE;
      cg$ind_true.SELECTION_NO_ORDRE := TRUE;
      cg$ind_true.CONFIRMATION_CANDIDAT := TRUE;
      cg$ind_true.DATE_REPONSE_CANDIDAT := TRUE;
   

END cg$CANDIDAT;
/

