library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top is
    Port (
        CLK100MHZ : in  STD_LOGIC;
        btnC      : in  STD_LOGIC;                 -- trigger event
        btnU      : in  STD_LOGIC;                 -- reset all players
        SW        : in  STD_LOGIC_VECTOR (5 downto 0); -- [3:0]=event, [5:4]=player
        LED       : out STD_LOGIC_VECTOR (15 downto 0)
    );
end top;

architecture Behavioral of top is

    ------------------------------------------------------------------
    -- Event layer
    ------------------------------------------------------------------
    signal event_valid : STD_LOGIC;
    signal event_value : signed(7 downto 0);

    ------------------------------------------------------------------
    -- Player selection
    ------------------------------------------------------------------
    signal player_sel : unsigned(1 downto 0); -- 0..3

    ------------------------------------------------------------------
    -- Player momentum storage
    ------------------------------------------------------------------
    type momentum_array_t is array (0 to 3) of signed(7 downto 0);
    signal momentum_arr : momentum_array_t := (others => (others => '0'));

    signal event_valid_p : STD_LOGIC_VECTOR(0 to 3);

    ------------------------------------------------------------------
    -- Team + relative momentum
    ------------------------------------------------------------------
    signal team_sum : signed(9 downto 0);

    type relative_array_t is array (0 to 3) of signed(9 downto 0);
    signal relative_arr : relative_array_t;

    signal above_team : STD_LOGIC_VECTOR(0 to 3);

    ------------------------------------------------------------------
    -- Components
    ------------------------------------------------------------------
    component event_decoder
        Port (
            clk         : in  STD_LOGIC;
            btnC        : in  STD_LOGIC;
            SW          : in  STD_LOGIC_VECTOR (3 downto 0);
            event_valid : out STD_LOGIC;
            event_value : out SIGNED (7 downto 0)
        );
    end component;

    component player_momentum
        Port (
            clk         : in  STD_LOGIC;
            reset       : in  STD_LOGIC;
            event_valid : in  STD_LOGIC;
            event_value : in  SIGNED(7 downto 0);
            momentum    : out SIGNED(7 downto 0)
        );
    end component;

begin

    ------------------------------------------------------------------
    -- Decode event
    ------------------------------------------------------------------
    decoder_inst : event_decoder
        port map (
            clk         => CLK100MHZ,
            btnC        => btnC,
            SW          => SW(3 downto 0),
            event_valid => event_valid,
            event_value => event_value
        );

    ------------------------------------------------------------------
    -- Select player
    ------------------------------------------------------------------
    player_sel <= unsigned(SW(5 downto 4));

    ------------------------------------------------------------------
    -- Route event to selected player only
    ------------------------------------------------------------------
    gen_valids : for i in 0 to 3 generate
        event_valid_p(i) <= event_valid when player_sel = i else '0';
    end generate;

    ------------------------------------------------------------------
    -- Player instances
    ------------------------------------------------------------------
    gen_players : for i in 0 to 3 generate
        player_i : player_momentum
            port map (
                clk         => CLK100MHZ,
                reset       => btnU,
                event_valid => event_valid_p(i),
                event_value => event_value,
                momentum    => momentum_arr(i)
            );
    end generate;

    ------------------------------------------------------------------
    -- Team momentum (sum)
    ------------------------------------------------------------------
    team_sum <= resize(momentum_arr(0), 10) +
                resize(momentum_arr(1), 10) +
                resize(momentum_arr(2), 10) +
                resize(momentum_arr(3), 10);

    ------------------------------------------------------------------
    -- Relative momentum per player
    -- relative = momentum*4 - team_sum
    ------------------------------------------------------------------
    gen_relative : for i in 0 to 3 generate
        relative_arr(i) <= (resize(momentum_arr(i), 10) sll 2) - team_sum;
    end generate;

    ------------------------------------------------------------------
    -- Above team flag (1??)
    ------------------------------------------------------------------
    gen_above : for i in 0 to 3 generate
        above_team(i) <= '1' when relative_arr(i) > 0 else '0';
    end generate;

    ------------------------------------------------------------------
    -- Temporary debug output (optional)
    ------------------------------------------------------------------
 -- ===== DEBUG DISPLAY =====
LED(7 downto 0) <= std_logic_vector(momentum_arr(to_integer(player_sel)));
LED(15 downto 8) <= (others => '0');





end Behavioral;
