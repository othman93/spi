
PROMPT Creating API Package Specification for Table 'CANDIDAT'
--------------------------------------------------------------------------------
-- Name:        cg$CANDIDAT
-- Description: CANDIDAT table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$CANDIDAT IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
CAN_PK CONSTANT VARCHAR2(240) := '';
CAN_PRO_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P15CODE_FORMATION CONSTANT VARCHAR2(240) := 'Code Formation';
P20ANNEE_UNIVERSITAIRE CONSTANT VARCHAR2(240) := 'Pro Annee Pro';
P30NO_CANDIDAT CONSTANT VARCHAR2(240) := 'No Etudiant Nat';
P40NOM CONSTANT VARCHAR2(240) := 'Nom';
P50PRENOM CONSTANT VARCHAR2(240) := 'Prenom';
P55SEXE CONSTANT VARCHAR2(240) := 'Sexe';
P60DATE_NAISSANCE CONSTANT VARCHAR2(240) := 'Date Naissance';
P70LIEU_NAISSANCE CONSTANT VARCHAR2(240) := 'Lieu Naissance';
P90NATIONALITE CONSTANT VARCHAR2(240) := 'Nationalite';
P100TELEPHONE CONSTANT VARCHAR2(240) := 'Tel Fixe';
P110MOBILE CONSTANT VARCHAR2(240) := 'Tel Port';
P120EMAIL CONSTANT VARCHAR2(240) := 'Email';
P170ADRESSE CONSTANT VARCHAR2(240) := 'Perm Adresse';
P180CODE_POSTAL CONSTANT VARCHAR2(240) := 'Perm Cp';
P190VILLE CONSTANT VARCHAR2(240) := 'Perm Ville';
P200PAYS_ORIGINE CONSTANT VARCHAR2(240) := 'Perm Pays';
P225UNIVERSITE_ORIGINE CONSTANT VARCHAR2(240) := 'Universite';
P230LISTE_SELECTION CONSTANT VARCHAR2(240) := 'Selection Origine';
P250SELECTION_NO_ORDRE CONSTANT VARCHAR2(240) := 'No Ordre';
P270CONFIRMATION_CANDIDAT CONSTANT VARCHAR2(240) := 'Reponse Can';
P280DATE_REPONSE_CANDIDAT CONSTANT VARCHAR2(240) := 'Date Reponse Can';

cg$row CANDIDAT%ROWTYPE;

--  CANDIDAT row type variable 
TYPE cg$row_type IS RECORD
(CODE_FORMATION cg$row.CODE_FORMATION%TYPE
,ANNEE_UNIVERSITAIRE cg$row.ANNEE_UNIVERSITAIRE%TYPE
,NO_CANDIDAT cg$row.NO_CANDIDAT%TYPE
,NOM cg$row.NOM%TYPE
,PRENOM cg$row.PRENOM%TYPE
,SEXE cg$row.SEXE%TYPE
,DATE_NAISSANCE cg$row.DATE_NAISSANCE%TYPE
,LIEU_NAISSANCE cg$row.LIEU_NAISSANCE%TYPE
,NATIONALITE cg$row.NATIONALITE%TYPE
,TELEPHONE cg$row.TELEPHONE%TYPE
,MOBILE cg$row.MOBILE%TYPE
,EMAIL cg$row.EMAIL%TYPE
,ADRESSE cg$row.ADRESSE%TYPE
,CODE_POSTAL cg$row.CODE_POSTAL%TYPE
,VILLE cg$row.VILLE%TYPE
,PAYS_ORIGINE cg$row.PAYS_ORIGINE%TYPE
,UNIVERSITE_ORIGINE cg$row.UNIVERSITE_ORIGINE%TYPE
,LISTE_SELECTION cg$row.LISTE_SELECTION%TYPE
,SELECTION_NO_ORDRE cg$row.SELECTION_NO_ORDRE%TYPE
,CONFIRMATION_CANDIDAT cg$row.CONFIRMATION_CANDIDAT%TYPE
,DATE_REPONSE_CANDIDAT cg$row.DATE_REPONSE_CANDIDAT%TYPE
,the_rowid ROWID)
;

--  CANDIDAT indicator type variable
TYPE cg$ind_type IS RECORD
(CODE_FORMATION BOOLEAN DEFAULT FALSE
,ANNEE_UNIVERSITAIRE BOOLEAN DEFAULT FALSE
,NO_CANDIDAT BOOLEAN DEFAULT FALSE
,NOM BOOLEAN DEFAULT FALSE
,PRENOM BOOLEAN DEFAULT FALSE
,SEXE BOOLEAN DEFAULT FALSE
,DATE_NAISSANCE BOOLEAN DEFAULT FALSE
,LIEU_NAISSANCE BOOLEAN DEFAULT FALSE
,NATIONALITE BOOLEAN DEFAULT FALSE
,TELEPHONE BOOLEAN DEFAULT FALSE
,MOBILE BOOLEAN DEFAULT FALSE
,EMAIL BOOLEAN DEFAULT FALSE
,ADRESSE BOOLEAN DEFAULT FALSE
,CODE_POSTAL BOOLEAN DEFAULT FALSE
,VILLE BOOLEAN DEFAULT FALSE
,PAYS_ORIGINE BOOLEAN DEFAULT FALSE
,UNIVERSITE_ORIGINE BOOLEAN DEFAULT FALSE
,LISTE_SELECTION BOOLEAN DEFAULT FALSE
,SELECTION_NO_ORDRE BOOLEAN DEFAULT FALSE
,CONFIRMATION_CANDIDAT BOOLEAN DEFAULT FALSE
,DATE_REPONSE_CANDIDAT BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  CANDIDAT primary key type variable
TYPE cg$pk_type IS RECORD
(CODE_FORMATION cg$row.CODE_FORMATION%TYPE
,ANNEE_UNIVERSITAIRE cg$row.ANNEE_UNIVERSITAIRE%TYPE
,NO_CANDIDAT cg$row.NO_CANDIDAT%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers              

TYPE cg$tab_row_type IS RECORD 
(CODE_FORMATION CANDIDAT.CODE_FORMATION%TYPE
,ANNEE_UNIVERSITAIRE CANDIDAT.ANNEE_UNIVERSITAIRE%TYPE
,NO_CANDIDAT CANDIDAT.NO_CANDIDAT%TYPE
,NOM CANDIDAT.NOM%TYPE
,PRENOM CANDIDAT.PRENOM%TYPE
,SEXE CANDIDAT.SEXE%TYPE
,DATE_NAISSANCE CANDIDAT.DATE_NAISSANCE%TYPE
,LIEU_NAISSANCE CANDIDAT.LIEU_NAISSANCE%TYPE
,NATIONALITE CANDIDAT.NATIONALITE%TYPE
,TELEPHONE CANDIDAT.TELEPHONE%TYPE
,MOBILE CANDIDAT.MOBILE%TYPE
,EMAIL CANDIDAT.EMAIL%TYPE
,ADRESSE CANDIDAT.ADRESSE%TYPE
,CODE_POSTAL CANDIDAT.CODE_POSTAL%TYPE
,VILLE CANDIDAT.VILLE%TYPE
,PAYS_ORIGINE CANDIDAT.PAYS_ORIGINE%TYPE
,UNIVERSITE_ORIGINE CANDIDAT.UNIVERSITE_ORIGINE%TYPE
,LISTE_SELECTION CANDIDAT.LISTE_SELECTION%TYPE
,SELECTION_NO_ORDRE CANDIDAT.SELECTION_NO_ORDRE%TYPE
,CONFIRMATION_CANDIDAT CANDIDAT.CONFIRMATION_CANDIDAT%TYPE
,DATE_REPONSE_CANDIDAT CANDIDAT.DATE_REPONSE_CANDIDAT%TYPE
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
END cg$CANDIDAT;
/

