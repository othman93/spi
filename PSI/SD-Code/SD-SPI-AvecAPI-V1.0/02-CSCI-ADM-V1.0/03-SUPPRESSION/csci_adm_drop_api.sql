-- 
-- Script de suppression des API de table du CSCI-ADM
-- Ph. Saliou 
--
PROMPT Suppression API de table ENSEIGNANT
drop package CG$ENSEIGNANT;
drop trigger CG$ADS_ENSEIGNANT;
drop trigger CG$AIS_ENSEIGNANT;
drop trigger CG$AUS_ENSEIGNANT;
drop trigger CG$BDR_ENSEIGNANT;
drop trigger CG$BDS_ENSEIGNANT;
drop trigger CG$BIR_ENSEIGNANT;
drop trigger CG$BIS_ENSEIGNANT;
drop trigger CG$BUR_ENSEIGNANT;
drop trigger CG$BUS_ENSEIGNANT;


PROMPT Suppression API de table CANDIDAT
drop package CG$CANDIDAT;
drop trigger CG$ADS_CANDIDAT;
drop trigger CG$AIS_CANDIDAT;
drop trigger CG$AUS_CANDIDAT;
drop trigger CG$BDR_CANDIDAT;
drop trigger CG$BDS_CANDIDAT;
drop trigger CG$BIR_CANDIDAT;
drop trigger CG$BIS_CANDIDAT;
drop trigger CG$BUR_CANDIDAT;
drop trigger CG$BUS_CANDIDAT;

