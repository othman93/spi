-- 
-- Script d'installation de l'article de configuration CSCI-ADM
--	

-- Cr�ation des �l�ments DDL :  tables, vues, index, ...
@@01-CREATION\01-DDL\csci_adm_tab
@@01-CREATION\01-DDL\csci_adm_jn
@@01-CREATION\01-DDL\csci_adm_vw
@@01-CREATION\01-DDL\csci_adm_pk
@@01-CREATION\01-DDL\csci_adm_fk
@@01-CREATION\01-DDL\csci_adm_ck
@@01-CREATION\01-DDL\csci_adm_ind
@@01-CREATION\01-DDL\csci_adm_avt
@@01-CREATION\01-DDL\csci_adm_seq

-- Cr�ation de l'API de la table ENSEIGNANT
@@01-CREATION\02-API\ENS.pks
@@01-CREATION\02-API\ENS.pkb
@@01-CREATION\02-API\ENS.trg

-- Cr�ation de l'API de la table CANDIDAT
@@01-CREATION\02-API\CAN.pks
@@01-CREATION\02-API\CAN.pkb
@@01-CREATION\02-API\CAN.trg

-- Cr�ation du jeu d'essai
@@02-JEU-ESSAI\formation
@@02-JEU-ESSAI\enseignant
@@02-JEU-ESSAI\unite_enseignement
@@02-JEU-ESSAI\element_constitutif
@@02-JEU-ESSAI\promotion
@@02-JEU-ESSAI\candidat
@@02-JEU-ESSAI\etudiant

commit;





