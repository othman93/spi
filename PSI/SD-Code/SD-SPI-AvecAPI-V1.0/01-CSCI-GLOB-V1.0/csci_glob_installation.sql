-- 
-- Script d'installation de l'article de configuration CSCI-GLOB
--	

-- Cr�ation des �l�ments DDL :  tables, vues, index, ...
@@01-CREATION\01-DDL\csci_glob_tab
@@01-CREATION\01-DDL\csci_glob_ind

-- Cr�ation du package CG$ERROS n�cessaire aux API de tabme
@@01-CREATION\03-PLSQL\cdsaper.PKS
@@01-CREATION\03-PLSQL\cdsaper.PKB
