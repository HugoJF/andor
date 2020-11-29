LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE ieee.numeric_std_unsigned.ALL;

ENTITY testbench IS
	GENERIC 
	(
		N : NATURAL := 6
	);
END testbench;

ARCHITECTURE tb OF testbench IS

	-- DUT component
	COMPONENT andor IS
		PORT 
		(
			A, B      : IN std_logic_vector(0 TO N - 1);
			operation : IN std_logic;
			S         : OUT std_logic_vector(0 TO N - 1)
		);
	END COMPONENT;

	SIGNAL op_in             : std_logic;
	SIGNAL a_in, b_in, s_out : std_logic_vector(0 TO N - 1);

BEGIN
	-- Connect DUT
	DUT : andor
	PORT MAP(a_in, b_in, op_in, s_out);

	PROCESS
	BEGIN
		-- ands
		a_in  <= "000001";
		b_in  <= "000001";
		op_in <= '0';
		WAIT FOR 1 ns;
		ASSERT(s_out = "000001") REPORT "Fail AND 1" SEVERITY error;
 
		a_in  <= "100001";
		b_in  <= "010001";
		op_in <= '0';
		WAIT FOR 1 ns;
		ASSERT(s_out = "000001") REPORT "Fail AND 2" SEVERITY error;
 
		a_in  <= "110010";
		b_in  <= "110001";
		op_in <= '0';
		WAIT FOR 1 ns;
		ASSERT(s_out = "110000") REPORT "Fail AND 3" SEVERITY error;
 
		-- subs
		a_in  <= "111001";
		b_in  <= "011000";
		op_in <= '1';
		WAIT FOR 1 ns;
		ASSERT(s_out = "111001") REPORT "Fail OR 1" SEVERITY error;
 
		a_in  <= "110011";
		b_in  <= "001001";
		op_in <= '1';
		WAIT FOR 1 ns;
		ASSERT(s_out = "111011") REPORT "Fail OR 2" SEVERITY error;
 
		a_in  <= "100000";
		b_in  <= "000001";
		op_in <= '1';
		WAIT FOR 1 ns;
		ASSERT(s_out = "100001") REPORT "Fail OR 3" SEVERITY error;
 
		WAIT;
	END PROCESS;
END tb;