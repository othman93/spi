
PROMPT Creating API Package Specification for Table 'ENSEIGNANT'
--------------------------------------------------------------------------------
-- Name:        cg$ENSEIGNANT
-- Description: ENSEIGNANT table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$ENSEIGNANT IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
ENS_PK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P10NO_ENSEIGNANT CONSTANT VARCHAR2(240) := 'No Enseignant';
P25TYPE CONSTANT VARCHAR2(240) := 'Type';
P30SEXE CONSTANT VARCHAR2(240) := 'Sexe';
P40NOM CONSTANT VARCHAR2(240) := 'Nom';
P50PRENOM CONSTANT VARCHAR2(240) := 'Prenom';
P60ADRESSE CONSTANT VARCHAR2(240) := 'Adresse';
P70CODE_POSTAL CONSTANT VARCHAR2(240) := 'Cp';
P80VILLE CONSTANT VARCHAR2(240) := 'Ville';
P90PAYS CONSTANT VARCHAR2(240) := 'Pays';
P95MOBILE CONSTANT VARCHAR2(240) := 'Enc Perso Tel';
P100TELEPHONE CONSTANT VARCHAR2(240) := 'Tel Port';
P130EMAIL_UBO CONSTANT VARCHAR2(240) := 'Enc Perso Email';
P140EMAIL_PERSO CONSTANT VARCHAR2(240) := 'Enc Ubo Email';

cg$row ENSEIGNANT%ROWTYPE;

--  ENSEIGNANT row type variable 
TYPE cg$row_type IS RECORD
(NO_ENSEIGNANT cg$row.NO_ENSEIGNANT%TYPE
,TYPE cg$row.TYPE%TYPE
,SEXE cg$row.SEXE%TYPE
,NOM cg$row.NOM%TYPE
,PRENOM cg$row.PRENOM%TYPE
,ADRESSE cg$row.ADRESSE%TYPE
,CODE_POSTAL cg$row.CODE_POSTAL%TYPE
,VILLE cg$row.VILLE%TYPE
,PAYS cg$row.PAYS%TYPE
,MOBILE cg$row.MOBILE%TYPE
,TELEPHONE cg$row.TELEPHONE%TYPE
,EMAIL_UBO cg$row.EMAIL_UBO%TYPE
,EMAIL_PERSO cg$row.EMAIL_PERSO%TYPE
,the_rowid ROWID
,JN_NOTES VARCHAR2(240))
;

--  ENSEIGNANT indicator type variable
TYPE cg$ind_type IS RECORD
(NO_ENSEIGNANT BOOLEAN DEFAULT FALSE
,TYPE BOOLEAN DEFAULT FALSE
,SEXE BOOLEAN DEFAULT FALSE
,NOM BOOLEAN DEFAULT FALSE
,PRENOM BOOLEAN DEFAULT FALSE
,ADRESSE BOOLEAN DEFAULT FALSE
,CODE_POSTAL BOOLEAN DEFAULT FALSE
,VILLE BOOLEAN DEFAULT FALSE
,PAYS BOOLEAN DEFAULT FALSE
,MOBILE BOOLEAN DEFAULT FALSE
,TELEPHONE BOOLEAN DEFAULT FALSE
,EMAIL_UBO BOOLEAN DEFAULT FALSE
,EMAIL_PERSO BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  ENSEIGNANT primary key type variable
TYPE cg$pk_type IS RECORD
(NO_ENSEIGNANT cg$row.NO_ENSEIGNANT%TYPE
,the_rowid ROWID
,JN_NOTES VARCHAR2(240))
;

--  PL/SQL Table Type variable for triggers              

TYPE cg$tab_row_type IS RECORD 
(NO_ENSEIGNANT ENSEIGNANT.NO_ENSEIGNANT%TYPE
,TYPE ENSEIGNANT.TYPE%TYPE
,SEXE ENSEIGNANT.SEXE%TYPE
,NOM ENSEIGNANT.NOM%TYPE
,PRENOM ENSEIGNANT.PRENOM%TYPE
,ADRESSE ENSEIGNANT.ADRESSE%TYPE
,CODE_POSTAL ENSEIGNANT.CODE_POSTAL%TYPE
,VILLE ENSEIGNANT.VILLE%TYPE
,PAYS ENSEIGNANT.PAYS%TYPE
,MOBILE ENSEIGNANT.MOBILE%TYPE
,TELEPHONE ENSEIGNANT.TELEPHONE%TYPE
,EMAIL_UBO ENSEIGNANT.EMAIL_UBO%TYPE
,EMAIL_PERSO ENSEIGNANT.EMAIL_PERSO%TYPE
,action_performed VARCHAR2(4)
) ;


TYPE cg$table_type IS TABLE OF cg$tab_row_type
INDEX BY BINARY_INTEGER;

cg$table cg$table_type;

TYPE cg$tableind_type IS TABLE OF cg$ind_type
     INDEX BY BINARY_INTEGER;
cg$tableind cg$tableind_type;
idx BINARY_INTEGER := 1;

PROCEDURE   ins(cg$rec IN OUT cg$row_type,
                cg$ind IN OUT cg$ind_type,
                do_ins IN BOOLEAN DEFAULT TRUE
               );
PROCEDURE   upd(cg$rec             IN OUT cg$row_type,
                cg$ind             IN OUT cg$ind_type,
                do_upd             IN BOOLEAN     DEFAULT TRUE,
                cg$pk              IN cg$row_type DEFAULT NULL      
               );
PROCEDURE   del(cg$pk  IN cg$pk_type,
                do_del IN BOOLEAN DEFAULT TRUE
               );
PROCEDURE   lck(cg$old_rec  IN cg$row_type,
                cg$old_ind  IN cg$ind_type,
                nowait_flag IN BOOLEAN DEFAULT TRUE
               );
PROCEDURE   insert_jn(cg$rec    IN cg$row_type,
                      operation IN VARCHAR2 DEFAULT 'INS'
                     );
PROCEDURE   slct(cg$sel_rec IN OUT cg$row_type);

PROCEDURE   validate_arc(cg$rec IN OUT cg$row_type);

PROCEDURE   validate_domain(cg$rec IN OUT cg$row_type,
                            cg$ind IN cg$ind_type DEFAULT cg$ind_true);

PROCEDURE   validate_foreign_keys_ins(cg$rec IN cg$row_type);
PROCEDURE   validate_foreign_keys_upd(cg$rec IN cg$row_type, 
                                      cg$old_rec IN cg$row_type, 
                                      cg$ind IN cg$ind_type);
PROCEDURE   validate_foreign_keys_del(cg$rec IN cg$row_type);

PROCEDURE   validate_domain_cascade_delete(cg$old_rec IN cg$row_type);        
PROCEDURE   validate_domain_cascade_update(cg$old_rec IN cg$row_type);        

PROCEDURE   cascade_update(cg$new_rec IN OUT cg$row_type,
                           cg$old_rec IN cg$row_type );
PROCEDURE   domain_cascade_update(cg$new_rec IN OUT cg$row_type,              
                                  cg$new_ind IN OUT cg$ind_type,
                                  cg$old_rec IN     cg$row_type);
PROCEDURE   domain_cascade_upd( cg$rec     IN OUT cg$row_type,                
                                cg$ind     IN OUT cg$ind_type,
                                cg$old_rec IN     cg$row_type);

PROCEDURE   cascade_delete(cg$old_rec IN OUT cg$row_type);
PROCEDURE   domain_cascade_delete(cg$old_rec IN cg$row_type);

PROCEDURE   upd_denorm2( cg$rec IN cg$row_type,
                         cg$ind IN cg$ind_type );
PROCEDURE   upd_oper_denorm2( cg$rec IN cg$row_type,
                              cg$old_rec IN cg$row_type,
                              cg$ind IN cg$ind_type,
                              operation IN VARCHAR2 DEFAULT 'UPD' );
END cg$ENSEIGNANT;
/

