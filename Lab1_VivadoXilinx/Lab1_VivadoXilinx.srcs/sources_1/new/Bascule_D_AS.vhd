library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bascule_D_AS is
    port (
        clk    : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        D      : in  STD_LOGIC;
        Q      : out STD_LOGIC
    );
end bascule_D_AS;

architecture structurel of bascule_D_AS is
begin
    process(clk, reset)
    begin
        if reset = '1' then
            Q <= '1';
        elsif rising_edge(clk) then
            Q <= D;
        end if;
    end process;
end structurel;