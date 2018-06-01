



--
-- VHDL Architecture final_lab.mk_uu.uu
--
-- Created:
--          by - Y50-70.UNKNOWN (LENOVO)
--          at - 22:19:45 05/24/18
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2002.1a (Build 22)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;																					  

LIBRARY final_lab;
USE final_lab.in_states.all;
USE ieee.std_logic_unsigned.all;
ENTITY mk_uu IS
   PORT( 
      Comm_bus     : IN     std_logic_vector (7 DOWNTO 0);
      Data_bus     : IN     std_logic_vector (7 DOWNTO 0);
      clk          : IN     std_logic;
      comp         : IN     std_logic;
      rst          : IN     std_logic;
      A_Rd         : OUT    std_logic;
      A_Wr         : OUT    std_logic;
      Alu_Rd       : OUT    std_logic;
      E_Ram        : OUT    std_logic;
      E_Rom        : OUT    std_logic;
      PC_HL        : OUT    std_logic;
      PC_Rd        : OUT    std_logic;
      PC_Wr        : OUT    std_logic;
      PC_inc       : OUT    std_logic;
      PC_rst       : OUT    std_logic;
      PSW_Rd       : OUT    std_logic;
      PSW_Wr       : OUT    std_logic;
      Rd_Comm      : OUT    std_logic;
      Rw_Ram       : OUT    std_logic;
      Temp_Wr      : OUT    std_logic;
      Wr_Addr      : OUT    std_logic;
      Wr_Comm      : OUT    std_logic;
      alu_set      : OUT    st_alu;
      temp_mux_sel : OUT    std_logic:= '0'
   );

-- Declarations

END mk_uu ;

-- hds interface_end
ARCHITECTURE uu OF mk_uu IS

signal C, N : st_uu;

BEGIN
   process(clk, rst)
   begin
      if(rst = '1') then
         C <= rs1;
      elsif(clk'event and clk = '1') then
         C <= N;
      end if;
   end process;
   process(C)
   begin
       case C is
          when rs1 => PSW_Rd <= '0'; 
                      PSW_Wr <= '0'; 
                      A_Wr <= '0';
                      A_Rd <= '0'; 
                      Temp_Wr <= '0'; 
                      PC_HL <= '0';
                      PC_Rd <= '0'; 
                      PC_Wr <= '0'; 
                      PC_inc <= '0'; 
                      PC_rst <= '1'; 
                      E_RAM <= '0'; 
                      RW_RAM <= '0'; 
                      Wr_Addr <= '0';
                      E_ROM <= '1';
                      Wr_Comm <= '0'; 
                      Rd_Comm <= '0';
                      Alu_Rd <= '0';
                      N <= rs2;
          when rs2 => 
                      PC_rst <= '0';
                      Wr_Comm <= '1';
                      E_ROM <= '0';
                      N <= rs3;
          when rs3 => Wr_Comm <= '0';
                      N <= ex;
---------------------------------------------------------          
          when l_com_1 => 
		  			  temp_mux_sel <= '0';
                      PC_inc <= '1'; 
                      N <= l_com_2;
          when l_com_2 =>
                      PC_inc <= '0';
                      E_ROM <= '1'; 
                      N <= l_com_3;
          when l_com_3 => 
                      Wr_Comm <= '1';
                      E_ROM <= '0';
                      N <= l_com_4;
          when l_com_4 => 
                      Wr_Comm <= '0';
                      N <= ex;                                                    
-------------------------------------------------------------
          when mov_a_rn_1 => 
                      Rd_comm <= '1';       
                      N <= mov_a_rn_2;
          when mov_a_rn_2 =>
                      temp_wr <= '1';
                      N <= mov_a_rn_3;
          when mov_a_rn_3 =>
                      Rd_comm <= '0';
                      temp_wr <= '0';
                      alu_set <= Rn_addr;  
                      Alu_Rd <= '1';                                    
                      N <= mov_a_rn_4;
          when mov_a_rn_4 =>
                      Wr_Addr <= '1'; 
                      alu_set <= NOP;
                      Alu_Rd <= '0';
                      N <= mov_a_rn_5;
          when mov_a_rn_5 => 
                      Wr_Addr <= '0';
                      E_RAM <= '1';
                      RW_RAM <= '1';                      
                      N <= mov_a_rn_6;                                                                   
          when mov_a_rn_6 =>
                      E_RAM <= '0';
                      RW_RAM <= '0';
                      A_Wr <= '1';
                      N <= mov_a_rn_7;
          when mov_a_rn_7 =>
                      A_Wr <= '0';
                      N <= l_com_1;
---------------------------------------------------------------------                      
          when mov_rn_dir_0 => 
                      N <= mov_rn_dir_1;
          when mov_rn_dir_1 => 
                      Rd_comm <= '1';
                      N <= mov_rn_dir_2;
          when mov_rn_dir_2 =>
                      temp_wr <= '1';
                      N <= mov_rn_dir_3; 
          when mov_rn_dir_3 =>
                      Rd_comm <= '0';
                      temp_wr <= '0';                                                  
                      PC_inc <= '1'; 
                      N <= mov_rn_dir_4;
          when mov_rn_dir_4 => 
                      alu_set <= Rn_addr;             
                      PC_inc <= '0';
                      E_ROM <= '1';
                      N <= mov_rn_dir_5;  
          when mov_rn_dir_5 =>                   
                      Wr_addr <= '1'; 
                      N <= mov_rn_dir_6;                                                                     
          when mov_rn_dir_6 =>
                      alu_set <= NOP;
                      E_ROM <= '0';
                      Wr_addr <= '0'; 
                      temp_mux_sel <= '1';                              
                      E_RAM <= '1';
                      RW_RAM <= '1';
                      N <= mov_rn_dir_7;                                                                                           
          when mov_rn_dir_7 =>
                      temp_wr <= '1';            
                      N <= mov_rn_dir_8;  
          when mov_rn_dir_8 =>             
                      E_RAM <= '0';
                      RW_RAM <= '0';                                   
                      Alu_Rd <= '1';                      
                      N <= mov_rn_dir_9;                       
          when mov_rn_dir_9 =>
		  			  temp_wr <= '0';
                      Alu_set <= rep;
                      Wr_addr <= '1';
                      N <= mov_rn_dir_10;                      
          when mov_rn_dir_10 =>
		  			  temp_mux_sel <= '0';
                      Alu_set <= NOP;
                      
Wr_addr <= '0';
                      E_RAM <= '1';
                      RW_RAM <= '0';
                      N <= mov_rn_dir_11;                      
          when mov_rn_dir_11 =>
                      E_RAM <= '0';
                      Alu_Rd <= '0'; 
                      N <= l_com_1;
 ---------------------------------------------------------------------                                            
           when cjne_A_direct_1 => 
                      PC_inc <= '1'; --                     
                      N <= cjne_A_direct_2;
          when cjne_A_direct_2 =>
                      PC_inc <= '0';
                      E_ROM <= '1';
                      N <= cjne_A_direct_3;
          when cjne_A_direct_3 =>
                      Wr_addr <= '1';                                  
                      N <= cjne_A_direct_4; 
          when cjne_A_direct_4 =>
                      Wr_addr <= '0'; 
                      E_ROM <= '0';
                      E_RAM <= '1';
                      RW_RAM <= '1';
					  
                      N <= cjne_A_direct_5; 
          when cjne_A_direct_5 =>
		  			  RW_RAM <= '0';
                      temp_wr <= '1';
					  temp_mux_sel <= '1';
                      N <= cjne_A_direct_6;
          when cjne_A_direct_6 =>
                      E_RAM <= '0';
                      N <= cjne_A_direct_7;
          when cjne_A_direct_7 => 
		  			  temp_wr <= '0';
                      PC_inc <= '1';
                      if(comp = '1') then
                        N <= l_com_1;
                      elsif(comp = '0') then
                        N <= cjne_A_direct_8; 
                      end if;  
          when cjne_A_direct_8 => 
					  if(comp = '1') then
                        N <= l_com_1;
  				      else  
                      PC_inc <= '0';  
                      E_ROM <= '1';                      
                      N <= cjne_A_direct_9;
                      end if;                                              
          when cjne_A_direct_9 =>
                                            
                      N <= cjne_A_direct_10;
          when cjne_A_direct_10 =>
                      E_ROM <= '0';
                      if(comp = '1') then
                        N <= l_com_1;
          			  else
                      temp_wr <= '1';
					  PC_HL<= '0';
					  PC_Rd<= '1';
                      N <= cjne_A_direct_11;
                      end if;                                         
          when cjne_A_direct_11 =>
		  			  temp_wr <= '0'; 
                      A_wr <= '1';
                      N <= cjne_A_direct_12;                      
          when cjne_A_direct_12 =>
                      
					  PC_Rd<= '0';                     
                      A_wr <= '0';
                      Alu_set <= s_add;
                      Alu_rd <= '1';
                      N <= cjne_A_direct_13;                                                                    
          when cjne_A_direct_13 =>
                      PC_Wr <= '1';
                      N <= cjne_A_direct_14;
          when cjne_A_direct_14 =>
                      Alu_set <= NOP;
                      PC_Wr <= '0';
                      Alu_rd <= '0';  
                      temp_mux_sel <= '0';
                      N <= l_com_1;                     
 ---------------------------------------------------------------------                                                         
          when ex => if(Comm_bus(7 downto 3) = "11101") then
                        N <= mov_a_rn_1;
                     elsif(Comm_bus(7 downto 3) = "10101") then
                        N <= mov_rn_dir_0;
                     elsif(Comm_bus = "10110101") then
                        N <= cjne_A_direct_1;
                     else
                        N <= l_com_1;
                     end if;     
          when others => NULL;
       end case;
   end process; 

END uu;