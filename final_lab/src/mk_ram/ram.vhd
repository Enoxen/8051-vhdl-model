-- hds header_start
--
-- VHDL Architecture final_lab.mk_ram.ram
--
-- Created:
--          by - Y50-70.UNKNOWN (LENOVO)
--          at - 23:11:58 05/23/18
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2002.1a (Build 22)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_textio.all;

ENTITY mk_ram IS
   PORT( 
      addr : IN     std_logic_vector (7 DOWNTO 0);
      clk  : IN     std_logic;
      en   : IN     std_logic;
      rw   : IN     std_logic;
      data : INOUT  std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END mk_ram ;

-- hds interface_end
ARCHITECTURE ram OF mk_ram IS

subtype Word is std_logic_vector(7 downto 0);
  type Memory is array (0 to 255) of Word;
  signal RAM256 : Memory :=(
			0 => "00001101",
			1 => "11001010",
			2 => "00010111",
			3 => "11001101",
			4 => "11001010",
			5 => "00011010",
			6 => "01110100",
			7 => "11100111",
			8 => "11010100",
			9 => "10111010",
			22 => "00000110",
			others => "01010101");

BEGIN

process (clk) is
    begin
      if clk = '1' and clk'event then  
        if(en = '1') then
            if(Conv_Integer(addr) < 255) then
               if(rw = '1') then
                  data <= RAM256(Conv_Integer(addr));
               elsif(rw = '0') then
                  RAM256(Conv_Integer(addr)) <= data;
               end if;
            end if;
        elsif(en = '0') then
            data <= (others => 'Z');
        end if;
      end if;
    end process;

END ram;
