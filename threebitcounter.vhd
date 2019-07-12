---------------------------------------------------------------------------------------------------------
-- University of Mississippi El E 386
-- Lab 3, Part A 
-- Engineer: Ben Mighall
-- 2/21/2018
-- 
-- This program creates a 3-bit counter that displays 0,1,4,7,6,2,3,5 in order,
-- and uses the pushbuttons as a clock and reset. Number is displayed on LEDs in binary format.
---------------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity threebitcounter is
    Port ( SW : in STD_LOGIC_VECTOR (4 downto 0);
           LED : out STD_LOGIC_VECTOR (3 downto 0);
           BTN : in STD_LOGIC_VECTOR (4 downto 0));
end threebitcounter;

architecture Behavioral of threebitcounter is

type state_type is (s0, s1, s2, s3, s4, s5, s6, s7);
signal current_state, next_state: state_type;

begin

p1: process(current_state, next_state, BTN(4), BTN(2))
begin

if (BTN(4) = '1') then     
   current_state <= s0;       
elsif (BTN(2)'event and BTN(2) = '1') then   
   if (current_state = s0) then
	   next_state <= s1;
   elsif (current_state = s1) then
	   next_state <= s2;
   elsif (current_state = s2) then
	   next_state <= s3;
   elsif (current_state = s3) then
	   next_state <= s4;
   elsif (current_state = s4) then
	   next_state <= s5;
   elsif (current_state = s5) then
	   next_state <= s6;
   elsif (current_state = s6) then
	   next_state <= s7;
   else
	   next_state <= s0;
   end if;
   current_state <= next_state;
end if;

if (current_state = s0) then 
   LED(2) <= '0'; 
   LED(1) <= '0'; 
   LED(0) <= '0'; 
elsif (current_state = s1) then
   LED(2) <= '0'; 
   LED(1) <= '0'; 
   LED(0) <= '1'; 
elsif (current_state = s2) then
   LED(2) <= '1'; 
   LED(1) <= '0'; 
   LED(0) <= '0'; 
elsif (current_state = s3) then
   LED(2) <= '1'; 
   LED(1) <= '1'; 
   LED(0) <= '1'; 
elsif (current_state = s4) then
   LED(2) <= '1'; 
   LED(1) <= '1'; 
   LED(0) <= '0';
elsif (current_state = s5) then
   LED(2) <= '0'; 
   LED(1) <= '1'; 
   LED(0) <= '0';
elsif (current_state = s6) then
   LED(2) <= '0'; 
   LED(1) <= '1'; 
   LED(0) <= '1';
elsif (current_state = s7) then
   LED(2) <= '1'; 
   LED(1) <= '0'; 
   LED(0) <= '1';
end if;

end process;
end Behavioral;
