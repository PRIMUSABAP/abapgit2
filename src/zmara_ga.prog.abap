*&---------------------------------------------------------------------*
*& Report ZMARA_GA
*&---------------------------------------------------------------------*
*&Display Material details
*&---------------------------------------------------------------------*
REPORT ZMARA_GA.
*Tables: MARA,MARC.
****Declaration****
TYPES: BEGIN OF TY_MARA,
        MANDT TYPE MARA-MANDT,
        MATNR TYPE MARA-MATNR,
        ERSDA TYPE MARA-ERSDA,
        MTART TYPE MARA-MTART,
        MATKL TYPE MARA-MATKL,
        MEINS TYPE MARA-MEINS,

      END OF TY_MARA.
TYPES: BEGIN OF TY_MARC,
        MATNR TYPE MARC-MATNR,
        WERKS TYPE MARC-WERKS,
        XCHAR TYPE MARC-XCHAR,
        EKGRP TYPE MARC-EKGRP,
        DISMM TYPE MARC-DISMM,
      END OF TY_MARC.

* **DATA FETCHING **
DATA: IT_MARA TYPE TABLE OF TY_MARA,   "Internal Table Declaration
      WA_MARA TYPE TY_MARA,            "Work Area Declaration
      IT_MARC TYPE TABLE OF TY_MARC,
      WA_MARC TYPE TY_MARC.

*  SELECTION sCREEN
 SELECTION-SCREEN: BEGIN OF BLOCK A WITH FRAME TITLE TEXT-001.   " Output Screen Title text declaration
 PARAMETERS: P_WERKS TYPE WERKS_D.                               " Parameter declaration

 SELECT-OPTIONS: S_MATNR FOR WA_MARA-MATNR.                      "Set Options declaration
 SELECTION-SCREEN: END OF BLOCK A.

 START-OF-SELECTION.
"User Materials column fetching
 SELECT MANDT
        MATNR
        ERSDA
        MTART
        MATKL
        MEINS
   FROM MARA
   INTO TABLE IT_MARA
   WHERE MATNR IN S_MATNR.                          "ONLY INPUT MATERIAL FETCH --If Using IN: sign, Option,Low, High

   IF IT_MARA[] is not INITIAL.                                   "for All Entries available
  SELECT MATNR
         WERKS
         XCHAR
         EKGRP
         DISMM
    FROM MARC
    INTO TABLE IT_MARC
    FOR ALL ENTRIES IN IT_MARA
    WHERE MATNR = IT_MARA-MATNR
    AND WERKS = P_WERKS.
ELSE.

  MESSAGE 'Record not Found' TYPE 'E'.
    ENDIF.
    BREAK-POINT.
