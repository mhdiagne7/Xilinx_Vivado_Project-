library ieee;
use ieee.std_logic_1164.all;

-- Interface du tableau 3 de l'énoncé. Architecture à compléter.
-- Cette base ne réalise aucune opération arithmétique.
entity alu_top is
    port (
        GClock          : in  std_logic;
        GReset          : in  std_logic;
        CLK100MHZ       : in  std_logic;
        OperandA        : in  std_logic_vector(3 downto 0);
        OperandB        : in  std_logic_vector(3 downto 0);
        OperationSelect : in  std_logic_vector(1 downto 0);
        MuxOut          : out std_logic_vector(7 downto 0);
        CarryOut        : out std_logic;
        ZeroOut         : out std_logic;
        OverflowOut     : out std_logic;
        seg             : out std_logic_vector(6 downto 0);
        an              : out std_logic_vector(7 downto 0)
    );
end entity alu_top;

architecture structural of alu_top is
begin
    -- TODO : instancier les unités arithmétiques et le display_controller.
    -- Sorties volontairement non pilotées : ne pas programmer cette base.
end architecture structural;
