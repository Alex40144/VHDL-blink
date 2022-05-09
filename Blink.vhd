library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Blink is
    port(
        CLK : in     std_logic;
        LED0 : buffer std_logic := '0';
        LED1 : buffer std_logic := '0';
        LED2 : buffer std_logic := '0';
        LED3 : buffer std_logic := '0';
        LED4 : buffer std_logic := '0';
        LED5 : buffer std_logic := '0';
        LED6 : buffer std_logic := '0';
        LED7 : buffer std_logic := '0'
    );
end entity Blink;

architecture rtl of Blink is
    signal counter : integer range 0 to 1000000 := 0;
    signal LEDs : std_logic_vector (7 downto 0) := "00001000";
    
begin

    blink: process(clk)
    variable direction : BOOLEAN := true;
    begin
        if rising_edge(clk) then
            if counter < 500000 then
                counter <= counter + 1;
            else
                counter <= 0;
                if(unsigned(LEDs) = "00000001" or (unsigned(LEDs) = "10000000")) then
                    direction := NOT direction;
                end if;
                if (direction) then
                    LEDs <= b"0" & LEDs(7 downto 1);
                else
                    LEDs <= LEDs(6 downto 0) & b"0";
                end if;
                
            end if;
        end if;
    end process blink;
    
    LED0 <= LEDs (0);
    LED1 <= LEDs (1);
    LED2 <= LEDs (2);
    LED3 <= LEDs (3);
    LED4 <= LEDs (4);
    LED5 <= LEDs (5);
    LED6 <= LEDs (6);
    LED7 <= LEDs (7);
end architecture rtl;