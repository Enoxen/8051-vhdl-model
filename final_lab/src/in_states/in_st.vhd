--
-- VHDL Package Body final_lab.in_states
--
-- Created:
--          by - Y50-70.UNKNOWN (LENOVO)
--          at - 22:39:50 05/24/18
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2002.1a (Build 22)
--
PACKAGE BODY in_states IS
function f (A ,B   : IN     std_logic_vector (7 DOWNTO 0)) return std_logic_vector is
variable reg : std_logic_vector (7 DOWNTO 0);
begin   
    if B(7) = '0' then
      reg:=std_logic_vector(to_signed(to_integer(signed(A))+(to_integer(signed(B(6 downto 0)))),8));
    elsif B(7) = '1' then
      reg:=std_logic_vector(to_signed(to_integer(signed(A))+(to_integer(signed(B(7 downto 0)))),8));
    end if;
    return reg;
end f;
END in_states;
