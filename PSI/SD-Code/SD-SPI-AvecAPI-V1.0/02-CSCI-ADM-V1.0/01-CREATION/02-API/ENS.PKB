
PROMPT Creating API Package Body for Table 'ENSEIGNANT'
--------------------------------------------------------------------------------
-- Name:        cg$ENSEIGNANT
-- Description: ENSEIGNANT table API package definitions
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY cg$ENSEIGNANT IS

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
                   'cg$ENSEIGNANT.raise_uk_not_updateable');
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
                   'cg$ENSEIGNANT.raise_fk_not_transferable');
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
    BEGIN
			IF (cg$ind.NO_ENSEIGNANT = FALSE
      OR  cg$rec.NO_ENSEIGNANT is NULL) THEN 
				SELECT ENS_SEQ.nextval
				INTO   cg$rec.NO_ENSEIGNANT
				FROM   DUAL;
				cg$ind.NO_ENSEIGNANT := TRUE;
			END IF;
    EXCEPTION WHEN others THEN
      cg$errors.push(SQLERRM, 'E', 'ORA', SQLCODE,
                     'cg$ENSEIGNANT.up_autogen.NO_ENSEIGNANT.OTHERS');
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
                    'cg$ENSEIGNANT.up_autogen_columns');
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
    IF (cg$val_rec.NO_ENSEIGNANT IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P10NO_ENSEIGNANT),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.TYPE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P25TYPE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.SEXE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P30SEXE),
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
    IF (cg$val_rec.ADRESSE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P60ADRESSE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.CODE_POSTAL IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P70CODE_POSTAL),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.VILLE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P80VILLE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.PAYS IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P90PAYS),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.MOBILE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P95MOBILE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.EMAIL_UBO IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P130EMAIL_UBO),
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
       SELECT    NO_ENSEIGNANT
       ,         TYPE
       ,         SEXE
       ,         NOM
       ,         PRENOM
       ,         ADRESSE
       ,         CODE_POSTAL
       ,         VILLE
       ,         PAYS
       ,         MOBILE
       ,         TELEPHONE
       ,         EMAIL_UBO
       ,         EMAIL_PERSO
       , rowid
       INTO      cg$sel_rec.NO_ENSEIGNANT
       ,         cg$sel_rec.TYPE
       ,         cg$sel_rec.SEXE
       ,         cg$sel_rec.NOM
       ,         cg$sel_rec.PRENOM
       ,         cg$sel_rec.ADRESSE
       ,         cg$sel_rec.CODE_POSTAL
       ,         cg$sel_rec.VILLE
       ,         cg$sel_rec.PAYS
       ,         cg$sel_rec.MOBILE
       ,         cg$sel_rec.TELEPHONE
       ,         cg$sel_rec.EMAIL_UBO
       ,         cg$sel_rec.EMAIL_PERSO
       ,cg$sel_rec.the_rowid
       FROM   ENSEIGNANT
       WHERE        NO_ENSEIGNANT = cg$sel_rec.NO_ENSEIGNANT;
    ELSE
       SELECT    NO_ENSEIGNANT
       ,         TYPE
       ,         SEXE
       ,         NOM
       ,         PRENOM
       ,         ADRESSE
       ,         CODE_POSTAL
       ,         VILLE
       ,         PAYS
       ,         MOBILE
       ,         TELEPHONE
       ,         EMAIL_UBO
       ,         EMAIL_PERSO
       , rowid
       INTO      cg$sel_rec.NO_ENSEIGNANT
       ,         cg$sel_rec.TYPE
       ,         cg$sel_rec.SEXE
       ,         cg$sel_rec.NOM
       ,         cg$sel_rec.PRENOM
       ,         cg$sel_rec.ADRESSE
       ,         cg$sel_rec.CODE_POSTAL
       ,         cg$sel_rec.VILLE
       ,         cg$sel_rec.PAYS
       ,         cg$sel_rec.MOBILE
       ,         cg$sel_rec.TELEPHONE
       ,         cg$sel_rec.EMAIL_UBO
       ,         cg$sel_rec.EMAIL_PERSO
       ,cg$sel_rec.the_rowid
       FROM   ENSEIGNANT
       WHERE  rowid = cg$sel_rec.the_rowid;
    END IF;

EXCEPTION WHEN OTHERS THEN
    cg$errors.push(SQLERRM,
                   'E',
                   'ORA',
                   SQLCODE,
                   'cg$ENSEIGNANT.slct.others');
    cg$errors.raise_failure;

END slct;


--------------------------------------------------------------------------------
-- Name:        cascade_update
--
-- Description: Updates all child tables affected by a change to ENSEIGNANT 
--
-- Parameters:  cg$rec     Record of ENSEIGNANT current values
--              cg$old_rec Record of ENSEIGNANT previous values
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
--              of each child table that references this tableENSEIGNANT 
--
-- Parameters:  cg$old_rec     Record of ENSEIGNANT current values
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
--              child table that references this table ENSEIGNANT 
--
-- Parameters:  cg$new_rec  New values for ENSEIGNANT's domain key constraint columns 
--              cg$new_ind  Indicates changed ENSEIGNANT's domain key constraint columns
--              cg$old_rec  Current values for ENSEIGNANT's domain key constraint columns
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
-- Description: Delete all child tables affected by a delete to ENSEIGNANT 
--
-- Parameters:  cg$rec     Record of ENSEIGNANT current values
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
--              child table that references this tableENSEIGNANT 
--
-- Parameters:  cg$old_rec     Record of ENSEIGNANT current values
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
--              of each child table that references this tableENSEIGNANT 
--
-- Parameters:  cg$old_rec     Record of ENSEIGNANT current values
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
-- Parameters:  cg$rec     Record of ENSEIGNANT current values
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
-- Parameters:  cg$rec     Record of ENSEIGNANT current values
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
    IF (cg$ind.TYPE AND cg$rec.TYPE IS NOT NULL) THEN
      FOR c IN (SELECT RV_LOW_VALUE, RV_HIGH_VALUE FROM CG_REF_CODES WHERE RV_DOMAIN = 'TYPE_ENSEIGNANT' )
      LOOP
         IF (    c.RV_HIGH_VALUE IS NULL 
             AND cg$rec.TYPE = c.RV_LOW_VALUE )
         OR (    c.RV_HIGH_VALUE IS NOT NULL
             AND cg$rec.TYPE BETWEEN c.RV_LOW_VALUE AND c.RV_HIGH_VALUE )
         THEN
           found := true;
           EXIT;
         END IF;
      END LOOP;

      IF ( NOT found ) THEN
        cg$errors.push( cg$errors.MsgGetText(cg$errors.API_RV_LOOKUP_FAIL,
                                             cg$errors.APIMSG_RV_LOOKUP_FAIL,
                                             cg$rec.TYPE,'ENSEIGNANT','TYPE'),
                        'E',
                        'API',
                        cg$errors.API_RV_LOOKUP_FAIL,
                        'cg$ENSEIGNANT.v_domain.no_data_found' );
        cg$errors.raise_failure;
      END IF;
    END IF;

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
                                             cg$rec.SEXE,'ENSEIGNANT','SEXE'),
                        'E',
                        'API',
                        cg$errors.API_RV_LOOKUP_FAIL,
                        'cg$ENSEIGNANT.v_domain.no_data_found' );
        cg$errors.raise_failure;
      END IF;
    END IF;






    found := false;
    IF (cg$ind.PAYS AND cg$rec.PAYS IS NOT NULL) THEN
      FOR c IN (SELECT RV_LOW_VALUE, RV_HIGH_VALUE FROM CG_REF_CODES WHERE RV_DOMAIN = 'PAYS' )
      LOOP
         IF (    c.RV_HIGH_VALUE IS NULL 
             AND cg$rec.PAYS = c.RV_LOW_VALUE )
         OR (    c.RV_HIGH_VALUE IS NOT NULL
             AND cg$rec.PAYS BETWEEN c.RV_LOW_VALUE AND c.RV_HIGH_VALUE )
         THEN
           found := true;
           EXIT;
         END IF;
      END LOOP;

      IF ( NOT found ) THEN
        cg$errors.push( cg$errors.MsgGetText(cg$errors.API_RV_LOOKUP_FAIL,
                                             cg$errors.APIMSG_RV_LOOKUP_FAIL,
                                             cg$rec.PAYS,'ENSEIGNANT','PAYS'),
                        'E',
                        'API',
                        cg$errors.API_RV_LOOKUP_FAIL,
                        'cg$ENSEIGNANT.v_domain.no_data_found' );
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
                                            'CG_REF_CODES','ENSEIGNANT'),
                       'E',
                       'API',
                       cg$errors.API_RV_TAB_NOT_FOUND,
                       'cg$ENSEIGNANT.v_domain.no_reftable_found');
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$ENSEIGNANT.v_domain.others');
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
    IF (con_name = 'ENS_PK') THEN
        cg$errors.push(nvl(ENS_PK 
                  ,cg$errors.MsgGetText(cg$errors.API_PK_CON_VIOLATED
					                 ,cg$errors.APIMSG_PK_VIOLAT
                                     ,'ENS_PK' 
                                     ,'ENSEIGNANT')),
                       'E',
                       'API',
                       cg$errors.API_PK_CON_VIOLATED,
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
-- Name:        insert_jn
--
-- Description: Insert a record into the journal table for auditing purposes
--
-- Parameters:  cg$rec    Record of row to be journalled
--              operation Type of action to be journalled for this record
--------------------------------------------------------------------------------
PROCEDURE insert_jn(cg$rec    IN cg$row_type,
                    operation IN VARCHAR2 DEFAULT 'INS') IS
BEGIN
    INSERT INTO ENSEIGNANT_JN
        (JN_OPERATION
        ,JN_ORACLE_USER
        ,JN_DATETIME
        ,JN_NOTES
        ,JN_APPLN
        ,JN_SESSION
        ,NO_ENSEIGNANT
        ,TYPE
        ,SEXE
        ,NOM
        ,PRENOM
        ,ADRESSE
        ,CODE_POSTAL
        ,VILLE
        ,PAYS
        ,MOBILE
        ,TELEPHONE
        ,EMAIL_UBO
        ,EMAIL_PERSO)
    VALUES
        (operation
        ,USER
        ,SYSDATE
        ,cg$rec.jn_notes
        ,'CG$ENSEIGNANT.'||operation
        ,userenv('sessionid')
        ,cg$rec.NO_ENSEIGNANT
        ,cg$rec.TYPE
        ,cg$rec.SEXE
        ,cg$rec.NOM
        ,cg$rec.PRENOM
        ,cg$rec.ADRESSE
        ,cg$rec.CODE_POSTAL
        ,cg$rec.VILLE
        ,cg$rec.PAYS
        ,cg$rec.MOBILE
        ,cg$rec.TELEPHONE
        ,cg$rec.EMAIL_UBO
        ,cg$rec.EMAIL_PERSO);
EXCEPTION
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                      'E',
                      'ORA',
                      SQLCODE,
                      'cg$ENSEIGNANT.insert_jn_'||operation||'.others');
        cg$errors.raise_failure;
END insert_jn;


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


BEGIN
--  Application_logic Pre-Insert <<Start>>
--  Application_logic Pre-Insert << End >>

--  Defaulted

--  Auto-generated and uppercased columns

    up_autogen_columns(cg$rec, cg$ind, 'INS', do_ins);

    called_from_package := TRUE;

    IF (do_ins) THEN 
        validate_foreign_keys_ins(cg$rec);
        validate_arc(cg$rec);
        validate_domain(cg$rec);

        INSERT INTO ENSEIGNANT
            (NO_ENSEIGNANT
            ,TYPE
            ,SEXE
            ,NOM
            ,PRENOM
            ,ADRESSE
            ,CODE_POSTAL
            ,VILLE
            ,PAYS
            ,MOBILE
            ,TELEPHONE
            ,EMAIL_UBO
            ,EMAIL_PERSO)
        VALUES
            (cg$rec.NO_ENSEIGNANT
            ,cg$rec.TYPE
            ,cg$rec.SEXE
            ,cg$rec.NOM
            ,cg$rec.PRENOM
            ,cg$rec.ADRESSE
            ,cg$rec.CODE_POSTAL
            ,cg$rec.VILLE
            ,cg$rec.PAYS
            ,cg$rec.MOBILE
            ,cg$rec.TELEPHONE
            ,cg$rec.EMAIL_UBO
            ,cg$rec.EMAIL_PERSO
);
        doLobs(cg$rec, cg$ind);
        slct(cg$rec);

        upd_oper_denorm2(cg$rec, cg$tmp_rec, cg$ind, 'INS');
    END IF;

    called_from_package := FALSE;


    insert_jn(cg$rec, 'INS');


--  Application logic Post-Insert <<Start>>
--  Application logic Post-Insert << End >>

EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.mandatory_missing THEN
        validate_mandatory(cg$rec, 'cg$ENSEIGNANT.ins.mandatory_missing');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$ENSEIGNANT.ins.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$ENSEIGNANT.ins.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$ENSEIGNANT.ins.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$ENSEIGNANT.ins.others');
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

 
    IF ( cg$pk.NO_ENSEIGNANT IS NULL ) THEN          
      cg$upd_rec.NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
    ELSE
      cg$upd_rec.NO_ENSEIGNANT := cg$pk.NO_ENSEIGNANT;
    END IF;
    cg$old_rec.NO_ENSEIGNANT := cg$upd_rec.NO_ENSEIGNANT;

    IF ( cg$pk.the_rowid IS NULL ) THEN             
      cg$upd_rec.the_rowid := cg$rec.the_rowid;
    ELSE
      cg$upd_rec.the_rowid := cg$pk.the_rowid;
    END IF;
    cg$old_rec.the_rowid := cg$upd_rec.the_rowid;

    IF ( do_upd ) THEN

        slct(cg$upd_rec);


        --  Report error if attempt to update non updateable Primary Key ENS_PK
        IF (cg$ind.NO_ENSEIGNANT AND cg$rec.NO_ENSEIGNANT != cg$upd_rec.NO_ENSEIGNANT) THEN
            raise_uk_not_updateable('ENS_PK');
        END IF;
        IF NOT (cg$ind.NO_ENSEIGNANT) THEN
            cg$rec.NO_ENSEIGNANT := cg$upd_rec.NO_ENSEIGNANT;
        END IF;
        IF NOT (cg$ind.TYPE) THEN
            cg$rec.TYPE := cg$upd_rec.TYPE;
        END IF;
        IF NOT (cg$ind.SEXE) THEN
            cg$rec.SEXE := cg$upd_rec.SEXE;
        END IF;
        IF NOT (cg$ind.NOM) THEN
            cg$rec.NOM := cg$upd_rec.NOM;
        END IF;
        IF NOT (cg$ind.PRENOM) THEN
            cg$rec.PRENOM := cg$upd_rec.PRENOM;
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
        IF NOT (cg$ind.PAYS) THEN
            cg$rec.PAYS := cg$upd_rec.PAYS;
        END IF;
        IF NOT (cg$ind.MOBILE) THEN
            cg$rec.MOBILE := cg$upd_rec.MOBILE;
        END IF;
        IF NOT (cg$ind.TELEPHONE) THEN
            cg$rec.TELEPHONE := cg$upd_rec.TELEPHONE;
        END IF;
        IF NOT (cg$ind.EMAIL_UBO) THEN
            cg$rec.EMAIL_UBO := cg$upd_rec.EMAIL_UBO;
        END IF;
        IF NOT (cg$ind.EMAIL_PERSO) THEN
            cg$rec.EMAIL_PERSO := cg$upd_rec.EMAIL_PERSO;
        END IF;
    ELSE
	     -- Perform checks if called from a trigger
	     -- Indicators are only set on changed values
	     null;
        --  Report error if attempt to update non updateable Primary Key ENS_PK
        IF ( cg$ind.NO_ENSEIGNANT ) THEN
          raise_uk_not_updateable('ENS_PK');
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
            UPDATE ENSEIGNANT
            SET
              TYPE = cg$rec.TYPE
              ,SEXE = cg$rec.SEXE
              ,NOM = cg$rec.NOM
              ,PRENOM = cg$rec.PRENOM
              ,ADRESSE = cg$rec.ADRESSE
              ,CODE_POSTAL = cg$rec.CODE_POSTAL
              ,VILLE = cg$rec.VILLE
              ,PAYS = cg$rec.PAYS
              ,MOBILE = cg$rec.MOBILE
              ,TELEPHONE = cg$rec.TELEPHONE
              ,EMAIL_UBO = cg$rec.EMAIL_UBO
              ,EMAIL_PERSO = cg$rec.EMAIL_PERSO
            WHERE  NO_ENSEIGNANT = cg$rec.NO_ENSEIGNANT;
            null;
          ELSE
            UPDATE ENSEIGNANT
            SET
              TYPE = cg$rec.TYPE
              ,SEXE = cg$rec.SEXE
              ,NOM = cg$rec.NOM
              ,PRENOM = cg$rec.PRENOM
              ,ADRESSE = cg$rec.ADRESSE
              ,CODE_POSTAL = cg$rec.CODE_POSTAL
              ,VILLE = cg$rec.VILLE
              ,PAYS = cg$rec.PAYS
              ,MOBILE = cg$rec.MOBILE
              ,TELEPHONE = cg$rec.TELEPHONE
              ,EMAIL_UBO = cg$rec.EMAIL_UBO
              ,EMAIL_PERSO = cg$rec.EMAIL_PERSO
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


    insert_jn(cg$rec, 'UPD');

    IF NOT (do_upd) THEN
        cg$table(idx).NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
        cg$tableind(idx).NO_ENSEIGNANT := cg$ind.NO_ENSEIGNANT;
        cg$table(idx).TYPE := cg$rec.TYPE;
        cg$tableind(idx).TYPE := cg$ind.TYPE;
        cg$table(idx).SEXE := cg$rec.SEXE;
        cg$tableind(idx).SEXE := cg$ind.SEXE;
        cg$table(idx).NOM := cg$rec.NOM;
        cg$tableind(idx).NOM := cg$ind.NOM;
        cg$table(idx).PRENOM := cg$rec.PRENOM;
        cg$tableind(idx).PRENOM := cg$ind.PRENOM;
        cg$table(idx).ADRESSE := cg$rec.ADRESSE;
        cg$tableind(idx).ADRESSE := cg$ind.ADRESSE;
        cg$table(idx).CODE_POSTAL := cg$rec.CODE_POSTAL;
        cg$tableind(idx).CODE_POSTAL := cg$ind.CODE_POSTAL;
        cg$table(idx).VILLE := cg$rec.VILLE;
        cg$tableind(idx).VILLE := cg$ind.VILLE;
        cg$table(idx).PAYS := cg$rec.PAYS;
        cg$tableind(idx).PAYS := cg$ind.PAYS;
        cg$table(idx).MOBILE := cg$rec.MOBILE;
        cg$tableind(idx).MOBILE := cg$ind.MOBILE;
        cg$table(idx).TELEPHONE := cg$rec.TELEPHONE;
        cg$tableind(idx).TELEPHONE := cg$ind.TELEPHONE;
        cg$table(idx).EMAIL_UBO := cg$rec.EMAIL_UBO;
        cg$tableind(idx).EMAIL_UBO := cg$ind.EMAIL_UBO;
        cg$table(idx).EMAIL_PERSO := cg$rec.EMAIL_PERSO;
        cg$tableind(idx).EMAIL_PERSO := cg$ind.EMAIL_PERSO;

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
        validate_mandatory(cg$rec, 'cg$ENSEIGNANT.upd.upd_mandatory_null');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$ENSEIGNANT.upd.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$ENSEIGNANT.upd.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$ENSEIGNANT.upd.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$ENSEIGNANT.upd.others');
        called_from_package := FALSE;
        cg$errors.raise_failure;
END upd;


----------------------------------------------------------------------------------------
-- Name:        domain_cascade_upd
--
-- Description: Update the Domain Constraint Key columns of ENSEIGNANT when the
--              Cascade Update rule is Cascades and the domain table has been
--              updated. Called from <Domain Table pkg>.domain_cascade_update().
--
-- Parameters:  cg$rec      New values for ENSEIGNANT's domain key constraint columns 
--              cg$ind      Indicates changed ENSEIGNANT's domain key constraint columns
--              cg$old_rec  Current values for ENSEIGNANT's domain key constraint columns
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
cg$tmp_rec cg$row_type;
BEGIN
--  Application_logic Pre-Delete <<Start>>
--  Application_logic Pre-Delete << End >>
    cg$tmp_rec.NO_ENSEIGNANT := cg$pk.NO_ENSEIGNANT;
    cg$tmp_rec.jn_notes := cg$pk.jn_notes;

--  Delete the record

    called_from_package := TRUE;

    IF (do_del) THEN
        DECLARE
           cg$rec cg$row_type;
           cg$old_rec cg$row_type;
           cg$ind cg$ind_type;
        BEGIN
           cg$rec.NO_ENSEIGNANT := cg$pk.NO_ENSEIGNANT;
           slct(cg$rec);

           validate_foreign_keys_del(cg$rec);
           validate_domain_cascade_delete(cg$rec);    

           IF cg$pk.the_rowid is null THEN
              DELETE ENSEIGNANT
              WHERE                    NO_ENSEIGNANT = cg$pk.NO_ENSEIGNANT;
           ELSE
              DELETE ENSEIGNANT
              WHERE  rowid = cg$pk.the_rowid;
           END IF;

           upd_oper_denorm2(cg$rec, cg$old_rec, cg$ind, 'DEL');
           cascade_delete(cg$rec);
           domain_cascade_delete(cg$rec);             
        END;
    END IF;

    called_from_package := FALSE;

    insert_jn(cg$tmp_rec, 'DEL');

--  Application_logic Post-Delete <<Start>>
--  Application_logic Post-Delete << End >>

EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.delete_restrict THEN
        err_msg(SQLERRM, cg$errors.ERR_DELETE_RESTRICT, 'cg$ENSEIGNANT.del.delete_restrict');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN no_data_found THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$ENSEIGNANT.del.no_data_found');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$ENSEIGNANT.del.others');
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
               SELECT       NO_ENSEIGNANT
               ,            TYPE
               ,            SEXE
               ,            NOM
               ,            PRENOM
               ,            ADRESSE
               ,            CODE_POSTAL
               ,            VILLE
               ,            PAYS
               ,            MOBILE
               ,            TELEPHONE
               ,            EMAIL_UBO
               ,            EMAIL_PERSO
               INTO         cg$tmp_rec.NO_ENSEIGNANT
               ,            cg$tmp_rec.TYPE
               ,            cg$tmp_rec.SEXE
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.ADRESSE
               ,            cg$tmp_rec.CODE_POSTAL
               ,            cg$tmp_rec.VILLE
               ,            cg$tmp_rec.PAYS
               ,            cg$tmp_rec.MOBILE
               ,            cg$tmp_rec.TELEPHONE
               ,            cg$tmp_rec.EMAIL_UBO
               ,            cg$tmp_rec.EMAIL_PERSO
               FROM      ENSEIGNANT
               WHERE              NO_ENSEIGNANT = cg$old_rec.NO_ENSEIGNANT
               FOR UPDATE NOWAIT;
            ELSE
               SELECT       NO_ENSEIGNANT
               ,            TYPE
               ,            SEXE
               ,            NOM
               ,            PRENOM
               ,            ADRESSE
               ,            CODE_POSTAL
               ,            VILLE
               ,            PAYS
               ,            MOBILE
               ,            TELEPHONE
               ,            EMAIL_UBO
               ,            EMAIL_PERSO
               INTO         cg$tmp_rec.NO_ENSEIGNANT
               ,            cg$tmp_rec.TYPE
               ,            cg$tmp_rec.SEXE
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.ADRESSE
               ,            cg$tmp_rec.CODE_POSTAL
               ,            cg$tmp_rec.VILLE
               ,            cg$tmp_rec.PAYS
               ,            cg$tmp_rec.MOBILE
               ,            cg$tmp_rec.TELEPHONE
               ,            cg$tmp_rec.EMAIL_UBO
               ,            cg$tmp_rec.EMAIL_PERSO
               FROM      ENSEIGNANT
               WHERE rowid = cg$old_rec.the_rowid
               FOR UPDATE NOWAIT;
            END IF;
        ELSE
            IF cg$old_rec.the_rowid is null THEN
               SELECT       NO_ENSEIGNANT
               ,            TYPE
               ,            SEXE
               ,            NOM
               ,            PRENOM
               ,            ADRESSE
               ,            CODE_POSTAL
               ,            VILLE
               ,            PAYS
               ,            MOBILE
               ,            TELEPHONE
               ,            EMAIL_UBO
               ,            EMAIL_PERSO
               INTO         cg$tmp_rec.NO_ENSEIGNANT
               ,            cg$tmp_rec.TYPE
               ,            cg$tmp_rec.SEXE
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.ADRESSE
               ,            cg$tmp_rec.CODE_POSTAL
               ,            cg$tmp_rec.VILLE
               ,            cg$tmp_rec.PAYS
               ,            cg$tmp_rec.MOBILE
               ,            cg$tmp_rec.TELEPHONE
               ,            cg$tmp_rec.EMAIL_UBO
               ,            cg$tmp_rec.EMAIL_PERSO
               FROM      ENSEIGNANT
               WHERE              NO_ENSEIGNANT = cg$old_rec.NO_ENSEIGNANT
               FOR UPDATE;
            ELSE
               SELECT       NO_ENSEIGNANT
               ,            TYPE
               ,            SEXE
               ,            NOM
               ,            PRENOM
               ,            ADRESSE
               ,            CODE_POSTAL
               ,            VILLE
               ,            PAYS
               ,            MOBILE
               ,            TELEPHONE
               ,            EMAIL_UBO
               ,            EMAIL_PERSO
               INTO         cg$tmp_rec.NO_ENSEIGNANT
               ,            cg$tmp_rec.TYPE
               ,            cg$tmp_rec.SEXE
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.ADRESSE
               ,            cg$tmp_rec.CODE_POSTAL
               ,            cg$tmp_rec.VILLE
               ,            cg$tmp_rec.PAYS
               ,            cg$tmp_rec.MOBILE
               ,            cg$tmp_rec.TELEPHONE
               ,            cg$tmp_rec.EMAIL_UBO
               ,            cg$tmp_rec.EMAIL_PERSO
               FROM      ENSEIGNANT
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
                           'cg$ENSEIGNANT.lck.resource_busy');
            cg$errors.raise_failure;
        WHEN no_data_found THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$ENSEIGNANT.lck.no_data_found');
            cg$errors.raise_failure;
        WHEN OTHERS THEN
            cg$errors.push(SQLERRM,
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$ENSEIGNANT.lck.others');
            cg$errors.raise_failure;
    END;

-- Optional Columns

    IF (cg$old_ind.TELEPHONE) THEN
        IF (cg$tmp_rec.TELEPHONE IS NOT NULL
        AND cg$old_rec.TELEPHONE IS NOT NULL) THEN
            IF (cg$tmp_rec.TELEPHONE NOT LIKE cg$old_rec.TELEPHONE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P100TELEPHONE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.TELEPHONE IS NOT NULL
        OR cg$old_rec.TELEPHONE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P100TELEPHONE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.EMAIL_PERSO) THEN
        IF (cg$tmp_rec.EMAIL_PERSO IS NOT NULL
        AND cg$old_rec.EMAIL_PERSO IS NOT NULL) THEN
            IF (cg$tmp_rec.EMAIL_PERSO NOT LIKE cg$old_rec.EMAIL_PERSO) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P140EMAIL_PERSO
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.EMAIL_PERSO IS NOT NULL
        OR cg$old_rec.EMAIL_PERSO IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P140EMAIL_PERSO
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;

-- Mandatory Columns

    IF (cg$old_ind.NO_ENSEIGNANT) THEN
        IF (cg$tmp_rec.NO_ENSEIGNANT != cg$old_rec.NO_ENSEIGNANT) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P10NO_ENSEIGNANT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.TYPE) THEN
        IF (cg$tmp_rec.TYPE != cg$old_rec.TYPE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P25TYPE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.SEXE) THEN
        IF (cg$tmp_rec.SEXE != cg$old_rec.SEXE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P30SEXE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NOM) THEN
        IF (cg$tmp_rec.NOM != cg$old_rec.NOM) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P40NOM
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.PRENOM) THEN
        IF (cg$tmp_rec.PRENOM != cg$old_rec.PRENOM) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50PRENOM
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ADRESSE) THEN
        IF (cg$tmp_rec.ADRESSE != cg$old_rec.ADRESSE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P60ADRESSE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.CODE_POSTAL) THEN
        IF (cg$tmp_rec.CODE_POSTAL != cg$old_rec.CODE_POSTAL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P70CODE_POSTAL
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.VILLE) THEN
        IF (cg$tmp_rec.VILLE != cg$old_rec.VILLE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P80VILLE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.PAYS) THEN
        IF (cg$tmp_rec.PAYS != cg$old_rec.PAYS) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P90PAYS
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.MOBILE) THEN
        IF (cg$tmp_rec.MOBILE != cg$old_rec.MOBILE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P95MOBILE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.EMAIL_UBO) THEN
        IF (cg$tmp_rec.EMAIL_UBO != cg$old_rec.EMAIL_UBO) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P130EMAIL_UBO
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
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
      cg$ind_true.NO_ENSEIGNANT := TRUE;
      cg$ind_true.TYPE := TRUE;
      cg$ind_true.SEXE := TRUE;
      cg$ind_true.NOM := TRUE;
      cg$ind_true.PRENOM := TRUE;
      cg$ind_true.ADRESSE := TRUE;
      cg$ind_true.CODE_POSTAL := TRUE;
      cg$ind_true.VILLE := TRUE;
      cg$ind_true.PAYS := TRUE;
      cg$ind_true.MOBILE := TRUE;
      cg$ind_true.TELEPHONE := TRUE;
      cg$ind_true.EMAIL_UBO := TRUE;
      cg$ind_true.EMAIL_PERSO := TRUE;
   

END cg$ENSEIGNANT;
/

