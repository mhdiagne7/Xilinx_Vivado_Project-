library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bascule_D_AR is
    port (
        clk    : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        D      : in  STD_LOGIC;
        Q      : out STD_LOGIC
    );
end bascule_D_AR;

architecture structurel of bascule_D_AR is
begin
    process(clk, reset)
    begin
        if reset = '1' then
            Q <= '0';
        elsif rising_edge(clk) then
            Q <= D;
        end if;
    end process;
end structurel;