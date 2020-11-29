LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY andor IS
	GENERIC 
	(
		N : NATURAL := 6
	);
	PORT 
	(
		A, B      : IN std_logic_vector(0 TO N - 1);
		operation : IN std_logic;
		S         : OUT std_logic_vector(0 TO N - 1)
	);
END ENTITY;

ARCHITECTURE behavioral OF andor IS
BEGIN
	PROCESS (A, B, operation)
	BEGIN
		IF operation = '0' THEN
			S <= A AND B;
		ELSE
			S <= A OR B;
		END IF;
	END PROCESS;

END ARCHITECTURE;