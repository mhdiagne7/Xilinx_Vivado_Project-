library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity controlpath is
    port (
        clk     : in  STD_LOGIC;
        reset   : in  STD_LOGIC;
        LEFT_sw : in  STD_LOGIC;
        RIGHT_sw: in  STD_LOGIC;
        loadDis : out STD_LOGIC;
        selDis  : out STD_LOGIC_VECTOR(1 downto 0);
        loadL   : out STD_LOGIC;
        selL    : out STD_LOGIC;
        loadR   : out STD_LOGIC;
        selR    : out STD_LOGIC
    );
end controlpath;

architecture structurel of controlpath is

    component bascule_D_AS
        port ( clk, reset, D : in STD_LOGIC; Q : out STD_LOGIC );
    end component;

    component bascule_D_AR
        port ( clk, reset, D : in STD_LOGIC; Q : out STD_LOGIC );
    end component;

    signal S0, S1, S2, S3, S4 : STD_LOGIC;
    signal D_S1, D_S2, D_S3, D_S4 : STD_LOGIC;

begin

    -- Logique de transition d'état
    D_S1 <= LEFT_sw and RIGHT_sw;
    D_S2 <= LEFT_sw and (not RIGHT_sw);
    D_S3 <= RIGHT_sw and (not LEFT_sw);
    D_S4 <= (not LEFT_sw) and (not RIGHT_sw);

    -- Les 5 bascules
    FF_S0 : bascule_D_AS port map (clk => clk, reset => reset, D => '0',   Q => S0);
    FF_S1 : bascule_D_AR port map (clk => clk, reset => reset, D => D_S1, Q => S1);
    FF_S2 : bascule_D_AR port map (clk => clk, reset => reset, D => D_S2, Q => S2);
    FF_S3 : bascule_D_AR port map (clk => clk, reset => reset, D => D_S3, Q => S3);
    FF_S4 : bascule_D_AR port map (clk => clk, reset => reset, D => D_S4, Q => S4);

    -- Signaux de commande
    loadDis   <= '1';
    loadL     <= S0 or S1 or S2;
    loadR     <= S0 or S1 or S3;
    selL      <= S1 or S2;
    selR      <= S1 or S3;
    selDis(0) <= S1 or S2;
    selDis(1) <= S1 or S3;

end structurel;