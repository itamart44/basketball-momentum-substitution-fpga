library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
    Port (
        CLK100MHZ : in  STD_LOGIC;
        btnC      : in  STD_LOGIC;
        LED       : out STD_LOGIC_VECTOR (15 downto 0)
    );
end top;

architecture Behavioral of top is

    signal slow_clock : STD_LOGIC;
    signal reset_btn : STD_LOGIC;

    component clock_divider
        Port (
            clk_in  : in  STD_LOGIC;
            reset_n : in  STD_LOGIC;   -- ACTIVE LOW RESET
            clk_out : out STD_LOGIC
        );
    end component;

begin

    -- invert reset (button is active-high, divider reset is active-low)
    reset_btn <= not btnC;

    my_divider : clock_divider
        port map (
            clk_in  => CLK100MHZ,
            reset_n => reset_btn,
            clk_out => slow_clock
        );

    LED(0) <= slow_clock;
    LED(15 downto 1) <= (others => '0');

end Behavioral;
