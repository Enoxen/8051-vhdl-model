-- hds header_start
--
-- VHDL Entity final_lab.mk_51a_tb.symbol
--
-- Created:
--          by - Y50-70.UNKNOWN (LENOVO)
--          at - 01:31:13 05/25/18
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2002.1a (Build 22)
--
-- hds header_end


ENTITY mk_51a_tb IS
-- Declarations

END mk_51a_tb ;

-- hds interface_end
--
-- VHDL Architecture final_lab.mk_51a_tb.struct
--
-- Created:
--          by - Y50-70.UNKNOWN (LENOVO)
--          at - 01:31:13 05/25/18
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2002.1a (Build 22)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


LIBRARY final_lab;

ARCHITECTURE struct OF mk_51a_tb IS

   -- Architecture declarations


   -- Component Declarations
   COMPONENT mk_51a
   END COMPONENT;
   COMPONENT mk_51a_tester
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : mk_51a USE ENTITY final_lab.mk_51a(struct);
   FOR ALL : mk_51a_tester USE ENTITY final_lab.mk_51a_tester;
   -- pragma synthesis_on


BEGIN
   -- Instance port mappings.
   I0 : mk_51a;
   I1 : mk_51a_tester;

END struct;