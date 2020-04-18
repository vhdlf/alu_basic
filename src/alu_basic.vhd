library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity alu_basic is
port (
  clk:  in  std_logic;
  cmd:  in  unsigned (3 downto 0);
  in0:  in  unsigned (7 downto 0);
  in1:  in  unsigned (7 downto 0);
  out0: out unsigned (7 downto 0)
);
end alu_basic;



architecture bh of alu_basic is
begin
  p1: process (clk)
  begin
    if rising_edge(clk) then
      case cmd is
        when "0000" => -- add
          out0 <= in0 + in1;
        
        when "0001" => -- sub
          out0 <= in0 - in1;
        
        when "0010" =>
          out0 <= resize(in0 * in1, 8);
        
        when "0011" =>
          out0 <= in0 / in1;
        
        when others =>
          null;
      end case;
    end if;
  end process;
end bh;
