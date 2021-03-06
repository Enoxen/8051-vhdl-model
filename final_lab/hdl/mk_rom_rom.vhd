-- hds header_start
--
-- VHDL Architecture final_lab.mk_rom.rom
--
-- Created:
--          by - Y50-70.UNKNOWN (LENOVO)
--          at - 23:00:37 05/23/18
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2002.1a (Build 22)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY final_lab;
USE final_lab.in_states.all;
LIBRARY std;
USE std.textio.all;
USE ieee.std_logic_textio.all;
USE ieee.std_logic_unsigned.all;

ENTITY mk_rom IS
   PORT( 
      addr : IN     std_logic_vector (15 DOWNTO 0);
      clk  : IN     std_logic;
      en   : IN     std_logic;
      data : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END mk_rom ;

-- hds interface_end
ARCHITECTURE rom OF mk_rom IS

subtype Word is std_logic_vector(7 downto 0);
  type Memory is array (0 to 2**12-1) of Word;
  signal ROM : Memory := (others => (others => '0'));

function INIT_ROM return MEMORY is 
  file initfile : text open read_mode is "C:\Users\Y50-70\Desktop\lab7\ROM.txt";
  variable fline : line;
  variable ROM : MEMORY := (others => (others => '0'));
  BEGIN
    for i in 0 to 2**12-1 loop
      if( not endfile(initfile)) then
        readline(initfile, fline) ;
        read (fline, ROM(i));
      end if;
    end loop;
  return ROM;
end INIT_ROM;
  
BEGIN

process (clk) is
    variable startup : boolean := true;
    begin
      if startup then
        ROM <= INIT_ROM;
      end if;
      if clk = '1' and clk'event then  
        if(en = '1') then
            if(Conv_Integer(addr(11 downto 0)) < 2**12-1) then
              Data <= ROM(Conv_Integer(addr(11 downto 0)));
            end if;
        elsif(en = '0') then
            data <= (others => 'Z');
        end if;
      end if;
    end process;

END rom;
