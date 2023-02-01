*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZEMP_1..........................................*
TABLES: ZEMP_1, *ZEMP_1. "view work areas
CONTROLS: TCTRL_ZEMP_1
TYPE TABLEVIEW USING SCREEN '0001'.
DATA: BEGIN OF STATUS_ZEMP_1. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_ZEMP_1.
* Table for entries selected to show on screen
DATA: BEGIN OF ZEMP_1_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE ZEMP_1.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZEMP_1_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF ZEMP_1_TOTAL OCCURS 0010.
INCLUDE STRUCTURE ZEMP_1.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZEMP_1_TOTAL.

*.........table declarations:.................................*
TABLES: ZEDU                           .
TABLES: ZEMPLOYEE1                     .
