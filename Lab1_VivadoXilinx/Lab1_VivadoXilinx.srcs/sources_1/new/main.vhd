library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    port (
        clk     : in  STD_LOGIC;
        GReset  : in  STD_LOGIC;
        LEFT_sw : in  STD_LOGIC;
        RIGHT_sw: in  STD_LOGIC;
        DISPLAY : out STD_LOGIC_VECTOR(7 downto 0)
    );
end main;

architecture structurel of main is

    component datapath
        port (
            clk        : in  STD_LOGIC;
            reset      : in  STD_LOGIC;
            loadDis    : in  STD_LOGIC;
            selDis     : in  STD_LOGIC_VECTOR(1 downto 0);
            loadL      : in  STD_LOGIC;
            selL       : in  STD_LOGIC;
            loadR      : in  STD_LOGIC;
            selR       : in  STD_LOGIC;
            DISPLAY_out: out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    component controlpath
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
    end component;

    signal sig_loadDis : STD_LOGIC;
    signal sig_selDis  : STD_LOGIC_VECTOR(1 downto 0);
    signal sig_loadL   : STD_LOGIC;
    signal sig_selL    : STD_LOGIC;
    signal sig_loadR   : STD_LOGIC;
    signal sig_selR    : STD_LOGIC;

begin

    U_CTRL : controlpath port map (
        clk      => clk,
        reset    => GReset,
        LEFT_sw  => LEFT_sw,
        RIGHT_sw => RIGHT_sw,
        loadDis  => sig_loadDis,
        selDis   => sig_selDis,
        loadL    => sig_loadL,
        selL     => sig_selL,
        loadR    => sig_loadR,
        selR     => sig_selR
    );

    U_DP : datapath port map (
        clk         => clk,
        reset       => GReset,
        loadDis     => sig_loadDis,
        selDis      => sig_selDis,
        loadL       => sig_loadL,
        selL        => sig_selL,
        loadR       => sig_loadR,
        selR        => sig_selR,
        DISPLAY_out => DISPLAY
    );

end structurel;